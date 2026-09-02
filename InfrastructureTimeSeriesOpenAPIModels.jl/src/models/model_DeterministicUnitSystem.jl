@doc "    DeterministicUnitSystem\n\nBasis the series values are already expressed in. A declaration, not a conversion: nothing here rescales values, and converting a COMPONENT_BASE series back to natural units needs the owning component's base_power. Absent means unspecified, which is deliberately not the same as NATURAL_UNITS."
struct DeterministicUnitSystem
    value::String
    function DeterministicUnitSystem(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid DeterministicUnitSystem value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{DeterministicUnitSystem}, value) = _decode(DeterministicUnitSystem, value, true)
function _decode(::Type{DeterministicUnitSystem}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-d907e2d1c7ab387eab6d.json", pointer = "/components/schemas/Deterministic/properties/unit_system"), value, "decoding DeterministicUnitSystem"; direction = :neutral)
    return DeterministicUnitSystem(_decode(String, value, _openapi_validate))
end
function _encode(value::DeterministicUnitSystem)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-d907e2d1c7ab387eab6d.json", pointer = "/components/schemas/Deterministic/properties/unit_system"), output, "encoding DeterministicUnitSystem"; direction = :neutral)
end
Base.string(value::DeterministicUnitSystem) = string(value.value)
