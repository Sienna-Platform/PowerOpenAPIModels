# Hand-written (NOT generated): the SystemDocument container and its JSON I/O.
#
# Everything else in this package is emitted by openapi-generator from SiennaSchemas. This
# file is the exception, because `SystemDocument.components` is a map from type name to an
# array of heterogeneous component objects and the julia-client generator cannot express
# typed buckets for it. `SiennaSchemas/Core/SystemDocument.json` stays authoritative for the
# shape (and for every non-Julia binding); `test/validate.jl` checks this struct against it.
#
# `scripts/reorganize.jl` emits the `include` for this file, so a regeneration keeps it. It
# also emits one `register.jl` per domain package (see `scripts/emit_registry.jl`) that
# populates the type registry below from each domain's models.
#
# This file NEVER touches time series values. `time_series_associations` are metadata rows
# like any other association, and `time_series_storage_file` is a name this carries and does
# not resolve. Reading or writing that HDF5 file belongs to the consumer.
#
# Nothing here is exported: the accessor names (`get_components`, `get_base_power`, ...)
# deliberately collide with PowerSystems' own, so callers reach them qualified
# (`PowerCoreOpenAPIModels.get_components(doc, "ACBus")`).

"""
Unit conventions a document may be written in, from the schemas' `unit_system` enum.

There is no system-base option: per-unit data historically on the system base records that
base in the component's own `base_power` and rides as `DEVICE_BASE`.
"""
const DOCUMENT_UNIT_SYSTEMS = ("NATURAL_UNITS", "DEVICE_BASE")

"""
Raised for any malformed document: a missing required field, an unregistered type name,
an unresolved reference, or a duplicate id.
"""
struct DocumentFormatError <: Exception
    msg::String
end

Base.showerror(io::IO, e::DocumentFormatError) = print(io, "DocumentFormatError: ", e.msg)

# ── type registry ────────────────────────────────────────────────────────────────
# Type name -> OpenAPI model type, so `read_document` can turn a `components` bucket into
# concrete structs. Populated from each domain package's `__init__` rather than at include
# time: mutations another module makes to this Dict during its precompilation are not saved,
# so include-time registration would leave the registry empty at runtime.

const MODEL_TYPES = Dict{String, Type}()

"""
Register `T` under its bare type name so documents naming it can be deserialized.

Called from each domain package's generated `register.jl`. Re-registering the same type is a
no-op; two different types with one name is a build error, not something to resolve at read
time.
"""
function register_model_type!(::Type{T}) where {T <: OpenAPI.APIModel}
    name = string(nameof(T))
    if haskey(MODEL_TYPES, name) && MODEL_TYPES[name] !== T
        throw(
            DocumentFormatError(
                "two OpenAPI model types are named \"$name\": $(MODEL_TYPES[name]) and $T",
            ),
        )
    end
    MODEL_TYPES[name] = T
    return nothing
end

"""
Whether a model type is registered under `name`.
"""
has_model_type(name::AbstractString) = haskey(MODEL_TYPES, String(name))

"""
The model type registered under `name`.

Errors naming the value rather than skipping it: a document that names a type this build has
no model for cannot be read faithfully, and dropping the rows would lose data silently.
"""
function model_type(name::AbstractString)
    key = String(name)
    if !haskey(MODEL_TYPES, key)
        throw(
            DocumentFormatError(
                "no registered OpenAPI model type named \"$key\" — is the domain package " *
                "that defines it loaded? $(length(MODEL_TYPES)) type(s) are registered",
            ),
        )
    end
    return MODEL_TYPES[key]
end

# ── the container ────────────────────────────────────────────────────────────────

"""
A whole serialized power system: components bucketed by type name, the association tables
linking them, and the name of the HDF5 sidecar holding time series values.

`components` values are concrete `Vector{T}`, so per-type iteration stays inferable behind a
function barrier even though the field itself is untyped.

`counter` is build-time scaffolding and is not serialized: every id it has handed out is
recoverable from the emitted rows. Ids come from one counter shared by every type, matching
SiennaGridDB's `entities` table where an id identifies a component without also needing its
type — which is why a bus number cannot double as an id.

`name`, `description`, `frequency`, and `time_series_storage_file` are `nothing` when the
document omits them; the schema marks all four optional, and a consumer with its own default
(PowerSystems' `System` frequency, for instance) should apply it rather than have this
container invent one.
"""
struct SystemDocument
    base_power::Float64
    unit_system::String
    name::Union{Nothing, String}
    description::Union{Nothing, String}
    frequency::Union{Nothing, Float64}
    components::Dict{String, Vector}
    supplemental_attributes::Vector{OpenAPI.APIModel}
    supplemental_attribute_associations::Vector{SupplementalAttributeAssociation}
    # The plant/combined-cycle/service row types are generated into
    # PowerOperationsOpenAPIModels, which depends on this package rather than the other way
    # round, so these cannot be typed concretely here. `supplemental_attributes` already sets
    # the precedent; rows are resolved by registered name on read.
    plant_associations::Vector{OpenAPI.APIModel}
    combined_cycle_associations::Vector{OpenAPI.APIModel}
    service_associations::Vector{OpenAPI.APIModel}
    time_series_associations::Vector{TimeSeriesAssociation}
    ext::Dict{Int, Dict{String, Any}}
    time_series_storage_file::Union{Nothing, String}
    counter::Base.RefValue{Int}
