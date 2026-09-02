@doc "    TwoTerminalVSCLineSetpointVoltageUnits\n\nUnit basis for the DC_VOLTAGE/DC_VOLTAGE_DROOP/AC_VOLTAGE branches of dc_setpoint_from/to and ac_setpoint_from/to. Independent of voltage_units, which covers voltage_limits_from/to only."
struct TwoTerminalVSCLineSetpointVoltageUnits
    value::String
    function TwoTerminalVSCLineSetpointVoltageUnits(value::String)
        value in ("NATURAL_UNITS","COMPONENT_BASE") || throw(ArgumentError("invalid TwoTerminalVSCLineSetpointVoltageUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TwoTerminalVSCLineSetpointVoltageUnits}, value) = _decode(TwoTerminalVSCLineSetpointVoltageUnits, value, true)
function _decode(::Type{TwoTerminalVSCLineSetpointVoltageUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoTerminalVSCLine/properties/setpoint_voltage_units"), value, "decoding TwoTerminalVSCLineSetpointVoltageUnits"; direction = :neutral)
    return TwoTerminalVSCLineSetpointVoltageUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::TwoTerminalVSCLineSetpointVoltageUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoTerminalVSCLine/properties/setpoint_voltage_units"), output, "encoding TwoTerminalVSCLineSetpointVoltageUnits"; direction = :neutral)
end
Base.string(value::TwoTerminalVSCLineSetpointVoltageUnits) = string(value.value)
