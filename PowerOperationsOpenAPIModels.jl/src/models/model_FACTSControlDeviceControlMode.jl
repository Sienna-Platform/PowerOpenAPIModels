"""
    FACTSControlDeviceControlMode

Operating mode of a FACTS control device. OOS: both series and shunt links open. NML: both links operating. BYP: series link bypassed as a zero-impedance line; shunt link operates as a reactive-only STATCOM.
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
            resource="https://openapi.invalid/schema/root-93346ccf4b7969b6d994.json",
            pointer="/components/schemas/FACTSControlDeviceControlMode",
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
            resource="https://openapi.invalid/schema/root-93346ccf4b7969b6d994.json",
            pointer="/components/schemas/FACTSControlDeviceControlMode",
        ),
        output,
        "encoding FACTSControlDeviceControlMode";
        direction=:neutral,
    )
end
Base.string(value::FACTSControlDeviceControlMode) = string(value.value)
