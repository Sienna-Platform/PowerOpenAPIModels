"""
    SwitchedAdmittanceControlMode

Control mode of a switched shunt admittance. `UNDEFINED` leaves the mode unspecified; `FIXED` holds the admittance at a constant value; `CONTINUOUS_VOLTAGE` adjusts it continuously to control voltage. The `DISCRETE_*` modes switch blocks in discrete steps to control voltage, a plant's reactive power, a voltage-source-converter terminal's reactive power, or a remote bus's admittance, respectively.
"""
struct SwitchedAdmittanceControlMode <: EnumAPIModel
    value::String
    function SwitchedAdmittanceControlMode(value::String)
        value in (
            "UNDEFINED",
            "FIXED",
            "DISCRETE_VOLTAGE",
            "CONTINUOUS_VOLTAGE",
            "DISCRETE_REACTIVE_PLANT",
            "DISCRETE_REACTIVE_VSC",
            "DISCRETE_ADMITTANCE_REMOTE",
        ) || throw(
            ArgumentError("invalid SwitchedAdmittanceControlMode value $(repr(value))"),
        )
        return new(value)
    end
end
_decode(::Type{SwitchedAdmittanceControlMode}, value) =
    _decode(SwitchedAdmittanceControlMode, value, true)
function _decode(::Type{SwitchedAdmittanceControlMode}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-423dce12cabfb2353873.json",
            pointer="/\$defs/SwitchedAdmittanceControlMode",
        ),
        value,
        "decoding SwitchedAdmittanceControlMode";
        direction=:neutral,
    )
    return SwitchedAdmittanceControlMode(_decode(String, value, _openapi_validate))
end
function _encode(value::SwitchedAdmittanceControlMode)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-423dce12cabfb2353873.json",
            pointer="/\$defs/SwitchedAdmittanceControlMode",
        ),
        output,
        "encoding SwitchedAdmittanceControlMode";
        direction=:neutral,
    )
end
Base.string(value::SwitchedAdmittanceControlMode) = string(value.value)
