"""
    ProjectedDemandShiftCost

Cost of shifting demand, per MWh shifted. Units: USD/MWh.
"""
struct ProjectedDemandShiftCost <: OneOfAPIModel
    value::Union{
        AverageRateCurve,
        IncrementalCurve,
        InputOutputCurve,
        TimeSeriesAverageRateCurve,
        TimeSeriesIncrementalCurve,
        TimeSeriesInputOutputCurve,
    }
end
_decode(::Type{ProjectedDemandShiftCost}, value) =
    _decode(ProjectedDemandShiftCost, value, true)
function _decode(::Type{ProjectedDemandShiftCost}, value, _openapi_validate::Bool)
    object = _object(value, "ProjectedDemandShiftCost")
    tag = get(object, "curve_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(
            DecodeError(
                "discriminator value must be a string for ProjectedDemandShiftCost",
            ),
        )
    selected = get(
        Dict(
            "AVERAGE_RATE" => (
                AverageRateCurve,
                (
                    resource="https://openapi.invalid/schema/external-bfc1913848b9653bdd99.json",
                    pointer="/\$defs/AverageRateCurve",
                ),
            ),
            "INCREMENTAL" => (
                IncrementalCurve,
                (
                    resource="https://openapi.invalid/schema/external-bfc1913848b9653bdd99.json",
                    pointer="/\$defs/IncrementalCurve",
                ),
            ),
            "INPUT_OUTPUT" => (
                InputOutputCurve,
                (
                    resource="https://openapi.invalid/schema/external-bfc1913848b9653bdd99.json",
                    pointer="/\$defs/InputOutputCurve",
                ),
            ),
            "TIME_SERIES_AVERAGE_RATE" => (
                TimeSeriesAverageRateCurve,
                (
                    resource="https://openapi.invalid/schema/external-bfc1913848b9653bdd99.json",
                    pointer="/\$defs/TimeSeriesAverageRateCurve",
                ),
            ),
            "TIME_SERIES_INCREMENTAL" => (
                TimeSeriesIncrementalCurve,
                (
                    resource="https://openapi.invalid/schema/external-bfc1913848b9653bdd99.json",
                    pointer="/\$defs/TimeSeriesIncrementalCurve",
                ),
            ),
            "TIME_SERIES_INPUT_OUTPUT" => (
                TimeSeriesInputOutputCurve,
                (
                    resource="https://openapi.invalid/schema/external-bfc1913848b9653bdd99.json",
                    pointer="/\$defs/TimeSeriesInputOutputCurve",
                ),
            ),
        ),
        tag isa Absent ? "" : String(tag),
        nothing,
    )
    selected === nothing && throw(
        DecodeError(
            "unknown discriminator value $(repr(tag)) for ProjectedDemandShiftCost",
        ),
    )
    _openapi_validate && _validate_schema(
        _SPEC,
        selected[2],
        value,
        "decoding ProjectedDemandShiftCost";
        direction=:neutral,
    )
    return ProjectedDemandShiftCost(_decode(selected[1], value, false))
end
function _encode_unvalidated(value::ProjectedDemandShiftCost)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::ProjectedDemandShiftCost) = _encode(value.value)
