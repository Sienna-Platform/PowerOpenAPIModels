@doc "    EmissionsDataMassUnit\n\nMass unit of the emission rate numerator"
struct EmissionsDataMassUnit
    value::String
    function EmissionsDataMassUnit(value::String)
        value in ("KG","LB","SHORT_TON","METRIC_TON") || throw(ArgumentError("invalid EmissionsDataMassUnit value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{EmissionsDataMassUnit}, value) = _decode(EmissionsDataMassUnit, value, true)
function _decode(::Type{EmissionsDataMassUnit}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/EmissionsData/properties/mass_unit"), value, "decoding EmissionsDataMassUnit"; direction = :neutral)
    return EmissionsDataMassUnit(_decode(String, value, _openapi_validate))
end
function _encode(value::EmissionsDataMassUnit)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/EmissionsData/properties/mass_unit"), output, "encoding EmissionsDataMassUnit"; direction = :neutral)
end
Base.string(value::EmissionsDataMassUnit) = string(value.value)
