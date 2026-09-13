"""
    FACTSControlDeviceControlMode

Operating mode of a FACTS control device. `OOS` (out-of-service): both series and shunt links are open. `NML` (normal): both series and shunt links are operating. `BYP` (bypass): the series link is bypassed (acts as a zero-impedance line) and the shunt link operates as a STATCOM (reactive-only).
"""
struct FACTSControlDeviceControlMode <: EnumAPIModel
    value::String
    function FACTSControlDeviceControlMode(value::String)
        value in ("OOS", "NML", "BYP") || throw(
            ArgumentError("invalid FACTSControlDeviceControlMode value $(repr(value))"),
        )
        return new(value)
    end
end
_decode(::Type{FACTSControlDeviceControlMode}, value) =
    _decode(FACTSControlDeviceControlMode, value, true)
function _decode(::Type{FACTSControlDeviceControlMode}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-ddecbf0b8a8ce9be5178.json",
            pointer="/\$defs/FACTSControlDeviceControlMode",
        ),
        value,
        "decoding FACTSControlDeviceControlMode";
        direction=:neutral,
    )
    return FACTSControlDeviceControlMode(_decode(String, value, _openapi_validate))
end
function _encode(value::FACTSControlDeviceControlMode)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-ddecbf0b8a8ce9be5178.json",
            pointer="/\$defs/FACTSControlDeviceControlMode",
        ),
        output,
        "encoding FACTSControlDeviceControlMode";
        direction=:neutral,
    )
end
Base.string(value::FACTSControlDeviceControlMode) = string(value.value)
