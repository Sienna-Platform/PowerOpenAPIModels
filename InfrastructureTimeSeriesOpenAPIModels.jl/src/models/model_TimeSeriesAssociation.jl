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
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-00abfb53330f29dc90c7.json",
            pointer="",
        ),
        value,
        "decoding TimeSeriesAssociation";
        direction=:neutral,
    )
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
                    resource="https://openapi.invalid/schema/external-a21ce49bf856547dc288.json",
                    pointer="",
                ),
            ),
            "DeterministicSingleTimeSeries" => (
                DeterministicSingleTimeSeries,
                (
                    resource="https://openapi.invalid/schema/external-55ac9be8643f1f23b680.json",
                    pointer="",
                ),
            ),
            "NonSequentialTimeSeries" => (
                NonSequentialTimeSeries,
                (
                    resource="https://openapi.invalid/schema/external-b62bcb370c2b936c4b64.json",
                    pointer="",
                ),
            ),
            "Probabilistic" => (
                Probabilistic,
                (
                    resource="https://openapi.invalid/schema/external-04cf5b827c6fe29067a5.json",
                    pointer="",
                ),
            ),
            "Scenarios" => (
                Scenarios,
                (
                    resource="https://openapi.invalid/schema/external-187a69af105bbfe4a51e.json",
                    pointer="",
                ),
            ),
            "SingleTimeSeries" => (
                SingleTimeSeries,
                (
                    resource="https://openapi.invalid/schema/external-5cc161da1c6721e651e9.json",
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
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for TimeSeriesAssociation",
            ),
        )
    return TimeSeriesAssociation(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::TimeSeriesAssociation)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-00abfb53330f29dc90c7.json",
            pointer="",
        ),
        output,
        "encoding TimeSeriesAssociation";
        direction=:neutral,
    )
end
