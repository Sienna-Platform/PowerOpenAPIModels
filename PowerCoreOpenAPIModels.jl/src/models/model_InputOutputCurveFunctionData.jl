struct InputOutputCurveFunctionData
    value::Union{LinearFunctionData,PiecewiseLinearData,QuadraticFunctionData}
end
_decode(::Type{InputOutputCurveFunctionData}, value) = _decode(InputOutputCurveFunctionData, value, true)
function _decode(::Type{InputOutputCurveFunctionData}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/InputOutputCurve/properties/function_data"), value, "decoding InputOutputCurveFunctionData"; direction = :neutral)
    object = _object(value, "InputOutputCurveFunctionData")
    tag = get(object, "function_type", ABSENT)
    tag isa Absent || tag isa AbstractString || throw(DecodeError("discriminator value must be a string for InputOutputCurveFunctionData"))
    selected = get(Dict(
        "LINEAR" => (LinearFunctionData, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/LinearFunctionData")),
        "LinearFunctionData" => (LinearFunctionData, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/LinearFunctionData")),
        "PIECEWISE_LINEAR" => (PiecewiseLinearData, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/PiecewiseLinearData")),
        "PiecewiseLinearData" => (PiecewiseLinearData, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/PiecewiseLinearData")),
        "QUADRATIC" => (QuadraticFunctionData, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/QuadraticFunctionData")),
        "QuadraticFunctionData" => (QuadraticFunctionData, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/QuadraticFunctionData")),
    ), tag isa Absent ? "" : String(tag), nothing)
    selected === nothing && throw(DecodeError("unknown discriminator value $(repr(tag)) for InputOutputCurveFunctionData"))
    !_openapi_validate || _schema_valid(_SPEC, selected[2], value; direction = :neutral) || throw(DecodeError("discriminator-selected schema did not validate for InputOutputCurveFunctionData"))
    return InputOutputCurveFunctionData(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::InputOutputCurveFunctionData)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/InputOutputCurve/properties/function_data"), output, "encoding InputOutputCurveFunctionData"; direction = :neutral)
end
