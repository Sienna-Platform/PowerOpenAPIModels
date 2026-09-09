# Hand-written (NOT generated): plumbing shared by the SystemDocument and PortfolioDocument
# containers, factored out of document.jl / document_portfolio.jl so the two copies cannot
# drift.
#
# Two kinds of shared code live here:
#
#   1. Type-agnostic helpers that take no document at all (`_optional`, `_require`, `_row`,
#      `_model_id`, `_check_ref`, `_attribute_type_by_id`, ...): they read raw JSON or a single
#      model row and are used verbatim by both containers' readers and validators.
#
#   2. Document operations whose bodies touch only the fields BOTH containers share
#      (`components`, `supplemental_attributes`, `supplemental_attribute_associations`,
#      `time_series_associations`, `ext`, `counter`, `component_types_by_id`,
#      `time_series_storage_file`). These dispatch on `DocumentType`, the union of the two
#      concrete types, so the single method serves both.
#
# Type-SPECIFIC operations stay in their own files: `validate_document`, `document_tree`, and
# the `*_from_json` / `read_*` readers, because the two field sets diverge — SystemDocument
# carries a `frequency` and plant/combined-cycle/service/trading-hub associations;
# PortfolioDocument carries an `aggregation`, `financial_data`, an `investment_schedule`, and a
# `base_system_file`.
#
# Included AFTER document.jl and document_portfolio.jl so `DocumentType` can name both structs.
# The methods here call — and are called by — functions defined in those files; Julia resolves
# those calls at run time, so include order only has to satisfy the union's need for both
# struct definitions to already exist.

const DocumentType = Union{SystemDocument, PortfolioDocument}

# ── type-agnostic helpers ──────────────────────────────────────────────────────────

_optional_float(::Nothing) = nothing
_optional_float(value::Real) = Float64(value)
_optional_string(::Nothing) = nothing
_optional_string(value::AbstractString) = String(value)

_optional(raw::AbstractDict, key::AbstractString) = get(raw, key, nothing)

function _require(raw::AbstractDict, key::AbstractString, where_::AbstractString)
    if !haskey(raw, key)
        throw(
            InfrastructureCoreOpenAPIModels.DocumentFormatError(
                "$where_ is missing the required field \"$key\"",
            ),
        )
    end
    return raw[key]
end

"""
Deserialize one row into `T`.
"""
_row(::Type{T}, raw::AbstractDict) where {T} = OpenAPI.from_json(T, Dict{String, Any}(raw))

function _rows(::Type{T}, raws) where {T}
    return T[_row(T, raw) for raw in raws]
end

_put_optional!(::AbstractDict, ::AbstractString, ::Nothing) = nothing
function _put_optional!(tree::AbstractDict, key::AbstractString, value)
    tree[key] = value
    return nothing
end

"""
Function barrier: one specialization per concrete component vector.
"""
_bucket(components::Vector{T}) where {T <: OpenAPI.APIModel} = collect(components)

"""
The `id` of a model row.

Errors when it is unset: every component and supplemental attribute in a document is
referenced by id, so a row without one cannot be linked to anything and is malformed input
rather than an absence to tolerate.
"""
function _model_id(model::OpenAPI.APIModel)
    if !hasproperty(model, :id)
        throw(
            InfrastructureCoreOpenAPIModels.DocumentFormatError(
                "$(nameof(typeof(model))) has no id field, so it cannot appear in a document",
            ),
        )
    end
    return _require_id(getproperty(model, :id), model)
end

_require_id(id::Integer, ::OpenAPI.APIModel) = Int(id)
function _require_id(::Nothing, model::OpenAPI.APIModel)
    throw(
        InfrastructureCoreOpenAPIModels.DocumentFormatError(
            "$(nameof(typeof(model))) has an unset id",
        ),
    )
end

function _check_ref(ids::Set{Int}, id, what::AbstractString, context::AbstractString)
    if !(id in ids)
        throw(
            InfrastructureCoreOpenAPIModels.DocumentFormatError(
                "$what references unresolved id=$id ($context) — every reference must name " *
                "a row present in the same document",
            ),
        )
    end
    return nothing
end

"""
Index `attribute_id -> attribute_type` from the association rows.

`supplemental_attributes` is flat and untyped, unlike `components`, so a row has no type of
its own to read; `SupplementalAttributeAssociation.attribute_type` is the only discriminator.
"""
function _attribute_type_by_id(raw::AbstractDict, source::AbstractString)
    types = Dict{Int, String}()
    for assoc in _require(raw, "supplemental_attribute_associations", source)
        id = Int(_require(assoc, "attribute_id", "$source association"))
        types[id] = String(_require(assoc, "attribute_type", "$source association"))
    end
    return types
end

"""
Deserialize one supplemental attribute row using its indexed `attribute_type`.
"""
function _typed_attribute(
    row::AbstractDict,
    attribute_types::Dict{Int, String},
    source::AbstractString,
)
    id = Int(_require(row, "id", "$source supplemental attribute"))
    if !haskey(attribute_types, id)
        throw(
            InfrastructureCoreOpenAPIModels.DocumentFormatError(
                "supplemental attribute id=$id has no association naming its " *
                "attribute_type, so its type cannot be resolved",
            ),
        )
    end
    return _row(InfrastructureCoreOpenAPIModels.model_type(attribute_types[id]), row)
