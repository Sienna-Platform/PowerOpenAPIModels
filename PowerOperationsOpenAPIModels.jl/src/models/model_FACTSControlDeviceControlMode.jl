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
            resource="https://openapi.invalid/schema/external-452260947985e8a3e864.json",
            pointer="/\$defs/FACTSControlDeviceControlMode",
        ),
        value,
        "decoding FACTSControlDeviceControlMode";
        direction=:neutral,
    )
    return FACTSControlDeviceControlMode(_decode(String, value, false))
end
function _encode_unvalidated(value::FACTSControlDeviceControlMode)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::FACTSControlDeviceControlMode) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-452260947985e8a3e864.json",
        pointer="/\$defs/FACTSControlDeviceControlMode",
    ),
    _encode_unvalidated(value),
    "encoding FACTSControlDeviceControlMode";
    direction=:neutral,
)
Base.string(value::FACTSControlDeviceControlMode) = string(value.value)
