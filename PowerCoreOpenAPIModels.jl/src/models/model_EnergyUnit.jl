"""
    EnergyUnit

Energy unit forming the denominator of an emission rate: `MMBTU` or `GJ` for a fuel-input basis, `MWH` for a power-output basis.
"""
struct EnergyUnit <: EnumAPIModel
    value::String
    function EnergyUnit(value::String)
        value in ("MMBTU", "GJ", "MWH") ||
            throw(ArgumentError("invalid EnergyUnit value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{EnergyUnit}, value) = _decode(EnergyUnit, value, true)
function _decode(::Type{EnergyUnit}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/EnergyUnit",
        ),
        value,
        "decoding EnergyUnit";
        direction=:neutral,
    )
    return EnergyUnit(_decode(String, value, false))
end
function _encode_unvalidated(value::EnergyUnit)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::EnergyUnit) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
        pointer="/\$defs/EnergyUnit",
    ),
    _encode_unvalidated(value),
    "encoding EnergyUnit";
    direction=:neutral,
)
Base.string(value::EnergyUnit) = string(value.value)
