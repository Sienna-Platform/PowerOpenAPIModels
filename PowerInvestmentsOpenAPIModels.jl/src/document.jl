# Hand-written (NOT generated): the PortfolioDocument container and its type-specific JSON I/O.
#
# The sibling of PowerCoreOpenAPIModels' SystemDocument, for investment portfolios. Like that
# container, `PortfolioDocument.components` is a map from type name to an array of
# heterogeneous component objects (the portfolio's regional aggregations, policy requirements,
# and candidate technologies), resolved by name through the InfrastructureCore model-type
# registry. `financial_data` and `requirements_associations` are concrete types from this
# package; `time_series_associations` is the one concretely typed foreign table, hence the
# InfrastructureTimeSeries dependency.
#
# `SiennaSchemas/Investments/PortfolioDocument.json` stays authoritative for the shape (and for
# every non-Julia binding); the umbrella PowerOpenAPIModels test suite checks this struct
# against it.
#
# Plumbing shared with SystemDocument — the type-agnostic helpers, the operations on fields both
# containers share (`get_components`, `add_component!`, `next_id!`, `write_document`, ...), and
# schema versioning — lives in InfrastructureCoreOpenAPIModels' `document.jl`, dispatched on
# `AbstractDocument`, and is imported below so callers reach it through this module too. Only
# PortfolioDocument-specific code is here.
#
# Differences from SystemDocument, per the schema:
#   adds    `data_source`, `aggregation` (required), `financial_data`, `investment_schedule`,
#           `base_system_file`
#   keeps   `requirements_associations`, an Investments-layer `RequirementAssociation` table
#           linking each policy requirement to a member subject to it, with its own
#           `requirements_membership` dedup cache
#   drops   `frequency`, `plant_associations`, `combined_cycle_associations`,
#           `service_associations`, `trading_hub_associations` (and their membership caches)
#
# There is no document-level unit system or base power: a portfolio records every value in
# natural units. This file NEVER touches time series values, and it does not read or write the
# base system — `base_system_file` is a sidecar name this carries and does not resolve.
#
# `read_portfolio_document` is named distinctly rather than overloading `read_document`, because
# the two differ only in return type and Julia cannot dispatch on that.
#
# Nothing here is exported: accessors are reached qualified
# (`PowerInvestmentsOpenAPIModels.get_components(doc, "SupplyTechnology")`).

import InfrastructureCoreOpenAPIModels:
    AbstractDocument,
    validate_document,
    document_tree,
    _bundle_name,
    add_component!,
    add_supplemental_attribute!,
    add_time_series_association!,
    check_schema_version,
    component_type_names,
    get_components,
    get_description,
    get_ext,
    get_name,
    get_source_schema_version,
    get_supplemental_attributes,
    get_time_series_storage_file,
    next_id!,
    reserve_ids!,
    set_ext!,
    write_document,
    READER_VERSION,
    _attribute_ids,
    _attribute_type_by_id,
    _bucket,
    _canonical_tree,
    _check_ref,
    _checked_schema_version,
    _component_ids,
    _highest_id,
    _model_id,
    _optional,
    _optional_string,
    _parse_document_file,
    _put_optional!,
    _require,
    _row,
    _rows,
    _typed_attribute,
    _encode_optional
using InfrastructureTimeSeriesOpenAPIModels: TimeSeriesAssociation

# ── the container ────────────────────────────────────────────────────────────────

