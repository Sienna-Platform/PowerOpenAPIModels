"""
    ProjectedDemandCurtailmentCost

Cost of voluntary curtailment. A linear curve is a single price for all curtailable demand; a piecewise incremental curve gives tiers whose x coordinates are fractions of demand, from 0 to `max_demand_curtailment`, and whose slopes are prices. Units: USD/MWh.
"""
struct ProjectedDemandCurtailmentCost <: OneOfAPIModel
    value::Union{
        AverageRateCurve,
        IncrementalCurve,
        InputOutputCurve,
        TimeSeriesAverageRateCurve,
        TimeSeriesIncrementalCurve,
        TimeSeriesInputOutputCurve,
    }
end
_decode(::Type{ProjectedDemandCurtailmentCost}, value) =
    _decode(ProjectedDemandCurtailmentCost, value, true)
function _decode(::Type{ProjectedDemandCurtailmentCost}, value, _openapi_validate::Bool)
    object = _object(value, "ProjectedDemandCurtailmentCost")
    tag = get(object, "curve_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(
            DecodeError(
                "discriminator value must be a string for ProjectedDemandCurtailmentCost",
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
            "unknown discriminator value $(repr(tag)) for ProjectedDemandCurtailmentCost",
        ),
    )
    _openapi_validate && _validate_schema(
        _SPEC,
        selected[2],
        value,
        "decoding ProjectedDemandCurtailmentCost";
        direction=:neutral,
    )
    return ProjectedDemandCurtailmentCost(_decode(selected[1], value, false))
end
function _encode_unvalidated(value::ProjectedDemandCurtailmentCost)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::ProjectedDemandCurtailmentCost) = _encode(value.value)
