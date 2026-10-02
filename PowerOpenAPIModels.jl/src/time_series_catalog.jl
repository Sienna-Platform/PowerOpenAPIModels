"""
    validate_time_series_catalog(doc::SystemDocument, catalog_json::AbstractString)

Check a time series store's catalog, the JSON array of its association rows, against the
document's `time_series_associations`. Every catalog row is decoded with the full schema
check. Each document row must then match a catalog row by identity, carry the same
`association_id`, and agree on every other wire field except `uri` and `data_hash`, which a
store may assign differently. Catalog rows the document does not mention are allowed.

Identity is `(owner_id, owner_category, time_series_type, name, resolution, interval,
features)`, the store's own uniqueness key; `owner_type` is a denormalized label. Throws
`DocumentFormatError` naming the row and, for drift, the differing fields.
"""
function validate_time_series_catalog(doc::SystemDocument, catalog_json::AbstractString)
    catalog = _rows(TimeSeriesAssociation, JSON.parse(catalog_json))
    by_identity = Dict(_ts_identity(row.value) => row.value for row in catalog)
    for assoc in doc.time_series_associations
        row = assoc.value
        identity = _ts_identity(row)
        store_row = get(by_identity, identity, nothing)
        isnothing(store_row) &&
            _catalog_error(identity, "has no matching row in the time series catalog")
        row.association_id == store_row.association_id || _catalog_error(
            identity,
            "has association_id=$(row.association_id) in the document but " *
            "association_id=$(store_row.association_id) in the time series catalog",
        )
        drift = _ts_drift(row, store_row)
        isempty(drift) || _catalog_error(
            identity, "drifted from the time series catalog on: $(join(drift, ", "))",
        )
    end
    return nothing
end

function _catalog_error(identity, problem::AbstractString)
    throw(
        InfrastructureCoreOpenAPIModels.DocumentFormatError(
            "time series association $(identity.time_series_type) owner " *
            "$(identity.owner_id) \"$(identity.name)\" $problem",
        ),
    )
end

# A field the row's type lacks (`NonSequentialTimeSeries` has no `resolution`) and an unset
# one both read as `nothing`, so they match.
_ts_field(row, field::Symbol) = hasproperty(row, field) ? getproperty(row, field) : nothing

_ts_identity(row) = (
    owner_id=row.owner_id,
    owner_category=_wire(row.owner_category),
    time_series_type=row.time_series_type,
    name=row.name,
    resolution=_ts_field(row, :resolution),
    interval=_ts_field(row, :interval),
    features=_wire(row.features),
)

# Wire form, so values compare by content rather than by wrapper identity.
_wire(value) = _encode_row(value)
_wire(::Union{Nothing, OpenAPI.Runtime.Absent}) = nothing

"""Wire field names on which two rows differ, excluding `uri` and `data_hash`."""
function _ts_drift(doc_row, store_row)
    a = _encode_row(doc_row)
    b = _encode_row(store_row)
    fields = setdiff(union(keys(a), keys(b)), ("uri", "data_hash"))
    return sort!([f for f in fields if get(a, f, nothing) != get(b, f, nothing)])
end
