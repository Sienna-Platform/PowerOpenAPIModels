"""
    SwitchedAdmittanceControlMode

Control mode of a switched shunt admittance. UNDEFINED: unspecified. FIXED: constant value. CONTINUOUS_VOLTAGE: adjusts continuously. DISCRETE_* modes switch blocks stepwise to control voltage, reactive power, or a remote bus's admittance.
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
            resource="https://openapi.invalid/schema/root-93346ccf4b7969b6d994.json",
            pointer="/components/schemas/SwitchedAdmittanceControlMode",
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
            resource="https://openapi.invalid/schema/root-93346ccf4b7969b6d994.json",
            pointer="/components/schemas/SwitchedAdmittanceControlMode",
        ),
        output,
        "encoding SwitchedAdmittanceControlMode";
        direction=:neutral,
    )
end
Base.string(value::SwitchedAdmittanceControlMode) = string(value.value)
