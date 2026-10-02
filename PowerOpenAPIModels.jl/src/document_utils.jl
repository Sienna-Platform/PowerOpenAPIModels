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
Encode one model row to a plain JSON-safe object.

The native (post-1.0) generator has no `JSON.lower` hook the way the old 0.2.x runtime did
(where `JSON.lower(::OpenAPI.APIModel)` let `JSON.print` walk a raw model instance directly,
skipping unset fields on its own); each generated module instead installs a method on the
shared `OpenAPI.Runtime._encode` generic function, so encoding is explicit here.

Skips the schema check `_encode` runs. A row here was built from typed structs, so what the
check adds is range and pattern constraints, and reading checks every row against the full
schema anyway.
"""
_encode_row(model) = InfrastructureCoreOpenAPIModels._encode_unvalidated(model)

"""
Function barrier: one specialization per concrete component vector, each row encoded to a
plain JSON-safe object.
"""
_bucket(components::Vector) = [_encode_row(c) for c in components]

"""
Deserialize one row into `T`.
"""
_row(::Type{T}, raw::AbstractDict) where {T} =
    OpenAPI.Runtime._decode(T, Dict{String, Any}(raw))

function _rows(::Type{T}, raws) where {T}
    return T[_row(T, raw) for raw in raws]
end

_encode_optional(::Nothing) = nothing
_encode_optional(model) = _encode_row(model)

_put_optional!(::AbstractDict, ::AbstractString, ::Nothing) = nothing
function _put_optional!(tree::AbstractDict, key::AbstractString, value)
    tree[key] = value
    return nothing
end

function _put_nonempty!(tree::AbstractDict, key::AbstractString, value)
    if !isempty(value)
        tree[key] = value
    end
    return nothing
end

"""
The `id` of a model row.

