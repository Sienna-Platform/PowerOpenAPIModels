"""
    RetrofitPotentialRetrofitCost

Cost associated with retrofitting the eligible generators. Units: USD/MW.
"""
struct RetrofitPotentialRetrofitCost <: OneOfAPIModel
    value::Union{
        AverageRateCurve,
        IncrementalCurve,
        InputOutputCurve,
        TimeSeriesAverageRateCurve,
        TimeSeriesIncrementalCurve,
        TimeSeriesInputOutputCurve,
    }
end
_decode(::Type{RetrofitPotentialRetrofitCost}, value) =
    _decode(RetrofitPotentialRetrofitCost, value, true)
function _decode(::Type{RetrofitPotentialRetrofitCost}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-16cedac303a10bb9798b.json",
            pointer="/properties/retrofit_cost",
        ),
        value,
        "decoding RetrofitPotentialRetrofitCost";
        direction=:neutral,
    )
    object = _object(value, "RetrofitPotentialRetrofitCost")
    tag = get(object, "curve_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(
            DecodeError(
                "discriminator value must be a string for RetrofitPotentialRetrofitCost",
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
            "unknown discriminator value $(repr(tag)) for RetrofitPotentialRetrofitCost",
        ),
    )
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for RetrofitPotentialRetrofitCost",
            ),
        )
    return RetrofitPotentialRetrofitCost(_decode(selected[1], value, false))
end
function _encode_unvalidated(value::RetrofitPotentialRetrofitCost)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::RetrofitPotentialRetrofitCost) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-16cedac303a10bb9798b.json",
        pointer="/properties/retrofit_cost",
    ),
    _encode_unvalidated(value),
    "encoding RetrofitPotentialRetrofitCost";
    direction=:neutral,
)
