"""
    TimeSeriesAssociation

Metadata linking one time series to the component or attribute that owns it. A closed set of six canonical types: two static, four forecasts. The type decides which timing fields the row carries. Dense values never appear here.
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
            resource="https://openapi.invalid/schema/root-463dad90dca1b0053108.json",
            pointer="/components/schemas/TimeSeriesAssociation",
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
                    resource="https://openapi.invalid/schema/root-463dad90dca1b0053108.json",
                    pointer="/components/schemas/Deterministic",
                ),
            ),
            "DeterministicSingleTimeSeries" => (
                DeterministicSingleTimeSeries,
                (
                    resource="https://openapi.invalid/schema/root-463dad90dca1b0053108.json",
                    pointer="/components/schemas/DeterministicSingleTimeSeries",
                ),
            ),
            "NonSequentialTimeSeries" => (
                NonSequentialTimeSeries,
                (
                    resource="https://openapi.invalid/schema/root-463dad90dca1b0053108.json",
                    pointer="/components/schemas/NonSequentialTimeSeries",
                ),
            ),
            "Probabilistic" => (
                Probabilistic,
                (
                    resource="https://openapi.invalid/schema/root-463dad90dca1b0053108.json",
                    pointer="/components/schemas/Probabilistic",
                ),
            ),
            "Scenarios" => (
                Scenarios,
                (
                    resource="https://openapi.invalid/schema/root-463dad90dca1b0053108.json",
                    pointer="/components/schemas/Scenarios",
                ),
            ),
            "SingleTimeSeries" => (
                SingleTimeSeries,
                (
                    resource="https://openapi.invalid/schema/root-463dad90dca1b0053108.json",
                    pointer="/components/schemas/SingleTimeSeries",
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
            resource="https://openapi.invalid/schema/root-463dad90dca1b0053108.json",
            pointer="/components/schemas/TimeSeriesAssociation",
        ),
        output,
        "encoding TimeSeriesAssociation";
        direction=:neutral,
    )
end