"""
A whole serialized investment portfolio: candidate technologies, regional aggregations, and
policy requirements bucketed by type name, the supplemental attributes describing them, the
association tables linking them, the portfolio-wide financial parameters, and the names of the
sidecar files holding the base power system and the time series values.

There is no document-level unit system or base power: every value is recorded in natural units.
The only unit marker that ever appears is an embedded cost payload's own `power_units` (on a
CostCurve or FuelCurve), intrinsic to that curve.

`components` values are concrete `Vector{T}`, so per-type iteration stays inferable behind a
function barrier even though the field itself is untyped.

`counter`, `component_types_by_id`, `requirements_membership`, and `source_schema_version` (the
schema version the document was read at, or this package's own for a new one; see
[`get_source_schema_version`](@ref)) are build-time scaffolding and are not serialized:
everything they hold is recoverable from the emitted rows. `counter`'s ids
come from one counter shared by every type; `component_types_by_id` lets
[`add_supplemental_attribute!`](@ref) check membership in O(1) instead of rescanning
`components`, and `requirements_membership` lets [`add_requirement_association!`](@ref) reject a
duplicate `(requirement_id, entity_id)` pair in O(1) instead of rescanning
`requirements_associations` — each add path is the sole writer of its cache, and
[`portfolio_document_from_json`](@ref) rebuilds both once after a bulk load.

`requirements_associations` is a concrete `Vector{RequirementAssociation}`, a type this package
defines (unlike `SystemDocument`'s Operations-layer association tables): each row's `requirement_id` names the policy requirement and its `entity_id` names a
member the requirement applies to. Callers construct the row and hand it to
[`add_requirement_association!`](@ref).

`aggregation` is the qualified type name of the regional aggregation the portfolio groups its
regions by — a type identifier resolved by the consumer, not a component in the document, and
required.

`name`, `description`, `data_source`, `financial_data`, `investment_schedule`,
`base_system_file`, and `time_series_storage_file` are `nothing` when the document omits them.
`base_system_file` and `time_series_storage_file` are required keys with nullable values, so
they are always emitted (as JSON `null` when absent); the rest are omitted entirely when
`nothing`. `investment_schedule` is a model output — the schedule of capacity installations
produced by solving the portfolio — absent from an inputs-only portfolio and carried opaquely,
its internal shape not constrained here.
"""
struct PortfolioDocument <: AbstractDocument
    name::Union{Nothing, String}
    description::Union{Nothing, String}
    data_source::Union{Nothing, String}
    aggregation::String
    financial_data::Union{Nothing, PortfolioFinancialData}
    components::Dict{String, Vector}
    supplemental_attributes::Vector{Any}
    supplemental_attribute_associations::Vector{SupplementalAttributeAssociation}
    requirements_associations::Vector{RequirementAssociation}
    investment_schedule::Union{Nothing, Dict{String, Any}}
    time_series_associations::Vector{TimeSeriesAssociation}
    ext::Dict{Int, Dict{String, Any}}
    base_system_file::Union{Nothing, String}
    time_series_storage_file::Union{Nothing, String}
    counter::Base.RefValue{Int}
    component_types_by_id::Dict{Int, String}
    requirements_membership::Set{Tuple{Int, Int}}
    source_schema_version::Base.RefValue{String}
end

"""
Build an empty portfolio document. `aggregation` is required — a portfolio always groups its
regions by some aggregation type, and the schema marks the field required — so it is passed at
construction rather than filled later.
"""
function PortfolioDocument(
    aggregation::AbstractString;
    name=nothing,
    description=nothing,
    data_source=nothing,
    financial_data=nothing,
    investment_schedule=nothing,
    base_system_file=nothing,
    time_series_storage_file=nothing,
)
    return PortfolioDocument(
        _optional_string(name),
        _optional_string(description),
        _optional_string(data_source),
        String(aggregation),
        financial_data,
        Dict{String, Vector}(),
        Vector{Any}(),
        Vector{SupplementalAttributeAssociation}(),
        Vector{RequirementAssociation}(),
        _optional_schedule(investment_schedule),
        Vector{TimeSeriesAssociation}(),
        Dict{Int, Dict{String, Any}}(),
        _optional_string(base_system_file),
        _optional_string(time_series_storage_file),
        Ref(0),
        Dict{Int, String}(),
        Set{Tuple{Int, Int}}(),
        Ref(READER_VERSION),
    )
end

_optional_schedule(::Nothing) = nothing
_optional_schedule(value::AbstractDict) = Dict{String, Any}(value)

get_data_source(doc::PortfolioDocument) = doc.data_source
get_aggregation(doc::PortfolioDocument) = doc.aggregation
get_financial_data(doc::PortfolioDocument) = doc.financial_data
get_investment_schedule(doc::PortfolioDocument) = doc.investment_schedule
get_base_system_file(doc::PortfolioDocument) = doc.base_system_file

# ── builder (PortfolioDocument-specific association writers) ─────────────────────────

"""
Record that `assoc` (a caller-constructed `RequirementAssociation`) links a policy requirement to
one member subject to it: `requirement_id` names the requirement and `entity_id` names the member.

One row per (requirement, member) pair. Duplicate pairs are rejected rather than collapsed —
checked in O(1) against `requirements_membership` rather than rescanning
`requirements_associations`.

This is the document's one guard against a duplicate association row; callers must not rescan
`requirements_associations` themselves before calling this.
"""
function add_requirement_association!(doc::PortfolioDocument, assoc::RequirementAssociation)
    requirement_id = assoc.requirement_id
    entity_id = assoc.entity_id
    key = (Int(requirement_id), Int(entity_id))
    if key in doc.requirements_membership
        throw(
            InfrastructureCoreOpenAPIModels.DocumentFormatError(
                "duplicate requirement membership: requirement_id=$requirement_id " *
                "entity_id=$entity_id",
            ),
        )
    end
    push!(doc.requirements_associations, assoc)
    push!(doc.requirements_membership, key)
    return nothing
end

