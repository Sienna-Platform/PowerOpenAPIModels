@doc "    MassUnit\n\nMass unit an emission quantity is reported in: kilograms, pounds, short tons (2000 lb), or metric tons (1000 kg)."
struct MassUnit
    value::String
    function MassUnit(value::String)
        value in ("KG","LB","SHORT_TON","METRIC_TON") || throw(ArgumentError("invalid MassUnit value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{MassUnit}, value) = _decode(MassUnit, value, true)
function _decode(::Type{MassUnit}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/MassUnit"), value, "decoding MassUnit"; direction = :neutral)
    return MassUnit(_decode(String, value, _openapi_validate))
end
function _encode(value::MassUnit)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/MassUnit"), output, "encoding MassUnit"; direction = :neutral)
end
Base.string(value::MassUnit) = string(value.value)
