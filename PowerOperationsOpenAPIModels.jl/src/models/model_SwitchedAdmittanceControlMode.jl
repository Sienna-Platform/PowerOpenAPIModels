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
            resource="https://openapi.invalid/schema/external-98ed6538b1d3543b4530.json",
            pointer="/\$defs/SwitchedAdmittanceControlMode",
        ),
        value,
        "decoding SwitchedAdmittanceControlMode";
        direction=:neutral,
    )
    return SwitchedAdmittanceControlMode(_decode(String, value, false))
end
function _encode_unvalidated(value::SwitchedAdmittanceControlMode)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::SwitchedAdmittanceControlMode) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-98ed6538b1d3543b4530.json",
        pointer="/\$defs/SwitchedAdmittanceControlMode",
    ),
    _encode_unvalidated(value),
    "encoding SwitchedAdmittanceControlMode";
    direction=:neutral,
)
Base.string(value::SwitchedAdmittanceControlMode) = string(value.value)
