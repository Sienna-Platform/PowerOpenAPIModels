"""
    FunctionData

Raw mathematical data defining a function `f(x)` — coefficients or point tables with no units or interpretation attached. `function_type` selects the shape: linear, quadratic, piecewise linear through (x, y) points, or piecewise constant between x endpoints. What `x` and `y` stand for is supplied by whatever wraps this, and the `TIME_SERIES_*` variants hold a reference to a stored series in place of the numbers.
"""
struct FunctionData <: OneOfAPIModel
    value::Union{
        LinearFunctionData,
        PiecewiseLinearData,
        PiecewiseStepData,
        QuadraticFunctionData,
        TimeSeriesLinearFunctionData,
        TimeSeriesPiecewiseLinearData,
        TimeSeriesPiecewiseStepData,
        TimeSeriesQuadraticFunctionData,
    }
end
_decode(::Type{FunctionData}, value) = _decode(FunctionData, value, true)
function _decode(::Type{FunctionData}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-50d5243393bb9d77da58.json",
            pointer="/\$defs/FunctionData",
        ),
        value,
        "decoding FunctionData";
        direction=:neutral,
    )
    object = _object(value, "FunctionData")
    tag = get(object, "function_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(DecodeError("discriminator value must be a string for FunctionData"))
    selected = get(
        Dict(
            "LINEAR" => (
                LinearFunctionData,
                (
                    resource="https://openapi.invalid/schema/external-50d5243393bb9d77da58.json",
                    pointer="/\$defs/LinearFunctionData",
                ),
            ),
            "PIECEWISE_LINEAR" => (
                PiecewiseLinearData,
                (
                    resource="https://openapi.invalid/schema/external-50d5243393bb9d77da58.json",
                    pointer="/\$defs/PiecewiseLinearData",
                ),
            ),
            "PIECEWISE_STEP" => (
                PiecewiseStepData,
                (
                    resource="https://openapi.invalid/schema/external-50d5243393bb9d77da58.json",
                    pointer="/\$defs/PiecewiseStepData",
                ),
            ),
            "QUADRATIC" => (
                QuadraticFunctionData,
                (
                    resource="https://openapi.invalid/schema/external-50d5243393bb9d77da58.json",
                    pointer="/\$defs/QuadraticFunctionData",
                ),
            ),
            "TIME_SERIES_LINEAR" => (
                TimeSeriesLinearFunctionData,
                (
                    resource="https://openapi.invalid/schema/external-50d5243393bb9d77da58.json",
                    pointer="/\$defs/TimeSeriesLinearFunctionData",
                ),
            ),
            "TIME_SERIES_PIECEWISE_LINEAR" => (
                TimeSeriesPiecewiseLinearData,
                (
                    resource="https://openapi.invalid/schema/external-50d5243393bb9d77da58.json",
                    pointer="/\$defs/TimeSeriesPiecewiseLinearData",
                ),
            ),
            "TIME_SERIES_PIECEWISE_STEP" => (
                TimeSeriesPiecewiseStepData,
                (
                    resource="https://openapi.invalid/schema/external-50d5243393bb9d77da58.json",
                    pointer="/\$defs/TimeSeriesPiecewiseStepData",
                ),
            ),
            "TIME_SERIES_QUADRATIC" => (
                TimeSeriesQuadraticFunctionData,
                (
                    resource="https://openapi.invalid/schema/external-50d5243393bb9d77da58.json",
                    pointer="/\$defs/TimeSeriesQuadraticFunctionData",
                ),
            ),
        ),
        tag isa Absent ? "" : String(tag),
        nothing,
    )
    selected === nothing &&
        throw(DecodeError("unknown discriminator value $(repr(tag)) for FunctionData"))
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError("discriminator-selected schema did not validate for FunctionData"),
        )
    return FunctionData(_decode(selected[1], value, false))
end
function _encode_unvalidated(value::FunctionData)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::FunctionData) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-50d5243393bb9d77da58.json",
        pointer="/\$defs/FunctionData",
    ),
    _encode_unvalidated(value),
    "encoding FunctionData";
    direction=:neutral,
)
