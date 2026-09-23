"""
    DemandSideTechnologyPricePerUnit

Price or value per unit of output. Ex: USD per ton of hydrogen for electrolyzers. Units: USD/t.
"""
struct DemandSideTechnologyPricePerUnit <: OneOfAPIModel
    value::Union{
        AverageRateCurve,
        IncrementalCurve,
        InputOutputCurve,
        TimeSeriesAverageRateCurve,
        TimeSeriesIncrementalCurve,
        TimeSeriesInputOutputCurve,
    }
end
_decode(::Type{DemandSideTechnologyPricePerUnit}, value) =
    _decode(DemandSideTechnologyPricePerUnit, value, true)
function _decode(::Type{DemandSideTechnologyPricePerUnit}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-075f1f848fd32d7905ac.json",
            pointer="/properties/price_per_unit",
        ),
        value,
        "decoding DemandSideTechnologyPricePerUnit";
        direction=:neutral,
    )
    object = _object(value, "DemandSideTechnologyPricePerUnit")
    tag = get(object, "curve_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(
            DecodeError(
                "discriminator value must be a string for DemandSideTechnologyPricePerUnit",
            ),
        )
    selected = get(
        Dict(
            "AVERAGE_RATE" => (
                AverageRateCurve,
                (
                    resource="https://openapi.invalid/schema/external-207c3896c96d98ecaf37.json",
                    pointer="/\$defs/AverageRateCurve",
                ),
            ),
            "INCREMENTAL" => (
                IncrementalCurve,
                (
                    resource="https://openapi.invalid/schema/external-207c3896c96d98ecaf37.json",
                    pointer="/\$defs/IncrementalCurve",
                ),
            ),
            "INPUT_OUTPUT" => (
                InputOutputCurve,
                (
                    resource="https://openapi.invalid/schema/external-207c3896c96d98ecaf37.json",
                    pointer="/\$defs/InputOutputCurve",
                ),
            ),
            "TIME_SERIES_AVERAGE_RATE" => (
                TimeSeriesAverageRateCurve,
                (
                    resource="https://openapi.invalid/schema/external-207c3896c96d98ecaf37.json",
                    pointer="/\$defs/TimeSeriesAverageRateCurve",
                ),
            ),
            "TIME_SERIES_INCREMENTAL" => (
                TimeSeriesIncrementalCurve,
                (
                    resource="https://openapi.invalid/schema/external-207c3896c96d98ecaf37.json",
                    pointer="/\$defs/TimeSeriesIncrementalCurve",
                ),
            ),
            "TIME_SERIES_INPUT_OUTPUT" => (
                TimeSeriesInputOutputCurve,
                (
                    resource="https://openapi.invalid/schema/external-207c3896c96d98ecaf37.json",
                    pointer="/\$defs/TimeSeriesInputOutputCurve",
                ),
            ),
        ),
        tag isa Absent ? "" : String(tag),
        nothing,
    )
    selected === nothing && throw(
        DecodeError(
            "unknown discriminator value $(repr(tag)) for DemandSideTechnologyPricePerUnit",
        ),
    )
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for DemandSideTechnologyPricePerUnit",
            ),
        )
    return DemandSideTechnologyPricePerUnit(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::DemandSideTechnologyPricePerUnit)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-075f1f848fd32d7905ac.json",
            pointer="/properties/price_per_unit",
        ),
        output,
        "encoding DemandSideTechnologyPricePerUnit";
        direction=:neutral,
    )
end
