@doc "    MotorLoadMotorTechnology\n\nAC Motor type."
struct MotorLoadMotorTechnology
    value::String
    function MotorLoadMotorTechnology(value::String)
        value in ("INDUCTION","SYNCHRONOUS","UNDETERMINED") || throw(ArgumentError("invalid MotorLoadMotorTechnology value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{MotorLoadMotorTechnology}, value) = _decode(MotorLoadMotorTechnology, value, true)
function _decode(::Type{MotorLoadMotorTechnology}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/MotorLoad/properties/motor_technology"), value, "decoding MotorLoadMotorTechnology"; direction = :neutral)
    return MotorLoadMotorTechnology(_decode(String, value, _openapi_validate))
end
function _encode(value::MotorLoadMotorTechnology)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/MotorLoad/properties/motor_technology"), output, "encoding MotorLoadMotorTechnology"; direction = :neutral)
end
Base.string(value::MotorLoadMotorTechnology) = string(value.value)
