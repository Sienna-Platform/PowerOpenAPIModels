struct AverageRateCurveFunctionData
    value::Union{LinearFunctionData,PiecewiseStepData}
end
_decode(::Type{AverageRateCurveFunctionData}, value) = _decode(AverageRateCurveFunctionData, value, true)
function _decode(::Type{AverageRateCurveFunctionData}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/AverageRateCurve/properties/function_data"), value, "decoding AverageRateCurveFunctionData"; direction = :neutral)
    object = _object(value, "AverageRateCurveFunctionData")
    tag = get(object, "function_type", ABSENT)
    tag isa Absent || tag isa AbstractString || throw(DecodeError("discriminator value must be a string for AverageRateCurveFunctionData"))
    selected = get(Dict(
        "LINEAR" => (LinearFunctionData, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/LinearFunctionData")),
        "LinearFunctionData" => (LinearFunctionData, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/LinearFunctionData")),
        "PIECEWISE_STEP" => (PiecewiseStepData, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/PiecewiseStepData")),
        "PiecewiseStepData" => (PiecewiseStepData, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/PiecewiseStepData")),
    ), tag isa Absent ? "" : String(tag), nothing)
    selected === nothing && throw(DecodeError("unknown discriminator value $(repr(tag)) for AverageRateCurveFunctionData"))
    !_openapi_validate || _schema_valid(_SPEC, selected[2], value; direction = :neutral) || throw(DecodeError("discriminator-selected schema did not validate for AverageRateCurveFunctionData"))
    return AverageRateCurveFunctionData(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::AverageRateCurveFunctionData)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/AverageRateCurve/properties/function_data"), output, "encoding AverageRateCurveFunctionData"; direction = :neutral)
end
