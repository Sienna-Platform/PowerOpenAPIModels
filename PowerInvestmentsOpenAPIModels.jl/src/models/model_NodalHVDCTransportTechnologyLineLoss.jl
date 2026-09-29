"""
    NodalHVDCTransportTechnologyLineLoss

Loss model coefficients. Accepts a linear model with a constant loss and a proportional loss rate, or a Piecewise loss with N segments for different proportional losses. All terms are defined as fraction of installed nameplate capacity. Units: 1.
"""
struct NodalHVDCTransportTechnologyLineLoss <: OneOfAPIModel
    value::Union{
        AverageRateCurve,
        IncrementalCurve,
        InputOutputCurve,
        TimeSeriesAverageRateCurve,
        TimeSeriesIncrementalCurve,
        TimeSeriesInputOutputCurve,
    }
end
_decode(::Type{NodalHVDCTransportTechnologyLineLoss}, value) =
    _decode(NodalHVDCTransportTechnologyLineLoss, value, true)
function _decode(
    ::Type{NodalHVDCTransportTechnologyLineLoss},
    value,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-f3c819038fd9494a9174.json",
            pointer="/properties/line_loss",
        ),
        value,
        "decoding NodalHVDCTransportTechnologyLineLoss";
        direction=:neutral,
    )
    object = _object(value, "NodalHVDCTransportTechnologyLineLoss")
    tag = get(object, "curve_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(
            DecodeError(
                "discriminator value must be a string for NodalHVDCTransportTechnologyLineLoss",
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
            "unknown discriminator value $(repr(tag)) for NodalHVDCTransportTechnologyLineLoss",
        ),
    )
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for NodalHVDCTransportTechnologyLineLoss",
            ),
        )
    return NodalHVDCTransportTechnologyLineLoss(_decode(selected[1], value, false))
end
function _encode_unvalidated(value::NodalHVDCTransportTechnologyLineLoss)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::NodalHVDCTransportTechnologyLineLoss) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-f3c819038fd9494a9174.json",
        pointer="/properties/line_loss",
    ),
    _encode_unvalidated(value),
    "encoding NodalHVDCTransportTechnologyLineLoss";
    direction=:neutral,
)
