"""
    VSCACControlModes

AC-side control mode of a voltage-source-converter (VSC) terminal. AC_REACTIVE_POWER: converter controls reactive power / fixed power factor. AC_VOLTAGE: converter holds the voltage magnitude of its regulated AC bus at the `voltage_setpoint` of that bus.
"""
struct VSCACControlModes <: EnumAPIModel
    value::String
    function VSCACControlModes(value::String)
        value in ("AC_REACTIVE_POWER", "AC_VOLTAGE") ||
            throw(ArgumentError("invalid VSCACControlModes value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{VSCACControlModes}, value) = _decode(VSCACControlModes, value, true)
function _decode(::Type{VSCACControlModes}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-ff7be472003e477ad03e.json",
            pointer="/\$defs/VSCACControlModes",
        ),
        value,
        "decoding VSCACControlModes";
        direction=:neutral,
    )
    return VSCACControlModes(_decode_zoned(String, value, false))
end
function _encode_unvalidated(value::VSCACControlModes)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::VSCACControlModes) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-ff7be472003e477ad03e.json",
        pointer="/\$defs/VSCACControlModes",
    ),
    _encode_unvalidated(value),
    "encoding VSCACControlModes";
    direction=:neutral,
)
Base.string(value::VSCACControlModes) = string(value.value)
