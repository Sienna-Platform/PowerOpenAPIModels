"""
    VSCDCControlModes

DC-side control mode of a voltage-source-converter (VSC) terminal. DC_POWER: converter controls active power transferred to the DC side. DC_VOLTAGE: converter controls the DC-side voltage. DC_VOLTAGE_DROOP: P-Vdc droop, V_dc = dc_setpoint - droop_gain * P_c.
"""
struct VSCDCControlModes <: EnumAPIModel
    value::String
    function VSCDCControlModes(value::String)
        value in ("DC_POWER", "DC_VOLTAGE", "DC_VOLTAGE_DROOP") ||
            throw(ArgumentError("invalid VSCDCControlModes value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{VSCDCControlModes}, value) = _decode(VSCDCControlModes, value, true)
function _decode(::Type{VSCDCControlModes}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-452260947985e8a3e864.json",
            pointer="/\$defs/VSCDCControlModes",
        ),
        value,
        "decoding VSCDCControlModes";
        direction=:neutral,
    )
    return VSCDCControlModes(_decode(String, value, false))
end
function _encode_unvalidated(value::VSCDCControlModes)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::VSCDCControlModes) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-452260947985e8a3e864.json",
        pointer="/\$defs/VSCDCControlModes",
    ),
    _encode_unvalidated(value),
    "encoding VSCDCControlModes";
    direction=:neutral,
)
Base.string(value::VSCDCControlModes) = string(value.value)
