@doc "    EmissionsDataBasis\n\nFUEL_INPUT (mass per unit of heat input) or POWER_OUTPUT (mass per unit of electrical output)"
struct EmissionsDataBasis
    value::String
    function EmissionsDataBasis(value::String)
        value in ("FUEL_INPUT","POWER_OUTPUT") || throw(ArgumentError("invalid EmissionsDataBasis value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{EmissionsDataBasis}, value) = _decode(EmissionsDataBasis, value, true)
function _decode(::Type{EmissionsDataBasis}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/EmissionsData/properties/basis"), value, "decoding EmissionsDataBasis"; direction = :neutral)
    return EmissionsDataBasis(_decode(String, value, _openapi_validate))
end
function _encode(value::EmissionsDataBasis)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/EmissionsData/properties/basis"), output, "encoding EmissionsDataBasis"; direction = :neutral)
end
Base.string(value::EmissionsDataBasis) = string(value.value)
