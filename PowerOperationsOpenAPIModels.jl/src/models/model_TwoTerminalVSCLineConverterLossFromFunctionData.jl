struct TwoTerminalVSCLineConverterLossFromFunctionData
    value::Union{LinearFunctionData,PiecewiseLinearData,QuadraticFunctionData}
end
_decode(::Type{TwoTerminalVSCLineConverterLossFromFunctionData}, value) = _decode(TwoTerminalVSCLineConverterLossFromFunctionData, value, true)
function _decode(::Type{TwoTerminalVSCLineConverterLossFromFunctionData}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoTerminalVSCLine/properties/converter_loss_from/properties/function_data"), value, "decoding TwoTerminalVSCLineConverterLossFromFunctionData"; direction = :neutral)
    object = _object(value, "TwoTerminalVSCLineConverterLossFromFunctionData")
    tag = get(object, "function_type", ABSENT)
    tag isa Absent || tag isa AbstractString || throw(DecodeError("discriminator value must be a string for TwoTerminalVSCLineConverterLossFromFunctionData"))
    selected = get(Dict(
        "LINEAR" => (LinearFunctionData, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/LinearFunctionData")),
        "LinearFunctionData" => (LinearFunctionData, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/LinearFunctionData")),
        "PIECEWISE_LINEAR" => (PiecewiseLinearData, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/PiecewiseLinearData")),
        "PiecewiseLinearData" => (PiecewiseLinearData, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/PiecewiseLinearData")),
        "QUADRATIC" => (QuadraticFunctionData, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/QuadraticFunctionData")),
        "QuadraticFunctionData" => (QuadraticFunctionData, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/QuadraticFunctionData")),
    ), tag isa Absent ? "" : String(tag), nothing)
    selected === nothing && throw(DecodeError("unknown discriminator value $(repr(tag)) for TwoTerminalVSCLineConverterLossFromFunctionData"))
    !_openapi_validate || _schema_valid(_SPEC, selected[2], value; direction = :neutral) || throw(DecodeError("discriminator-selected schema did not validate for TwoTerminalVSCLineConverterLossFromFunctionData"))
    return TwoTerminalVSCLineConverterLossFromFunctionData(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::TwoTerminalVSCLineConverterLossFromFunctionData)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoTerminalVSCLine/properties/converter_loss_from/properties/function_data"), output, "encoding TwoTerminalVSCLineConverterLossFromFunctionData"; direction = :neutral)
end