# ── validation ─────────────────────────────────────────────────────────────────────

"""
Check that the document is internally consistent: `aggregation` present, ids unique, every
reference resolvable.

Run before writing, so a consumer can trust a document regardless of which producer wrote it.
Converter *coverage* is deliberately not checked here — this package does not know which types
a given consumer can convert.
"""
function validate_document(doc::PortfolioDocument)
    if isempty(doc.aggregation)
        throw(
            InfrastructureCoreOpenAPIModels.DocumentFormatError(
                "portfolio document has an empty aggregation type name",
            ),
        )
    end

    component_ids = _component_ids(doc)
    attribute_ids = _attribute_ids(doc)
    shared = intersect(component_ids, attribute_ids)
    if !isempty(shared)
        throw(
            InfrastructureCoreOpenAPIModels.DocumentFormatError(
                "id(s) $(join(sort(collect(shared)), ", ")) are used by both a component " *
                "and a supplemental attribute — one counter serves both",
            ),
        )
    end
    all_ids = union(component_ids, attribute_ids)

    component_types = doc.component_types_by_id
    for assoc in doc.supplemental_attribute_associations
        _check_ref(
            attribute_ids,
            assoc.attribute_id,
            "SupplementalAttributeAssociation",
            "component_id=$(assoc.component_id)",
        )
        _check_ref(
            component_ids,
            assoc.component_id,
            "SupplementalAttributeAssociation",
            "attribute_id=$(assoc.attribute_id)",
        )
        # The denormalized label must agree with the bucket actually holding the component.
        expected_type = component_types[assoc.component_id]
        if assoc.component_type != expected_type
            throw(
                InfrastructureCoreOpenAPIModels.DocumentFormatError(
                    "SupplementalAttributeAssociation attribute_id=$(assoc.attribute_id): " *
                    "component_type \"$(assoc.component_type)\" does not match the type " *
                    "\"$(expected_type)\" holding component_id=$(assoc.component_id)",
                ),
            )
        end
    end

    # requirement_id and entity_id both name components: a policy requirement is a component,
    # and entity_id names another component subject to it — neither is a supplemental attribute.
    for assoc in doc.requirements_associations
        _check_ref(
            component_ids,
            assoc.requirement_id,
            "RequirementAssociation",
            "entity_id=$(assoc.entity_id)",
        )
        _check_ref(
            component_ids,
            assoc.entity_id,
            "RequirementAssociation",
            "requirement_id=$(assoc.requirement_id)",
        )
    end

    # `.value` because `TimeSeriesAssociation` is the oneOf wrapper: the per-type structs hold
    # the columns, and `OpenAPI.OneOfAPIModel` forwards no field access.
    for assoc in doc.time_series_associations
        row = assoc.value
        _check_ref(all_ids, row.owner_id, "TimeSeriesAssociation", "name=$(row.name)")
    end

    for id in sort(collect(keys(doc.ext)))
        listed = join(sort(collect(keys(doc.ext[id]))), ", ")
        _check_ref(all_ids, id, "ext entry", "keys=$listed")
    end

    if !isempty(doc.time_series_associations) && isnothing(doc.time_series_storage_file)
        throw(
            InfrastructureCoreOpenAPIModels.DocumentFormatError(
                "portfolio document has $(length(doc.time_series_associations)) time series " *
                "association(s) but names no time_series_storage_file",
            ),
        )
    end
    return nothing
end

# ── writing ──────────────────────────────────────────────────────────────────────

"""
The document as a tree of plain JSON-safe values, ready for a single JSON encoding pass.

`base_system_file` and `time_series_storage_file` are required-but-nullable keys, so they are
always present (as JSON `null` when absent); `name`/`description`/`data_source`/
`financial_data`/`investment_schedule` are omitted entirely when unset; `ext` is always
written. `schema_version` comes first, then the remaining keys sorted.
"""
function document_tree(
    doc::PortfolioDocument;
    schema_version::AbstractString=READER_VERSION,
)
    components = Dict{String, Any}()
    for type_name in component_type_names(doc)
        components[type_name] = _bucket(doc.components[type_name])
    end
    tree = Dict{String, Any}()
    tree["schema_version"] = String(schema_version)
    _put_optional!(tree, "name", doc.name)
    _put_optional!(tree, "description", doc.description)
    _put_optional!(tree, "data_source", doc.data_source)
    tree["aggregation"] = doc.aggregation
    _put_optional!(tree, "financial_data", _encode_optional(doc.financial_data))
    tree["components"] = components
    # Every array goes through `_bucket`, exactly as `system_document.jl`'s SystemDocument tree
    # does. Handing the structs over raw instead would serialize each one field by field,
    # including the `additional_properties` passthrough that `_encode` exists to splat --
    # so a read/write round trip grew an empty `"additional_properties": {}` on every
    # association row.
    tree["supplemental_attributes"] = _bucket(doc.supplemental_attributes)
    tree["supplemental_attribute_associations"] =
        _bucket(doc.supplemental_attribute_associations)
    tree["requirements_associations"] = _bucket(doc.requirements_associations)
    _put_optional!(tree, "investment_schedule", doc.investment_schedule)
    tree["time_series_associations"] = _bucket(doc.time_series_associations)
    # Keyed by component id, which is unique across every type.
    tree["ext"] = Dict(string(id) => extras for (id, extras) in doc.ext)
    tree["base_system_file"] = doc.base_system_file
    tree["time_series_storage_file"] = doc.time_series_storage_file
    return _canonical_tree(tree)
