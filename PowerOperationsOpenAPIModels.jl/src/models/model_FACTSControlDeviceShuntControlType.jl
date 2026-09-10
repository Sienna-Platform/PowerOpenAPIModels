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
            resource="https://openapi.invalid/schema/root-7e224747fa2ab31185c8.json",
            pointer="/components/schemas/FACTSControlDevice/properties/shunt_control_type",
        ),
        value,
        "decoding FACTSControlDeviceShuntControlType";
        direction=:neutral,
    )
    return FACTSControlDeviceShuntControlType(_decode(String, value, _openapi_validate))
end
function _encode(value::FACTSControlDeviceShuntControlType)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-7e224747fa2ab31185c8.json",
            pointer="/components/schemas/FACTSControlDevice/properties/shunt_control_type",
        ),
        output,
        "encoding FACTSControlDeviceShuntControlType";
        direction=:neutral,
    )
end
Base.string(value::FACTSControlDeviceShuntControlType) = string(value.value)
