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
    return LCCControlMode(_decode(String, value, false))
end
function _encode_unvalidated(value::LCCControlMode)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::LCCControlMode) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-452260947985e8a3e864.json",
        pointer="/\$defs/LCCControlMode",
    ),
    _encode_unvalidated(value),
    "encoding LCCControlMode";
    direction=:neutral,
)
Base.string(value::LCCControlMode) = string(value.value)
