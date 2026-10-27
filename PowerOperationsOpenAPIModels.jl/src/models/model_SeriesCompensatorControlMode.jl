"""
    SeriesCompensatorControlMode

Control mode of a series compensator. `FIXED` holds the series impedance constant (a series capacitor; PSS/E FACTS MODE 3). `BYPASSED` shorts the compensator into a zero-impedance tie (PSS/E FACTS MODE 2). `DISPATCHABLE` makes the series reactance a decision within `reactance_limits`. `ACTIVE_POWER_FLOW` sets the series reactance to hold `active_power_flow_setpoint`.
"""
struct SeriesCompensatorControlMode <: EnumAPIModel
    value::String
    function SeriesCompensatorControlMode(value::String)
        value in ("FIXED", "BYPASSED", "DISPATCHABLE", "ACTIVE_POWER_FLOW") || throw(
            ArgumentError("invalid SeriesCompensatorControlMode value $(repr(value))"),
        )
        return new(value)
    end
end
_decode(::Type{SeriesCompensatorControlMode}, value) =
    _decode(SeriesCompensatorControlMode, value, true)
function _decode(::Type{SeriesCompensatorControlMode}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-78d2af7f707125adba7e.json",
            pointer="/\$defs/SeriesCompensatorControlMode",
        ),
        value,
        "decoding SeriesCompensatorControlMode";
        direction=:neutral,
    )
    return SeriesCompensatorControlMode(_decode(String, value, false))
end
function _encode_unvalidated(value::SeriesCompensatorControlMode)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::SeriesCompensatorControlMode) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-78d2af7f707125adba7e.json",
        pointer="/\$defs/SeriesCompensatorControlMode",
    ),
    _encode_unvalidated(value),
    "encoding SeriesCompensatorControlMode";
    direction=:neutral,
)
Base.string(value::SeriesCompensatorControlMode) = string(value.value)
