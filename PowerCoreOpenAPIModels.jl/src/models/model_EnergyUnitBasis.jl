"""
    EnergyUnitBasis

Unit basis a stored-energy quantity is recorded in (distinct from EnergyUnit, which names fuel energy content). MWH: megawatt-hours, the conventional interchange form. MWMIN: megawatt-minutes, consistent with the minutes basis used for operational durations, so a duration computed as energy over power comes out in minutes with no hidden factor of 60. Defaults to MWH: MWMIN is supported, not preferred.
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
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/EnergyUnitBasis",
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
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/EnergyUnitBasis",
        ),
        output,
        "encoding EnergyUnitBasis";
        direction=:neutral,
    )
end
Base.string(value::EnergyUnitBasis) = string(value.value)
