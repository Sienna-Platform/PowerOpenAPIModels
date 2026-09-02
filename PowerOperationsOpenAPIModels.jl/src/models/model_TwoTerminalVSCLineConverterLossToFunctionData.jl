struct TwoTerminalVSCLineConverterLossToFunctionData
    value::Union{LinearFunctionData,PiecewiseLinearData,QuadraticFunctionData}
end
_decode(::Type{TwoTerminalVSCLineConverterLossToFunctionData}, value) = _decode(TwoTerminalVSCLineConverterLossToFunctionData, value, true)
function _decode(::Type{TwoTerminalVSCLineConverterLossToFunctionData}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TwoTerminalVSCLine/properties/converter_loss_to/properties/function_data"), value, "decoding TwoTerminalVSCLineConverterLossToFunctionData"; direction = :neutral)
    object = _object(value, "TwoTerminalVSCLineConverterLossToFunctionData")
    tag = get(object, "function_type", ABSENT)
    tag isa Absent || tag isa AbstractString || throw(DecodeError("discriminator value must be a string for TwoTerminalVSCLineConverterLossToFunctionData"))
    selected = get(Dict(
        "LINEAR" => (LinearFunctionData, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/LinearFunctionData")),
        "LinearFunctionData" => (LinearFunctionData, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/LinearFunctionData")),
        "PIECEWISE_LINEAR" => (PiecewiseLinearData, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/PiecewiseLinearData")),
        "PiecewiseLinearData" => (PiecewiseLinearData, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/PiecewiseLinearData")),
        "QUADRATIC" => (QuadraticFunctionData, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/QuadraticFunctionData")),
        "QuadraticFunctionData" => (QuadraticFunctionData, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/QuadraticFunctionData")),
    ), tag isa Absent ? "" : String(tag), nothing)
    selected === nothing && throw(DecodeError("unknown discriminator value $(repr(tag)) for TwoTerminalVSCLineConverterLossToFunctionData"))
    !_openapi_validate || _schema_valid(_SPEC, selected[2], value; direction = :neutral) || throw(DecodeError("discriminator-selected schema did not validate for TwoTerminalVSCLineConverterLossToFunctionData"))
    return TwoTerminalVSCLineConverterLossToFunctionData(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::TwoTerminalVSCLineConverterLossToFunctionData)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TwoTerminalVSCLine/properties/converter_loss_to/properties/function_data"), output, "encoding TwoTerminalVSCLineConverterLossToFunctionData"; direction = :neutral)
end
