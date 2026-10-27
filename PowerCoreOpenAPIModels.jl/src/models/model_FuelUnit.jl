"""
    FuelUnit

Fuel quantity a `FuelCurve` is expressed in: `MMBTU` (million British thermal units) or `GJ` (gigajoules) of heat content.
"""
struct FuelUnit <: EnumAPIModel
    value::String
    function FuelUnit(value::String)
        value in ("MMBTU", "GJ") ||
            throw(ArgumentError("invalid FuelUnit value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{FuelUnit}, value) = _decode(FuelUnit, value, true)
function _decode(::Type{FuelUnit}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-3e112e0f84e55d01dc3d.json",
            pointer="/\$defs/FuelUnit",
        ),
        value,
        "decoding FuelUnit";
        direction=:neutral,
    )
    return FuelUnit(_decode(String, value, false))
end
function _encode_unvalidated(value::FuelUnit)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::FuelUnit) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-3e112e0f84e55d01dc3d.json",
        pointer="/\$defs/FuelUnit",
    ),
    _encode_unvalidated(value),
    "encoding FuelUnit";
    direction=:neutral,
)
Base.string(value::FuelUnit) = string(value.value)