Errors when it is unset: every component and supplemental attribute in a document is
referenced by id, so a row without one cannot be linked to anything and is malformed input
rather than an absence to tolerate.
"""
function _model_id(model)
    if !hasproperty(model, :id)
        throw(
            InfrastructureCoreOpenAPIModels.DocumentFormatError(
                "$(nameof(typeof(model))) has no id field, so it cannot appear in a document",
            ),
        )
    end
    return _require_id(getproperty(model, :id), model)
end

_require_id(id::Integer, model) = Int(id)
function _require_id(::Union{Nothing, OpenAPI.Runtime.Absent}, model)
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
    return get(doc.components, String(type_name), Vector{Any}())
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
Note that ids `1:n` are already in use, so `next_id!` does not reissue them.

For a writer that assigns ids itself (reproducing a document's original ids, say) rather
than drawing every one from `next_id!`.
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
function add_component!(doc::DocumentType, component::T) where {T}
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
type, and the association carries both the link and the `attribute_type` a reader needs to
pick a converter. The row mirrors infrastore's `supplemental_attribute_associations` catalog
row field-for-field, so it also carries the component's type name as a denormalized label —
resolved from the document, which is why the component must be added before its attribute.

Plant-family groupings (shaft/penstock/PCC/exclusion-group) and combined-cycle HRSG
assignments are recorded separately, via [`add_plant_association!`](@ref) and
[`add_combined_cycle_association!`](@ref); service membership via
[`add_service_association!`](@ref). None of the three reuses this table.
"""
function add_supplemental_attribute!(
    doc::DocumentType,
    attribute::Any,
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

This is recorded debt, not an extension point — every key here is a field the data model
should eventually name. Empty extras are dropped rather than stored as an empty object.
"""
function set_ext!(doc::DocumentType, component_id::Integer, extras::AbstractDict)
    if isempty(extras)
        return nothing
    end
    doc.ext[Int(component_id)] = Dict{String, Any}(extras)
    return nothing
end

"""
The extras recorded for `component_id`, or an empty dictionary if none were.
"""
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

# ── schema version ──────────────────────────────────────────────────────────────────

"""
Raised when a document's `schema_version` makes it unreadable by this package.

`outcome` is one of `:missing`, `:malformed`, `:incompatible`, `:newer`; `reader` is this
package's schema version and `document` the document's (JSON-encoded when malformed, empty
when missing). `message` is the canonical text from the schema repository's versioning doc.
"""
struct SchemaVersionError <: Exception
    outcome::Symbol
    reader::String
    document::String
    message::String
end

function Base.showerror(io::IO, e::SchemaVersionError)
    return print(io, "SchemaVersionError: ", e.message)
end

const _VERSION_PATTERN =
    r"\A(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)(-[0-9A-Za-z.-]+)?\z"

_is_version(::Any) = false
_is_version(s::AbstractString) = occursin(_VERSION_PATTERN, s)

# (major, minor, patch, prerelease), prerelease empty when absent. `s` must be valid. BigInt:
# a valid version may have components past Int64.
function _parse_version(s::AbstractString)
    m = match(_VERSION_PATTERN, s)
    pre = something(m.captures[4], "-")
    return (
        parse(BigInt, m.captures[1]),
        parse(BigInt, m.captures[2]),
        parse(BigInt, m.captures[3]),
        String(pre[2:end]),
    )
end

# The compatibility line: MAJOR from 1.0, 0.MINOR for 0.x.
function _line_name(version::Tuple)
    if iszero(version[1])
        return "0.$(version[2])"
    end
    return string(version[1])
end

function _classify_versions(reader::Tuple, document::Tuple)
    if (!isempty(reader[4]) || !isempty(document[4])) && reader != document
        return :incompatible
    end
    if _line_name(reader) != _line_name(document)
        return :incompatible
    end
    if document[1:3] > reader[1:3]
        return :newer
    end
    if document[1:3] < reader[1:3]
        return :upgradable
    end
    return :current
end

function _check_schema_version(reader::AbstractString, raw::AbstractDict)
    if !haskey(raw, "schema_version")
        return :missing
    end
    document = raw["schema_version"]
    if !_is_version(document)
        return :malformed
    end
    return _classify_versions(_parse_version(reader), _parse_version(document))
end

"""
Classify `raw`'s `schema_version` against this package's: `:missing`, `:malformed`,
`:incompatible`, `:newer`, `:upgradable`, or `:current`.

Pure, and meant for the raw parsed JSON before any decode. Only `:upgradable` and `:current`
are readable.
"""
check_schema_version(raw::AbstractDict) = _check_schema_version(READER_VERSION, raw)
check_schema_version(raw) = _require_object(raw, "check_schema_version")

function _version_message(::Val{:missing}, reader, document)
    return "document has no schema_version: it predates versioning; re-export it with a " *
           "current producer (psy5 bundles: PowerSystemsUpdater)"
end

function _version_message(::Val{:malformed}, reader, document)
    return "document schema_version $document is not a valid version"
end

function _version_message(::Val{:newer}, reader, document)
    return "document written by schema $document; this reader understands up to $reader; " *
           "update the model package to one built from >= $document"
end

function _version_message(::Val{:incompatible}, reader, document)
    r = _parse_version(reader)
    d = _parse_version(document)
    if !isempty(r[4]) || !isempty(d[4])
        return "document written by schema $document cannot be read by schema $reader: " *
               "dev builds read only their own output"
    end
    return "document written by schema $document (line $(_line_name(d))) cannot be read " *
           "by schema $reader (line $(_line_name(r))): documents do not cross " *
           "compatibility lines; migrating between lines is a separate upgrade tool's " *
           "job (psy5 bundles: PowerSystemsUpdater)"
end

function _document_label(raw::AbstractDict)
    if !haskey(raw, "schema_version")
        return ""
    end
    document = raw["schema_version"]
    if _is_version(document)
        return String(document)
    end
    return JSON.json(document)
end

"""
The shared read-path gate: run on the raw parsed JSON before any decode. Returns the
document's schema version, or throws [`SchemaVersionError`](@ref).
"""
function _checked_schema_version(raw::AbstractDict, reader::AbstractString)
    outcome = _check_schema_version(reader, raw)
    if outcome in (:upgradable, :current)
        return String(raw["schema_version"])
    end
    document = _document_label(raw)
    throw(
        SchemaVersionError(
            outcome,
            String(reader),
            document,
            _version_message(Val(outcome), reader, document),
        ),
    )
end

# Canonical key order shared with the other bindings: `schema_version` first, the rest sorted.
function _canonical_tree(tree::AbstractDict{String, Any})
    ordered = JSON.Object{String, Any}()
    ordered["schema_version"] = tree["schema_version"]
    for key in sort!(collect(keys(tree)))
        if key != "schema_version"
            ordered[key] = tree[key]
        end
    end
    return ordered
end

_require_object(raw::AbstractDict, path::AbstractString) = raw
function _require_object(raw, path::AbstractString)
    throw(
        InfrastructureCoreOpenAPIModels.DocumentFormatError(
            "$path: document root must be a JSON object, got $(typeof(raw))",
        ),
    )
end

function _parse_document_file(path::AbstractString)
    return _require_object(JSON.parsefile(path; dicttype=Dict{String, Any}), path)
end

"""
The schema version `doc` was read at, or this package's own for a document built here.
"""
get_source_schema_version(doc::DocumentType) = doc.source_schema_version[]

# ── writing ──────────────────────────────────────────────────────────────────────

_target_version(::Val{:current}, doc::DocumentType, reader::AbstractString) = reader
function _target_version(::Val{:source}, doc::DocumentType, reader::AbstractString)
    return get_source_schema_version(doc)
end
function _target_version(::Val{S}, doc::DocumentType, reader::AbstractString) where {S}
    throw(ArgumentError("schema_version must be :current or :source, got :$S"))
end

_validate_target(::Val{:current}, doc, tree, reader, bundles_dir) = nothing
function _validate_target(::Val{:source}, doc, tree, reader, bundles_dir)
    source_version = get_source_schema_version(doc)
    if source_version == reader
        return nothing
    end
    _require_validator()
    bundle_path = joinpath(bundles_dir, source_version, _bundle_name(doc) * ".json")
    if !isfile(bundle_path)
        throw(
            InfrastructureCoreOpenAPIModels.DocumentFormatError(
                "cannot write at source schema $source_version: no strict bundle at " *
                "$bundle_path; write with schema_version = :current to stamp $reader instead",
            ),
        )
    end
    problems =
        _bundle_problems(tree, JSON.parsefile(bundle_path; dicttype=Dict{String, Any}))
    if !isempty(problems)
        throw(
            InfrastructureCoreOpenAPIModels.DocumentFormatError(
                "document cannot be written at source schema $source_version; " *
                "$(length(problems)) path(s) are not valid under it:\n  " *
                join(problems, "\n  ") *
                "\nwrite with schema_version = :current to stamp $reader instead",
            ),
        )
    end
    return nothing
end

# Implemented by the PowerOpenAPIModelsJSONSchemaExt extension: one "path: reason" string per
# offending JSON path. This fallback is what runs when JSONSchema.jl is not loaded.
function _bundle_problems(tree, bundle)
    throw(_validator_error())
end

# Set by the extension's `__init__`.
const _VALIDATOR_LOADED = Ref(false)

function _validator_error()
    return InfrastructureCoreOpenAPIModels.DocumentFormatError(
        "writing at a source schema older than this package's needs a validator: " *
        "install JSONSchema.jl and load it (`using JSONSchema`), or write with " *
        "schema_version = :current",
    )
end

function _require_validator()
    if !_VALIDATOR_LOADED[]
        throw(_validator_error())
    end
    return nothing
end

function _write_document(
    doc::DocumentType,
    path::AbstractString,
    pretty::Bool,
    force::Bool,
    target::Val,
    reader::AbstractString,
    bundles_dir::AbstractString,
)
    validate_document(doc)
    if isfile(path) && !force
        throw(
            InfrastructureCoreOpenAPIModels.DocumentFormatError(
                "$path already exists; pass force = true to overwrite",
            ),
        )
    end
    tree = document_tree(doc; schema_version=_target_version(target, doc, reader))
    _validate_target(target, doc, tree, reader, bundles_dir)
    open(path, "w") do io
        if pretty
            JSON.print(io, tree, 2)
        else
            JSON.print(io, tree)
        end
        # Trailing newline: POSIX text-file convention, and it is what the Python and
        # TypeScript writers emit — without it a document written here differs from the same
        # document written there by exactly one byte.
        print(io, "\n")
    end
    return nothing
end

"""
Write `doc` to `path` as JSON.

`schema_version = :current` (default) stamps this package's schema version. `:source` stamps
the version the document was read at ([`get_source_schema_version`](@ref)): identical to
`:current` when they match, otherwise the encoded document is validated against that
version's strict bundle and the write fails listing every offending path, never dropping
anything. That validation needs JSONSchema.jl loaded.

`path` names the JSON file only. The sidecar files named by `time_series_storage_file` (and
`base_system_file`, for a portfolio) are not written here — this package handles neither base
systems nor time series values — so the caller writes them and sets those basenames, which
keeps the file layout the caller's choice.

Validates first: a document that fails [`validate_document`](@ref) must not reach disk.
"""
function write_document(
    doc::DocumentType,
    path::AbstractString;
    pretty::Bool=false,
    force::Bool=false,
    schema_version::Symbol=:current,
)
    return _write_document(
        doc,
        path,
        pretty,
        force,
        Val(schema_version),
        READER_VERSION,
        BUNDLES_DIR,
    )
end
