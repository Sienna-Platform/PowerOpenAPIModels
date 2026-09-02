@doc "    VSCDCControlModes\n\nDC-side control mode of a voltage-source-converter (VSC) terminal. DC_POWER: converter controls active power transferred to the DC side. DC_VOLTAGE: converter controls the DC-side voltage. DC_VOLTAGE_DROOP: P-Vdc droop, V_dc = dc_setpoint - droop_gain * P_c."
struct VSCDCControlModes
    value::String
    function VSCDCControlModes(value::String)
        value in ("DC_POWER","DC_VOLTAGE","DC_VOLTAGE_DROOP") || throw(ArgumentError("invalid VSCDCControlModes value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{VSCDCControlModes}, value) = _decode(VSCDCControlModes, value, true)
function _decode(::Type{VSCDCControlModes}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/VSCDCControlModes"), value, "decoding VSCDCControlModes"; direction = :neutral)
    return VSCDCControlModes(_decode(String, value, _openapi_validate))
end
function _encode(value::VSCDCControlModes)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/VSCDCControlModes"), output, "encoding VSCDCControlModes"; direction = :neutral)
end
Base.string(value::VSCDCControlModes) = string(value.value)
