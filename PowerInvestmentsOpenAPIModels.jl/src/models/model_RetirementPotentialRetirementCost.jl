"""
    RetirementPotentialRetirementCost

Cost associated with retiring the eligible generators. Units: USD/MW.
"""
struct RetirementPotentialRetirementCost <: OneOfAPIModel
    value::Union{
        AverageRateCurve,
        IncrementalCurve,
        InputOutputCurve,
        TimeSeriesAverageRateCurve,
        TimeSeriesIncrementalCurve,
        TimeSeriesInputOutputCurve,
    }
end
_decode(::Type{RetirementPotentialRetirementCost}, value) =
    _decode(RetirementPotentialRetirementCost, value, true)
function _decode(::Type{RetirementPotentialRetirementCost}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-1af216d390a71a755814.json",
            pointer="/properties/retirement_cost",
        ),
        value,
        "decoding RetirementPotentialRetirementCost";
        direction=:neutral,
    )
    object = _object(value, "RetirementPotentialRetirementCost")
    tag = get(object, "curve_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(
            DecodeError(
                "discriminator value must be a string for RetirementPotentialRetirementCost",
            ),
        )
    selected = get(
        Dict(
            "AVERAGE_RATE" => (
                AverageRateCurve,
                (
                    resource="https://openapi.invalid/schema/external-0c77f7276093a5d31ba5.json",
                    pointer="/\$defs/AverageRateCurve",
                ),
            ),
            "INCREMENTAL" => (
                IncrementalCurve,
                (
                    resource="https://openapi.invalid/schema/external-0c77f7276093a5d31ba5.json",
                    pointer="/\$defs/IncrementalCurve",
                ),
            ),
            "INPUT_OUTPUT" => (
                InputOutputCurve,
                (
                    resource="https://openapi.invalid/schema/external-0c77f7276093a5d31ba5.json",
                    pointer="/\$defs/InputOutputCurve",
                ),
            ),
            "TIME_SERIES_AVERAGE_RATE" => (
                TimeSeriesAverageRateCurve,
                (
                    resource="https://openapi.invalid/schema/external-0c77f7276093a5d31ba5.json",
                    pointer="/\$defs/TimeSeriesAverageRateCurve",
                ),
            ),
            "TIME_SERIES_INCREMENTAL" => (
                TimeSeriesIncrementalCurve,
                (
                    resource="https://openapi.invalid/schema/external-0c77f7276093a5d31ba5.json",
                    pointer="/\$defs/TimeSeriesIncrementalCurve",
                ),
            ),
            "TIME_SERIES_INPUT_OUTPUT" => (
                TimeSeriesInputOutputCurve,
                (
                    resource="https://openapi.invalid/schema/external-0c77f7276093a5d31ba5.json",
                    pointer="/\$defs/TimeSeriesInputOutputCurve",
                ),
            ),
        ),
        tag isa Absent ? "" : String(tag),
        nothing,
    )
    selected === nothing && throw(
        DecodeError(
            "unknown discriminator value $(repr(tag)) for RetirementPotentialRetirementCost",
        ),
    )
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for RetirementPotentialRetirementCost",
            ),
        )
    return RetirementPotentialRetirementCost(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::RetirementPotentialRetirementCost)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-1af216d390a71a755814.json",
            pointer="/properties/retirement_cost",
        ),
        output,
        "encoding RetirementPotentialRetirementCost";
        direction=:neutral,
    )
end