end

"""
Build an empty document on `base_power`.

`unit_system` is fixed at construction and read by every writer, so one document cannot hold
a mixture of conventions.
"""
function SystemDocument(
    base_power::Real;
    unit_system::AbstractString="NATURAL_UNITS",
    name=nothing,
    description=nothing,
    frequency=nothing,
    time_series_storage_file=nothing,
)
    if !(unit_system in DOCUMENT_UNIT_SYSTEMS)
        throw(
            DocumentFormatError(
                "unit_system must be one of $(join(DOCUMENT_UNIT_SYSTEMS, ", ")); " *
                "got \"$unit_system\"",
            ),
        )
    end
    if !(base_power > 0)
        throw(DocumentFormatError("base_power must be positive; got $base_power"))
    end
    return SystemDocument(
        Float64(base_power),
        String(unit_system),
        name,
        description,
        _optional_float(frequency),
        Dict{String, Vector}(),
        Vector{OpenAPI.APIModel}(),
        Vector{SupplementalAttributeAssociation}(),
        Vector{OpenAPI.APIModel}(),
        Vector{OpenAPI.APIModel}(),
        Vector{OpenAPI.APIModel}(),
        Vector{TimeSeriesAssociation}(),
        Dict{Int, Dict{String, Any}}(),
        _optional_string(time_series_storage_file),
        Ref(0),
    )
end

_optional_float(::Nothing) = nothing
_optional_float(value::Real) = Float64(value)
_optional_string(::Nothing) = nothing
_optional_string(value::AbstractString) = String(value)

get_base_power(doc::SystemDocument) = doc.base_power
get_unit_system(doc::SystemDocument) = doc.unit_system
get_name(doc::SystemDocument) = doc.name
get_description(doc::SystemDocument) = doc.description
get_frequency(doc::SystemDocument) = doc.frequency
get_time_series_storage_file(doc::SystemDocument) = doc.time_series_storage_file

"""
Whether values are stored per unit rather than in the schemas' natural units.

`DEVICE_BASE` reproduces PowerSystems' storage convention. The `x-unit` annotations still
name the natural unit either way, which is why the document states the convention it was
written in.
"""
uses_per_unit(doc::SystemDocument) = doc.unit_system == "DEVICE_BASE"

"""
Type names present, sorted, so serialized output is deterministic across builds.
"""
component_type_names(doc::SystemDocument) = sort!(collect(keys(doc.components)))

"""
Components of one type, in the order they were added.
"""
function get_components(doc::SystemDocument, type_name::AbstractString)
    return get(doc.components, String(type_name), Vector{OpenAPI.APIModel}())
end

"""
Supplemental attributes of one type, in the order they were added.
"""
function get_supplemental_attributes(doc::SystemDocument, type_name::AbstractString)
    wanted = String(type_name)
    return [a for a in doc.supplemental_attributes if string(nameof(typeof(a))) == wanted]
end

# ── builder ──────────────────────────────────────────────────────────────────────

"""
Allocate an id from the document-wide counter.
"""
function next_id!(doc::SystemDocument)
    doc.counter[] += 1
    return doc.counter[]
end

"""
Note that ids `1:n` are already in use, so `next_id!` does not reissue them.

For a writer that assigns ids itself (reproducing a document's original ids, say) rather
than drawing every one from `next_id!`.
"""
function reserve_ids!(doc::SystemDocument, highest::Int)
    if highest > doc.counter[]
        doc.counter[] = highest
    end
    return doc.counter[]
end

"""
Add a component to its type's bucket.
"""
function add_component!(doc::SystemDocument, component::T) where {T <: OpenAPI.APIModel}
    bucket = get!(doc.components, string(nameof(T))) do
        return Vector{T}()
    end
    push!(bucket, component)
    return nothing
