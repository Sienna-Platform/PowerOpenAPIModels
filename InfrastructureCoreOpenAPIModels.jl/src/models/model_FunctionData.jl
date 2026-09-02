@doc "    FunctionData\n\nRaw mathematical data defining a function `f(x)` — coefficients or point tables with no units or interpretation attached. `function_type` selects the shape: linear, quadratic, piecewise linear through (x, y) points, or piecewise constant between x endpoints. What `x` and `y` stand for is supplied by whatever wraps this, and the `TIME_SERIES_*` variants hold a reference to a stored series in place of the numbers."
struct FunctionData
    value::Union{LinearFunctionData,PiecewiseLinearData,PiecewiseStepData,QuadraticFunctionData,TimeSeriesLinearFunctionData,TimeSeriesPiecewiseLinearData,TimeSeriesPiecewiseStepData,TimeSeriesQuadraticFunctionData}
end
_decode(::Type{FunctionData}, value) = _decode(FunctionData, value, true)
function _decode(::Type{FunctionData}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/FunctionData"), value, "decoding FunctionData"; direction = :neutral)
    object = _object(value, "FunctionData")
    tag = get(object, "function_type", ABSENT)
    tag isa Absent || tag isa AbstractString || throw(DecodeError("discriminator value must be a string for FunctionData"))
    selected = get(Dict(
        "LINEAR" => (LinearFunctionData, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/LinearFunctionData")),
        "LinearFunctionData" => (LinearFunctionData, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/LinearFunctionData")),
        "PIECEWISE_LINEAR" => (PiecewiseLinearData, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/PiecewiseLinearData")),
        "PIECEWISE_STEP" => (PiecewiseStepData, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/PiecewiseStepData")),
        "PiecewiseLinearData" => (PiecewiseLinearData, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/PiecewiseLinearData")),
        "PiecewiseStepData" => (PiecewiseStepData, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/PiecewiseStepData")),
        "QUADRATIC" => (QuadraticFunctionData, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/QuadraticFunctionData")),
        "QuadraticFunctionData" => (QuadraticFunctionData, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/QuadraticFunctionData")),
        "TIME_SERIES_LINEAR" => (TimeSeriesLinearFunctionData, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/TimeSeriesLinearFunctionData")),
        "TIME_SERIES_PIECEWISE_LINEAR" => (TimeSeriesPiecewiseLinearData, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/TimeSeriesPiecewiseLinearData")),
        "TIME_SERIES_PIECEWISE_STEP" => (TimeSeriesPiecewiseStepData, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/TimeSeriesPiecewiseStepData")),
        "TIME_SERIES_QUADRATIC" => (TimeSeriesQuadraticFunctionData, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/TimeSeriesQuadraticFunctionData")),
        "TimeSeriesLinearFunctionData" => (TimeSeriesLinearFunctionData, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/TimeSeriesLinearFunctionData")),
        "TimeSeriesPiecewiseLinearData" => (TimeSeriesPiecewiseLinearData, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/TimeSeriesPiecewiseLinearData")),
        "TimeSeriesPiecewiseStepData" => (TimeSeriesPiecewiseStepData, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/TimeSeriesPiecewiseStepData")),
        "TimeSeriesQuadraticFunctionData" => (TimeSeriesQuadraticFunctionData, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/TimeSeriesQuadraticFunctionData")),
    ), tag isa Absent ? "" : String(tag), nothing)
    selected === nothing && throw(DecodeError("unknown discriminator value $(repr(tag)) for FunctionData"))
    !_openapi_validate || _schema_valid(_SPEC, selected[2], value; direction = :neutral) || throw(DecodeError("discriminator-selected schema did not validate for FunctionData"))
    return FunctionData(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::FunctionData)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/FunctionData"), output, "encoding FunctionData"; direction = :neutral)
end
