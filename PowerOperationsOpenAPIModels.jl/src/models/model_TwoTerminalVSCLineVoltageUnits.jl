@doc "    TwoTerminalVSCLineVoltageUnits\n\nUnit basis for the DC bus voltage limits (voltage_limits_from/to only). Independent of setpoint_voltage_units, which covers dc_setpoint_from/to and ac_setpoint_from/to."
struct TwoTerminalVSCLineVoltageUnits
    value::String
    function TwoTerminalVSCLineVoltageUnits(value::String)
        value in ("NATURAL_UNITS","COMPONENT_BASE") || throw(ArgumentError("invalid TwoTerminalVSCLineVoltageUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TwoTerminalVSCLineVoltageUnits}, value) = _decode(TwoTerminalVSCLineVoltageUnits, value, true)
function _decode(::Type{TwoTerminalVSCLineVoltageUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TwoTerminalVSCLine/properties/voltage_units"), value, "decoding TwoTerminalVSCLineVoltageUnits"; direction = :neutral)
    return TwoTerminalVSCLineVoltageUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::TwoTerminalVSCLineVoltageUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TwoTerminalVSCLine/properties/voltage_units"), output, "encoding TwoTerminalVSCLineVoltageUnits"; direction = :neutral)
end
Base.string(value::TwoTerminalVSCLineVoltageUnits) = string(value.value)