end

# ── shared document operations (dispatch on DocumentType) ────────────────────────────

"""
Type names present, sorted, so serialized output is deterministic across builds.
"""
component_type_names(doc::DocumentType) = sort!(collect(keys(doc.components)))

"""
Components of one type, in the order they were added.
"""
function get_components(doc::DocumentType, type_name::AbstractString)
    return get(doc.components, String(type_name), Vector{OpenAPI.APIModel}())
end

"""
Supplemental attributes of one type, in the order they were added.
"""
function get_supplemental_attributes(doc::DocumentType, type_name::AbstractString)
    wanted = String(type_name)
    return [a for a in doc.supplemental_attributes if string(nameof(typeof(a))) == wanted]
end

"""
Allocate an id from the document-wide counter.
"""
function next_id!(doc::DocumentType)
    doc.counter[] += 1
    return doc.counter[]
end

"""
Note that ids `1:highest` are already in use, so `next_id!` does not reissue them.

For a writer that assigns ids itself (reproducing a document's original ids, say) rather than
drawing every one from `next_id!`.
"""
function reserve_ids!(doc::DocumentType, highest::Int)
    if highest > doc.counter[]
        doc.counter[] = highest
    end
    return doc.counter[]
end

"""
Add a component to its type's bucket.

Also records the component's id in `component_types_by_id`, the cache
[`add_supplemental_attribute!`](@ref) reads instead of rescanning `components`.
"""
function add_component!(doc::DocumentType, component::T) where {T <: OpenAPI.APIModel}
    type_name = string(nameof(T))
    bucket = get!(doc.components, type_name) do
        return Vector{T}()
    end
    push!(bucket, component)
    doc.component_types_by_id[_model_id(component)] = type_name
    return nothing
end

"""
Record a supplemental attribute and the component it describes.

Attributes are held in one flat list rather than bucketed by type: nothing iterates them per
type, and the association carries both the link and the `attribute_type` a reader needs to pick
a converter. The row mirrors infrastore's `supplemental_attribute_associations` catalog row
field-for-field, so it also carries the component's type name as a denormalized label — resolved
from the document, which is why the component must be added before its attribute.
"""
function add_supplemental_attribute!(
    doc::DocumentType,
    attribute::OpenAPI.APIModel,
    component_id::Integer,
)
    if !haskey(doc.component_types_by_id, Int(component_id))
        throw(
            InfrastructureCoreOpenAPIModels.DocumentFormatError(
                "add_supplemental_attribute!: component id $(component_id) is not in the " *
                "document — add the component before associating an attribute with it",
            ),
        )
    end
    push!(doc.supplemental_attributes, attribute)
    push!(
        doc.supplemental_attribute_associations,
        SupplementalAttributeAssociation(;
            component_id=Int(component_id),
            component_type=doc.component_types_by_id[Int(component_id)],
            attribute_id=_model_id(attribute),
            attribute_type=string(nameof(typeof(attribute))),
        ),
    )
    return nothing
end

"""
Record one time series metadata row. The values themselves are the consumer's business.
"""
function add_time_series_association!(doc::DocumentType, assoc::TimeSeriesAssociation)
    push!(doc.time_series_associations, assoc)
    return nothing
end

"""
Record source data that no schema field claims, against the component it came from.

Recorded debt, not an extension point — every key here is a field the data model should
eventually name. Empty extras are dropped rather than stored as an empty object.
"""
function set_ext!(doc::DocumentType, component_id::Integer, extras::AbstractDict)
    if isempty(extras)
        return nothing
    end
    doc.ext[Int(component_id)] = Dict{String, Any}(extras)
    return nothing
end

function get_ext(doc::DocumentType, component_id::Integer)
    return get(doc.ext, Int(component_id), Dict{String, Any}())
end

"""
Every component id in the document, erroring on a duplicate.
"""
function _component_ids(doc::DocumentType)
    ids = Set{Int}()
    for type_name in component_type_names(doc)
        for component in doc.components[type_name]
            id = _model_id(component)
            if id in ids
                throw(
                    InfrastructureCoreOpenAPIModels.DocumentFormatError(
                        "duplicate id=$id (second occurrence on a $type_name) — ids are " *
                        "unique across every type, not per type",
                    ),
                )
            end
            push!(ids, id)
        end
    end
    return ids
end

function _attribute_ids(doc::DocumentType)
    ids = Set{Int}()
    for attribute in doc.supplemental_attributes
        id = _model_id(attribute)
        if id in ids
            throw(
                InfrastructureCoreOpenAPIModels.DocumentFormatError(
                    "duplicate supplemental attribute id=$id",
                ),
            )
        end
        push!(ids, id)
    end
    return ids
end

function _highest_id(doc::DocumentType)
    highest = 0
    for type_name in component_type_names(doc)
        for component in doc.components[type_name]
            highest = max(highest, _model_id(component))
        end
    end
    for attribute in doc.supplemental_attributes
        highest = max(highest, _model_id(attribute))
    end
    return highest
end
