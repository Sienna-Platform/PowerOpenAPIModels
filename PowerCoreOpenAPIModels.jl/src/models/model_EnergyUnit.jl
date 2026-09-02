@doc "    EnergyUnit\n\nEnergy unit forming the denominator of an emission rate: `MMBTU` or `GJ` for a fuel-input basis, `MWH` for a power-output basis."
struct EnergyUnit
    value::String
    function EnergyUnit(value::String)
        value in ("MMBTU","GJ","MWH") || throw(ArgumentError("invalid EnergyUnit value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{EnergyUnit}, value) = _decode(EnergyUnit, value, true)
function _decode(::Type{EnergyUnit}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/EnergyUnit"), value, "decoding EnergyUnit"; direction = :neutral)
    return EnergyUnit(_decode(String, value, _openapi_validate))
end
function _encode(value::EnergyUnit)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/EnergyUnit"), output, "encoding EnergyUnit"; direction = :neutral)
end
Base.string(value::EnergyUnit) = string(value.value)
