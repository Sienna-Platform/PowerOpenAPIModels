@doc "    EmissionBasis\n\nWhat an emission rate is measured against: `FUEL_INPUT` for mass per unit of heat input, `POWER_OUTPUT` for mass per unit of electrical output. The choice constrains the accompanying energy unit — a heat unit for `FUEL_INPUT`, `MWH` for `POWER_OUTPUT`."
struct EmissionBasis
    value::String
    function EmissionBasis(value::String)
        value in ("FUEL_INPUT","POWER_OUTPUT") || throw(ArgumentError("invalid EmissionBasis value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{EmissionBasis}, value) = _decode(EmissionBasis, value, true)
function _decode(::Type{EmissionBasis}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/EmissionBasis"), value, "decoding EmissionBasis"; direction = :neutral)
    return EmissionBasis(_decode(String, value, _openapi_validate))
end
function _encode(value::EmissionBasis)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/EmissionBasis"), output, "encoding EmissionBasis"; direction = :neutral)
end
Base.string(value::EmissionBasis) = string(value.value)
