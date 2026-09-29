"""
    SwitchedAdmittanceControlMode

Control mode of a switched shunt admittance (PSS/E MODSW). `UNDEFINED` leaves the mode unspecified; `FIXED` holds the admittance constant. `DISCRETE_VOLTAGE` and `CONTINUOUS_VOLTAGE` regulate voltage in steps or continuously and use `voltage_limits`. `DISCRETE_REACTIVE_PLANT`, `DISCRETE_REACTIVE_VSC`, `DISCRETE_ADMITTANCE_REMOTE` and `DISCRETE_REACTIVE_FACTS` regulate a plant's, a voltage-source-converter terminal's, a remote bus's, or a FACTS device's reactive quantity in steps and use `reactive_power_range_limits`.
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
            "DISCRETE_REACTIVE_FACTS",
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
            resource="https://openapi.invalid/schema/external-452260947985e8a3e864.json",
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
        resource="https://openapi.invalid/schema/external-452260947985e8a3e864.json",
        pointer="/\$defs/SwitchedAdmittanceControlMode",
    ),
    _encode_unvalidated(value),
    "encoding SwitchedAdmittanceControlMode";
    direction=:neutral,
)
Base.string(value::SwitchedAdmittanceControlMode) = string(value.value)
