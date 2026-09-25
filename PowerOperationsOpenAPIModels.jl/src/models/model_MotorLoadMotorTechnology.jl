"""
    MotorLoadMotorTechnology

AC Motor type.
"""
struct MotorLoadMotorTechnology <: EnumAPIModel
    value::String
    function MotorLoadMotorTechnology(value::String)
        value in ("INDUCTION", "SYNCHRONOUS", "UNDETERMINED") ||
            throw(ArgumentError("invalid MotorLoadMotorTechnology value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{MotorLoadMotorTechnology}, value) =
    _decode(MotorLoadMotorTechnology, value, true)
function _decode(::Type{MotorLoadMotorTechnology}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-6a7833cfb15fdfab56f5.json",
            pointer="/properties/motor_technology",
        ),
        value,
        "decoding MotorLoadMotorTechnology";
        direction=:neutral,
    )
    return MotorLoadMotorTechnology(_decode(String, value, false))
end
function _encode_unvalidated(value::MotorLoadMotorTechnology)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::MotorLoadMotorTechnology) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-6a7833cfb15fdfab56f5.json",
        pointer="/properties/motor_technology",
    ),
    _encode_unvalidated(value),
    "encoding MotorLoadMotorTechnology";
    direction=:neutral,
)
Base.string(value::MotorLoadMotorTechnology) = string(value.value)
