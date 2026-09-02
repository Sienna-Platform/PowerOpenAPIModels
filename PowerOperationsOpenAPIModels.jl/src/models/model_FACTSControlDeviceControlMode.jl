@doc "    FACTSControlDeviceControlMode\n\nControl mode. Used to describe the behavior of the control device. in psy5 a required param with an option to be nothing"
struct FACTSControlDeviceControlMode
    value::String
    function FACTSControlDeviceControlMode(value::String)
        value in ("OOS","NML","BYP") || throw(ArgumentError("invalid FACTSControlDeviceControlMode value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{FACTSControlDeviceControlMode}, value) = _decode(FACTSControlDeviceControlMode, value, true)
function _decode(::Type{FACTSControlDeviceControlMode}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/FACTSControlDevice/properties/control_mode"), value, "decoding FACTSControlDeviceControlMode"; direction = :neutral)
    return FACTSControlDeviceControlMode(_decode(String, value, _openapi_validate))
end
function _encode(value::FACTSControlDeviceControlMode)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/FACTSControlDevice/properties/control_mode"), output, "encoding FACTSControlDeviceControlMode"; direction = :neutral)
end
Base.string(value::FACTSControlDeviceControlMode) = string(value.value)