end

_bundle_name(::PortfolioDocument) = "PortfolioDocument"

# ── reading ──────────────────────────────────────────────────────────────────────

"""
Build a [`PortfolioDocument`](@ref) from already-parsed JSON.

The schema version is checked first ([`check_schema_version`](@ref)); every `components` key
must name a registered model type — an unknown type name errors rather than being skipped,
since dropping the rows would lose data silently.
"""
function portfolio_document_from_json(raw::AbstractDict; source::AbstractString="document")
    return _portfolio_document_from_json(raw, source, READER_VERSION)
end

function _portfolio_document_from_json(
    raw::AbstractDict,
    source::AbstractString,
    reader::AbstractString,
)
    doc_version = _checked_schema_version(raw, reader)
    financial_data_raw = _optional(raw, "financial_data")
    doc = PortfolioDocument(
        String(_require(raw, "aggregation", source));
        name=_optional(raw, "name"),
        description=_optional(raw, "description"),
        data_source=_optional(raw, "data_source"),
        financial_data=isnothing(financial_data_raw) ? nothing :
                       _row(PortfolioFinancialData, financial_data_raw),
        investment_schedule=_optional(raw, "investment_schedule"),
        base_system_file=_require(raw, "base_system_file", source),
        time_series_storage_file=_require(raw, "time_series_storage_file", source),
    )

    for (type_name, rows) in _require(raw, "components", source)
        doc.components[String(type_name)] =
            _rows(InfrastructureCoreOpenAPIModels.model_type(type_name), rows)
    end
    # Bulk-loaded above rather than through `add_component!`, so `component_types_by_id` needs
    # its one rebuild pass here.
    for (type_name, components) in doc.components
        for component in components
            doc.component_types_by_id[_model_id(component)] = type_name
        end
    end

    # The flat `supplemental_attributes` array carries no per-row type, so each row's type
    # comes from the association that points at it.
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
    append!(
        doc.requirements_associations,
        _rows(RequirementAssociation, _require(raw, "requirements_associations", source)),
    )
    # Bulk-loaded above rather than through `add_requirement_association!`, so
    # `requirements_membership` needs its one rebuild pass here.
    for assoc in doc.requirements_associations
        push!(
            doc.requirements_membership,
            (Int(assoc.requirement_id), Int(assoc.entity_id)),
        )
    end
    append!(
        doc.time_series_associations,
        _rows(TimeSeriesAssociation, _require(raw, "time_series_associations", source)),
    )

    # `ext` is optional in the schema (an absent `ext` means the producer mapped every field).
    for (id, extras) in get(raw, "ext", Dict{String, Any}())
        set_ext!(doc, parse(Int, String(id)), extras)
    end

    reserve_ids!(doc, _highest_id(doc))
    validate_document(doc)
    doc.source_schema_version[] = doc_version
    return doc
end

"""
Read a [`PortfolioDocument`](@ref) from a JSON file.

Only the JSON file is read. Any base-system sidecar named by `base_system_file` and any HDF5
sidecar named by `time_series_storage_file` are left alone for the consumer to resolve relative
to `path`.

Named distinctly from `read_document` (the SystemDocument reader) because the two differ only
in return type, which Julia cannot dispatch on.
"""
function read_portfolio_document(path::AbstractString)
    if !isfile(path)
        throw(
            InfrastructureCoreOpenAPIModels.DocumentFormatError(
                "no such portfolio document: $path",
            ),
        )
    end
    raw = _parse_document_file(path)
    return portfolio_document_from_json(raw; source=path)
end

"""
Read the PortfolioDocument at `src` and write it to `dst` stamped with this package's schema
version. Fails unless `src` is current or upgradable.
"""
function upgrade_portfolio_document(
    src::AbstractString,
    dst::AbstractString;
    force::Bool=false,
)
    doc = read_portfolio_document(src)
    write_document(doc, dst; force=force)
    return nothing
end
