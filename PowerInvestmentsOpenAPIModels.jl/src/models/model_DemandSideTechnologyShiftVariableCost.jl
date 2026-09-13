"""
    DemandSideTechnologyShiftVariableCost

Variable operation and maintenance costs associated with flexible demand deferral/advancement. Units: USD/MWh.
"""
struct DemandSideTechnologyShiftVariableCost <: OneOfAPIModel
    value::Union{
        AverageRateCurve,
        IncrementalCurve,
        InputOutputCurve,
        TimeSeriesAverageRateCurve,
        TimeSeriesIncrementalCurve,
        TimeSeriesInputOutputCurve,
    }
end
_decode(::Type{DemandSideTechnologyShiftVariableCost}, value) =
    _decode(DemandSideTechnologyShiftVariableCost, value, true)
function _decode(
    ::Type{DemandSideTechnologyShiftVariableCost},
    value,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-604d83c79216e8337181.json",
            pointer="/properties/shift_variable_cost",
        ),
        value,
        "decoding DemandSideTechnologyShiftVariableCost";
        direction=:neutral,
    )
    object = _object(value, "DemandSideTechnologyShiftVariableCost")
    tag = get(object, "curve_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(
            DecodeError(
                "discriminator value must be a string for DemandSideTechnologyShiftVariableCost",
            ),
        )
    selected = get(
        Dict(
            "AVERAGE_RATE" => (
                AverageRateCurve,
                (
                    resource="https://openapi.invalid/schema/external-1e9a0d19d7563e537121.json",
                    pointer="/\$defs/AverageRateCurve",
                ),
            ),
            "INCREMENTAL" => (
                IncrementalCurve,
                (
                    resource="https://openapi.invalid/schema/external-1e9a0d19d7563e537121.json",
                    pointer="/\$defs/IncrementalCurve",
                ),
            ),
            "INPUT_OUTPUT" => (
                InputOutputCurve,
                (
                    resource="https://openapi.invalid/schema/external-1e9a0d19d7563e537121.json",
                    pointer="/\$defs/InputOutputCurve",
                ),
            ),
            "TIME_SERIES_AVERAGE_RATE" => (
                TimeSeriesAverageRateCurve,
                (
                    resource="https://openapi.invalid/schema/external-1e9a0d19d7563e537121.json",
                    pointer="/\$defs/TimeSeriesAverageRateCurve",
                ),
            ),
            "TIME_SERIES_INCREMENTAL" => (
                TimeSeriesIncrementalCurve,
                (
                    resource="https://openapi.invalid/schema/external-1e9a0d19d7563e537121.json",
                    pointer="/\$defs/TimeSeriesIncrementalCurve",
                ),
            ),
            "TIME_SERIES_INPUT_OUTPUT" => (
                TimeSeriesInputOutputCurve,
                (
                    resource="https://openapi.invalid/schema/external-1e9a0d19d7563e537121.json",
                    pointer="/\$defs/TimeSeriesInputOutputCurve",
                ),
            ),
        ),
        tag isa Absent ? "" : String(tag),
        nothing,
    )
    selected === nothing && throw(
        DecodeError(
            "unknown discriminator value $(repr(tag)) for DemandSideTechnologyShiftVariableCost",
        ),
    )
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for DemandSideTechnologyShiftVariableCost",
            ),
        )
    return DemandSideTechnologyShiftVariableCost(
        _decode(selected[1], value, _openapi_validate),
    )
end
function _encode(value::DemandSideTechnologyShiftVariableCost)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-604d83c79216e8337181.json",
            pointer="/properties/shift_variable_cost",
        ),
        output,
        "encoding DemandSideTechnologyShiftVariableCost";
        direction=:neutral,
    )
end
