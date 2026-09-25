"""
    FACTSControlDeviceShuntControlType

Device class selecting the reactive-limit law (SVC vs STATCOM).
"""
struct FACTSControlDeviceShuntControlType <: EnumAPIModel
    value::String
    function FACTSControlDeviceShuntControlType(value::String)
        value in ("SVC", "STATCOM") || throw(
            ArgumentError(
                "invalid FACTSControlDeviceShuntControlType value $(repr(value))",
            ),
        )
        return new(value)
    end
end
_decode(::Type{FACTSControlDeviceShuntControlType}, value) =
    _decode(FACTSControlDeviceShuntControlType, value, true)
function _decode(::Type{FACTSControlDeviceShuntControlType}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-865b3a15cab0f0d4981c.json",
            pointer="/properties/shunt_control_type",
        ),
        value,
        "decoding FACTSControlDeviceShuntControlType";
        direction=:neutral,
    )
    return FACTSControlDeviceShuntControlType(_decode(String, value, false))
end
function _encode_unvalidated(value::FACTSControlDeviceShuntControlType)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::FACTSControlDeviceShuntControlType) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-865b3a15cab0f0d4981c.json",
        pointer="/properties/shunt_control_type",
    ),
    _encode_unvalidated(value),
    "encoding FACTSControlDeviceShuntControlType";
    direction=:neutral,
)
Base.string(value::FACTSControlDeviceShuntControlType) = string(value.value)
