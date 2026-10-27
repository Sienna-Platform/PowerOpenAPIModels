"""
    TimeSeriesAssociation

Metadata linking one time series to the component or supplemental attribute that owns it — the JSON form of a row in the store's `time_series_associations` catalog table. A closed set of six canonical types owned by the data layer: two static (SingleTimeSeries on a regular grid, NonSequentialTimeSeries on explicit irregular timestamps) and four forecasts. The type decides which timing fields the row carries, which is why each is its own schema rather than one row with everything nullable.

Dense values never appear here. `uri` names the store location that holds them; `data_hash` optionally carries a content hash of that array. A NonSequentialTimeSeries adds `timestamps_uri`, the same kind of locator for its explicit time axis, which is likewise stored rather than carried. Content hashes themselves (features_hash, timestamps_hash) remain store-internal and deliberately absent — a locator names where something is, which is not the same as exposing the store's own address for it.
"""
struct TimeSeriesAssociation <: OneOfAPIModel
    value::Union{
        Deterministic,
        DeterministicSingleTimeSeries,
        NonSequentialTimeSeries,
        Probabilistic,
        Scenarios,
        SingleTimeSeries,
    }
end
_decode(::Type{TimeSeriesAssociation}, value) = _decode(TimeSeriesAssociation, value, true)
function _decode(::Type{TimeSeriesAssociation}, value, _openapi_validate::Bool)
    object = _object(value, "TimeSeriesAssociation")
    tag = get(object, "time_series_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(DecodeError("discriminator value must be a string for TimeSeriesAssociation"))
    selected = get(
        Dict(
            "Deterministic" => (
                Deterministic,
                (
                    resource="https://openapi.invalid/schema/external-0a053d4f7e925922eb41.json",
                    pointer="",
                ),
            ),
            "DeterministicSingleTimeSeries" => (
                DeterministicSingleTimeSeries,
                (
                    resource="https://openapi.invalid/schema/external-64c6908fd44c784ca124.json",
                    pointer="",
                ),
            ),
            "NonSequentialTimeSeries" => (
                NonSequentialTimeSeries,
                (
                    resource="https://openapi.invalid/schema/external-d809ec800229ced94193.json",
                    pointer="",
                ),
            ),
            "Probabilistic" => (
                Probabilistic,
                (
                    resource="https://openapi.invalid/schema/external-5c7977e1a0bcb57dd3f7.json",
                    pointer="",
                ),
            ),
            "Scenarios" => (
                Scenarios,
                (
                    resource="https://openapi.invalid/schema/external-4c0d5558c513c8a15479.json",
                    pointer="",
                ),
            ),
            "SingleTimeSeries" => (
                SingleTimeSeries,
                (
                    resource="https://openapi.invalid/schema/external-54f9282b7dfcc35b7654.json",
                    pointer="",
                ),
            ),
        ),
        tag isa Absent ? "" : String(tag),
        nothing,
    )
    selected === nothing && throw(
        DecodeError("unknown discriminator value $(repr(tag)) for TimeSeriesAssociation"),
    )
    _openapi_validate && _validate_schema(
        _SPEC,
        selected[2],
        value,
        "decoding TimeSeriesAssociation";
        direction=:neutral,
    )
    return TimeSeriesAssociation(_decode(selected[1], value, false))
end
function _encode_unvalidated(value::TimeSeriesAssociation)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::TimeSeriesAssociation) = _encode(value.value)
