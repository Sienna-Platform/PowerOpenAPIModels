"""
    LCCControlMode

Control mode of an LCC-HVDC line (PSS/E MDC). BLOCKED: the line is blocked and holds no schedule. POWER: the line holds a power schedule (power_transfer_setpoint, MW). CURRENT: the line holds a current schedule (current_transfer_setpoint, A).
"""
struct LCCControlMode <: EnumAPIModel
    value::String
    function LCCControlMode(value::String)
        value in ("BLOCKED", "POWER", "CURRENT") ||
            throw(ArgumentError("invalid LCCControlMode value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{LCCControlMode}, value) = _decode(LCCControlMode, value, true)
function _decode(::Type{LCCControlMode}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-452260947985e8a3e864.json",
            pointer="/\$defs/LCCControlMode",
        ),
        value,
        "decoding LCCControlMode";
        direction=:neutral,
    )
    return LCCControlMode(_decode(String, value, _openapi_validate))
end
function _encode(value::LCCControlMode)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-452260947985e8a3e864.json",
            pointer="/\$defs/LCCControlMode",
        ),
        output,
        "encoding LCCControlMode";
        direction=:neutral,
    )
end
Base.string(value::LCCControlMode) = string(value.value)