end

"""
Record a supplemental attribute and the entity it describes.

Attributes are held in one flat list rather than bucketed by type: nothing iterates them per
type, and the association carries both the link and the `attribute_type` a reader needs to
pick a converter.

This row carries the link and the type discriminator only. Plant, combined-cycle, and
service memberships have their own tables — [`add_plant_association!`](@ref),
[`add_combined_cycle_association!`](@ref), and [`add_service_association!`](@ref) — because
the group number and CT/CA role belong to those shapes rather than to every attribute.
"""
function add_supplemental_attribute!(
    doc::SystemDocument,
    attribute::OpenAPI.APIModel,
    entity_id::Integer,
)
    push!(doc.supplemental_attributes, attribute)
    push!(
        doc.supplemental_attribute_associations,
        SupplementalAttributeAssociation(;
            attribute_id=_model_id(attribute),
            entity_id=Int(entity_id),
            attribute_type=string(nameof(typeof(attribute))),
        ),
    )
    return nothing
end

"""
Record which group of a power plant a generating unit belongs to: a shaft, penstock, PCC, or
exclusion group. The plant attribute itself is recorded by
[`add_supplemental_attribute!`](@ref); this only adds the membership row.
"""
function add_plant_association!(doc::SystemDocument, assoc::OpenAPI.APIModel)
    push!(doc.plant_associations, assoc)
    return nothing
end

"""
Record which HRSG of a `CombinedCycleBlock` a CT or CA unit feeds into or receives from.
"""
function add_combined_cycle_association!(doc::SystemDocument, assoc::OpenAPI.APIModel)
    push!(doc.combined_cycle_associations, assoc)
    return nothing
end

"""
Record one component's contribution to a service. One row per (service, member) pair.
"""
function add_service_association!(doc::SystemDocument, assoc::OpenAPI.APIModel)
    push!(doc.service_associations, assoc)
    return nothing
end

"""
Record one time series metadata row. The values themselves are the consumer's business.
"""
function add_time_series_association!(doc::SystemDocument, assoc::TimeSeriesAssociation)
    push!(doc.time_series_associations, assoc)
    return nothing
end

"""
Record source data that no schema field claims, against the component it came from.

This is recorded debt, not an extension point — every key here is a field the data model
should eventually name. Empty extras are dropped rather than stored as an empty object.
"""
function set_ext!(doc::SystemDocument, component_id::Integer, extras::AbstractDict)
    if isempty(extras)
        return nothing
    end
    doc.ext[Int(component_id)] = Dict{String, Any}(extras)
    return nothing
end

function get_ext(doc::SystemDocument, component_id::Integer)
    return get(doc.ext, Int(component_id), Dict{String, Any}())
end

# ── ids and validation ───────────────────────────────────────────────────────────

"""
The `id` of a model row.

Errors when it is unset: every component and supplemental attribute in a document is
referenced by id, so a row without one cannot be linked to anything and is malformed input
rather than an absence to tolerate.
"""
function _model_id(model::OpenAPI.APIModel)
    if !hasproperty(model, :id)
        throw(
            DocumentFormatError(
                "$(nameof(typeof(model))) has no id field, so it cannot appear in a document",
            ),
        )
    end
    return _require_id(getproperty(model, :id), model)
end

_require_id(id::Integer, ::OpenAPI.APIModel) = Int(id)
function _require_id(::Nothing, model::OpenAPI.APIModel)
    throw(DocumentFormatError("$(nameof(typeof(model))) has an unset id"))
end

