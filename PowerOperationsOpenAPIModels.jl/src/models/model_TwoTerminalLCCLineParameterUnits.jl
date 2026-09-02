@doc "    TwoTerminalLCCLineParameterUnits\n\nUnit basis for this line's impedance fields (r, rectifier/inverter rc/xc, capacitor reactances, compounding_resistance)."
struct TwoTerminalLCCLineParameterUnits
    value::String
    function TwoTerminalLCCLineParameterUnits(value::String)
        value in ("NATURAL_UNITS","COMPONENT_BASE") || throw(ArgumentError("invalid TwoTerminalLCCLineParameterUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TwoTerminalLCCLineParameterUnits}, value) = _decode(TwoTerminalLCCLineParameterUnits, value, true)
function _decode(::Type{TwoTerminalLCCLineParameterUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoTerminalLCCLine/properties/parameter_units"), value, "decoding TwoTerminalLCCLineParameterUnits"; direction = :neutral)
    return TwoTerminalLCCLineParameterUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::TwoTerminalLCCLineParameterUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoTerminalLCCLine/properties/parameter_units"), output, "encoding TwoTerminalLCCLineParameterUnits"; direction = :neutral)
end
Base.string(value::TwoTerminalLCCLineParameterUnits) = string(value.value)
