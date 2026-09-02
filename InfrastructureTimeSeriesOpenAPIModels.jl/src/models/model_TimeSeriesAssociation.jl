@doc "    TimeSeriesAssociation\n\nMetadata linking one time series to the component or supplemental attribute that owns it — the JSON form of a row in the store's `time_series_associations` catalog table. A closed set of six canonical types owned by the data layer: two static (SingleTimeSeries on a regular grid, NonSequentialTimeSeries on explicit irregular timestamps) and four forecasts. The type decides which timing fields the row carries, which is why each is its own schema rather than one row with everything nullable.\n\nDense values never appear here. `uri` names the store location that holds them; `data_hash` optionally carries a content hash of that array. Other content hashes (features_hash, timestamps_hash) remain store-internal and deliberately absent."
struct TimeSeriesAssociation
    value::Union{Deterministic,DeterministicSingleTimeSeries,NonSequentialTimeSeries,Probabilistic,Scenarios,SingleTimeSeries,TimeSeriesAssociation1,TimeSeriesAssociation2,TimeSeriesAssociation3,TimeSeriesAssociation4,TimeSeriesAssociation5,TimeSeriesAssociation6}
end
_decode(::Type{TimeSeriesAssociation}, value) = _decode(TimeSeriesAssociation, value, true)
function _decode(::Type{TimeSeriesAssociation}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesAssociation"), value, "decoding TimeSeriesAssociation"; direction = :neutral)
    object = _object(value, "TimeSeriesAssociation")
    tag = get(object, "time_series_type", ABSENT)
    tag isa Absent || tag isa AbstractString || throw(DecodeError("discriminator value must be a string for TimeSeriesAssociation"))
    selected = get(Dict(
        "Deterministic" => (Deterministic, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/Deterministic")),
        "DeterministicSingleTimeSeries" => (DeterministicSingleTimeSeries, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/DeterministicSingleTimeSeries")),
        "NonSequentialTimeSeries" => (NonSequentialTimeSeries, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/NonSequentialTimeSeries")),
        "Probabilistic" => (Probabilistic, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/Probabilistic")),
        "Scenarios" => (Scenarios, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/Scenarios")),
        "SingleTimeSeries" => (SingleTimeSeries, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/SingleTimeSeries")),
    ), tag isa Absent ? "" : String(tag), nothing)
    selected === nothing && throw(DecodeError("unknown discriminator value $(repr(tag)) for TimeSeriesAssociation"))
    !_openapi_validate || _schema_valid(_SPEC, selected[2], value; direction = :neutral) || throw(DecodeError("discriminator-selected schema did not validate for TimeSeriesAssociation"))
    return TimeSeriesAssociation(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::TimeSeriesAssociation)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesAssociation"), output, "encoding TimeSeriesAssociation"; direction = :neutral)
end