"""
Every component id in the document, erroring on a duplicate.
"""
function _component_ids(doc::SystemDocument)
    ids = Set{Int}()
    for type_name in component_type_names(doc)
        for component in doc.components[type_name]
            id = _model_id(component)
            if id in ids
                throw(
                    DocumentFormatError(
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

function _attribute_ids(doc::SystemDocument)
    ids = Set{Int}()
    for attribute in doc.supplemental_attributes
        id = _model_id(attribute)
        if id in ids
            throw(DocumentFormatError("duplicate supplemental attribute id=$id"))
        end
        push!(ids, id)
    end
    return ids
end

function _check_ref(ids::Set{Int}, id, what::AbstractString, context::AbstractString)
    if !(id in ids)
        throw(
            DocumentFormatError(
                "$what references unresolved id=$id ($context) — every reference must name " *
                "a row present in the same document",
            ),
        )
    end
    return nothing
end

"""
Check that the document is internally consistent: ids unique, every reference resolvable.

Run before writing, so a consumer can trust a document regardless of which producer wrote
it. Converter *coverage* is deliberately not checked here — this package does not know which
types a given consumer can convert.
"""
function validate_document(doc::SystemDocument)
    component_ids = _component_ids(doc)
    attribute_ids = _attribute_ids(doc)
    shared = intersect(component_ids, attribute_ids)
    if !isempty(shared)
        throw(
            DocumentFormatError(
                "id(s) $(join(sort(collect(shared)), ", ")) are used by both a component " *
                "and a supplemental attribute — one counter serves both",
            ),
        )
    end
    all_ids = union(component_ids, attribute_ids)

    # `entity_id` always names a component: the thing described, the unit in the plant, or
    # the member contributing to the service. The other end differs per table —
    # `attribute_id`/`plant_id` name a supplemental attribute, while a service is itself a
    # component — so each is checked against the set it can legally point into.
    for assoc in doc.supplemental_attribute_associations
        _check_ref(
            attribute_ids,
            assoc.attribute_id,
            "SupplementalAttributeAssociation",
            "entity_id=$(assoc.entity_id)",
        )
        _check_ref(
            component_ids,
            assoc.entity_id,
            "SupplementalAttributeAssociation",
            "attribute_id=$(assoc.attribute_id)",
        )
    end

    for (rows, what, owner_field, owner_ids) in (
        (doc.plant_associations, "PlantAssociation", :plant_id, attribute_ids),
        (
            doc.combined_cycle_associations,
            "CombinedCycleAssociation",
            :plant_id,
            attribute_ids,
        ),
        (doc.service_associations, "ServiceAssociation", :service_id, component_ids),
    )
        for assoc in rows
            owner = getproperty(assoc, owner_field)
            _check_ref(owner_ids, owner, what, "entity_id=$(assoc.entity_id)")
            _check_ref(component_ids, assoc.entity_id, what, "$owner_field=$owner")
        end
    end

    for assoc in doc.time_series_associations
        _check_ref(all_ids, assoc.owner_id, "TimeSeriesAssociation", "name=$(assoc.name)")
    end

    for id in sort(collect(keys(doc.ext)))
        listed = join(sort(collect(keys(doc.ext[id]))), ", ")
        _check_ref(all_ids, id, "ext entry", "keys=$listed")
    end

    if !isempty(doc.time_series_associations) && isnothing(doc.time_series_storage_file)
        throw(
            DocumentFormatError(
                "document has $(length(doc.time_series_associations)) time series " *
                "association(s) but names no time_series_storage_file",
            ),
        )
    end
    return nothing
end

# ── writing ──────────────────────────────────────────────────────────────────────

"""
Function barrier: one specialization per concrete component vector.
"""
_bucket(components::Vector{T}) where {T <: OpenAPI.APIModel} = collect(components)

"""
The document as a tree of model objects, ready for a single JSON encoding pass.

`JSON.lower(::OpenAPI.APIModel)` yields a wrapper that iterates properties and skips the
unset ones, so nesting and optional fields need no handling here. Encoding a row on its own
with `OpenAPI.to_json` would return a `String` and produce a double-encoded document, which
is why the whole tree is built first and printed once.
"""
function document_tree(doc::SystemDocument)
    components = Dict{String, Any}()
    for type_name in component_type_names(doc)
        components[type_name] = _bucket(doc.components[type_name])
    end
    tree = Dict{String, Any}(
        "base_power" => doc.base_power,
        "unit_system" => doc.unit_system,
        "components" => components,
        "supplemental_attributes" => doc.supplemental_attributes,
        "supplemental_attribute_associations" =>
            doc.supplemental_attribute_associations,
        "plant_associations" => doc.plant_associations,
        "combined_cycle_associations" => doc.combined_cycle_associations,
        "service_associations" => doc.service_associations,
        "time_series_associations" => doc.time_series_associations,
        # Keyed by component id, which is unique across every type.
        "ext" => Dict(string(id) => extras for (id, extras) in doc.ext),
        "time_series_storage_file" => doc.time_series_storage_file,
    )
    _put_optional!(tree, "name", doc.name)
    _put_optional!(tree, "description", doc.description)
    _put_optional!(tree, "frequency", doc.frequency)
    return tree
end

_put_optional!(::AbstractDict, ::AbstractString, ::Nothing) = nothing
function _put_optional!(tree::AbstractDict, key::AbstractString, value)
    tree[key] = value
    return nothing
end

"""
Write `doc` to `path` as JSON.

`path` names the JSON file only. The HDF5 sidecar is not written here — this package does
not handle time series values — so the caller writes it and sets
`time_series_storage_file` to its basename, which keeps the file layout the caller's choice.

Validates first: a document that fails [`validate_document`](@ref) must not reach disk.
"""
function write_document(
    doc::SystemDocument,
    path::AbstractString;
    pretty::Bool=false,
    force::Bool=false,
)
    validate_document(doc)
    if isfile(path) && !force
        throw(DocumentFormatError("$path already exists; pass force = true to overwrite"))
    end
    tree = document_tree(doc)
    open(path, "w") do io
        if pretty
            JSON.print(io, tree, 2)
        else
            JSON.print(io, tree)
        end
    end
    return nothing
end

# ── reading ──────────────────────────────────────────────────────────────────────

function _require(raw::AbstractDict, key::AbstractString, where_::AbstractString)
    if !haskey(raw, key)
        throw(DocumentFormatError("$where_ is missing the required field \"$key\""))
    end
    return raw[key]
end

_optional(raw::AbstractDict, key::AbstractString) = get(raw, key, nothing)

"""
Deserialize one row into `T`.
"""
_row(::Type{T}, raw::AbstractDict) where {T} = OpenAPI.from_json(T, Dict{String, Any}(raw))

function _rows(::Type{T}, raws) where {T}
    return T[_row(T, raw) for raw in raws]
end

"""
Build a [`SystemDocument`](@ref) from already-parsed JSON.

Every `components` key must name a registered model type — an unknown type name errors
rather than being skipped, since dropping the rows would lose data silently.
"""
function document_from_json(raw::AbstractDict; source::AbstractString="document")
    doc = SystemDocument(
        Float64(_require(raw, "base_power", source));
        unit_system=String(_require(raw, "unit_system", source)),
        name=_optional(raw, "name"),
        description=_optional(raw, "description"),
        frequency=_optional(raw, "frequency"),
        time_series_storage_file=_optional(raw, "time_series_storage_file"),
    )

    for (type_name, rows) in _require(raw, "components", source)
        doc.components[String(type_name)] = _rows(model_type(type_name), rows)
    end

    # The flat `supplemental_attributes` array carries no per-row type, so each row's type
    # comes from the association that points at it. Indexed once rather than rescanned per
    # row: RTS carries 623 of each.
    attribute_types = _attribute_type_by_id(raw, source)
    for row in _require(raw, "supplemental_attributes", source)
        push!(doc.supplemental_attributes, _typed_attribute(row, attribute_types, source))
    end

    append!(
        doc.supplemental_attribute_associations,
        _rows(
            SupplementalAttributeAssociation,
            _require(raw, "supplemental_attribute_associations", source),
        ),
    )
    # Resolved by registered name: the row types are generated into
    # PowerOperationsOpenAPIModels, which this package cannot name directly.
    for (key, type_name) in (
        ("plant_associations", "PlantAssociation"),
        ("combined_cycle_associations", "CombinedCycleAssociation"),
        ("service_associations", "ServiceAssociation"),
    )
        append!(
            getproperty(doc, Symbol(key)),
            _rows(model_type(type_name), _require(raw, key, source)),
        )
    end

    append!(
        doc.time_series_associations,
        _rows(TimeSeriesAssociation, _require(raw, "time_series_associations", source)),
    )

    # `ext` is optional in the schema (an absent `ext` means the producer mapped every
    # field), unlike the other bucket fields above which the schema does mark required.
    for (id, extras) in get(raw, "ext", Dict{String, Any}())
        set_ext!(doc, parse(Int, String(id)), extras)
    end

    reserve_ids!(doc, _highest_id(doc))
    validate_document(doc)
    return doc
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
            DocumentFormatError(
                "supplemental attribute id=$id has no association naming its " *
                "attribute_type, so its type cannot be resolved",
            ),
        )
    end
    return _row(model_type(attribute_types[id]), row)
end

function _highest_id(doc::SystemDocument)
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

"""
Read a [`SystemDocument`](@ref) from a JSON file.

Only the JSON file is read. Any HDF5 sidecar named by `time_series_storage_file` is left
alone for the consumer to resolve relative to `path`.
"""
function read_document(path::AbstractString)
    if !isfile(path)
        throw(DocumentFormatError("no such document: $path"))
    end
    raw = JSON.parsefile(path; dicttype=Dict{String, Any})
    return document_from_json(raw; source=path)
end
