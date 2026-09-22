"""
    EmissionBasis

What an emission rate is measured against: `FUEL_INPUT` for mass per unit of heat input, `POWER_OUTPUT` for mass per unit of electrical output. The choice constrains the accompanying energy unit — a heat unit for `FUEL_INPUT`, `MWH` for `POWER_OUTPUT`.
"""
struct EmissionBasis <: EnumAPIModel
    value::String
    function EmissionBasis(value::String)
        value in ("FUEL_INPUT", "POWER_OUTPUT") ||
            throw(ArgumentError("invalid EmissionBasis value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{EmissionBasis}, value) = _decode(EmissionBasis, value, true)
function _decode(::Type{EmissionBasis}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/EmissionBasis",
        ),
        value,
        "decoding EmissionBasis";
        direction=:neutral,
    )
    return EmissionBasis(_decode(String, value, false))
end
function _encode_unvalidated(value::EmissionBasis)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::EmissionBasis) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
        pointer="/\$defs/EmissionBasis",
    ),
    _encode_unvalidated(value),
    "encoding EmissionBasis";
    direction=:neutral,
)
Base.string(value::EmissionBasis) = string(value.value)
