@doc "    EmissionsDataEnergyUnit\n\nEnergy unit for the rate denominator. Must be MMBTU or GJ when basis is FUEL_INPUT, and MWH when basis is POWER_OUTPUT."
struct EmissionsDataEnergyUnit
    value::String
    function EmissionsDataEnergyUnit(value::String)
        value in ("MMBTU","GJ","MWH") || throw(ArgumentError("invalid EmissionsDataEnergyUnit value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{EmissionsDataEnergyUnit}, value) = _decode(EmissionsDataEnergyUnit, value, true)
function _decode(::Type{EmissionsDataEnergyUnit}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/EmissionsData/properties/energy_unit"), value, "decoding EmissionsDataEnergyUnit"; direction = :neutral)
    return EmissionsDataEnergyUnit(_decode(String, value, _openapi_validate))
end
function _encode(value::EmissionsDataEnergyUnit)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/EmissionsData/properties/energy_unit"), output, "encoding EmissionsDataEnergyUnit"; direction = :neutral)
end
Base.string(value::EmissionsDataEnergyUnit) = string(value.value)
