"""
    EnergyUnitBasis

Unit basis a stored-energy quantity is recorded in. MWH: megawatt-hours, the default. MWMIN: megawatt-minutes, matching the minutes basis for operational durations.
"""
struct EnergyUnitBasis <: EnumAPIModel
    value::String
    function EnergyUnitBasis(value::String)
        value in ("MWH", "MWMIN") ||
            throw(ArgumentError("invalid EnergyUnitBasis value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{EnergyUnitBasis}, value) = _decode(EnergyUnitBasis, value, true)
function _decode(::Type{EnergyUnitBasis}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-73b8f5d70ab200b425bf.json",
            pointer="/components/schemas/EnergyUnitBasis",
        ),
        value,
        "decoding EnergyUnitBasis";
        direction=:neutral,
    )
    return EnergyUnitBasis(_decode(String, value, _openapi_validate))
end
function _encode(value::EnergyUnitBasis)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-73b8f5d70ab200b425bf.json",
            pointer="/components/schemas/EnergyUnitBasis",
        ),
        output,
        "encoding EnergyUnitBasis";
        direction=:neutral,
    )
end
Base.string(value::EnergyUnitBasis) = string(value.value)
