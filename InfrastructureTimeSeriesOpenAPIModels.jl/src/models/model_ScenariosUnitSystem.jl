@doc "    ScenariosUnitSystem\n\nBasis the series values are already expressed in. A declaration, not a conversion: nothing here rescales values, and converting a COMPONENT_BASE series back to natural units needs the owning component's base_power. Absent means unspecified, which is deliberately not the same as NATURAL_UNITS."
struct ScenariosUnitSystem
    value::String
    function ScenariosUnitSystem(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid ScenariosUnitSystem value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ScenariosUnitSystem}, value) = _decode(ScenariosUnitSystem, value, true)
function _decode(::Type{ScenariosUnitSystem}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-d907e2d1c7ab387eab6d.json", pointer = "/components/schemas/Scenarios/properties/unit_system"), value, "decoding ScenariosUnitSystem"; direction = :neutral)
    return ScenariosUnitSystem(_decode(String, value, _openapi_validate))
end
function _encode(value::ScenariosUnitSystem)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-d907e2d1c7ab387eab6d.json", pointer = "/components/schemas/Scenarios/properties/unit_system"), output, "encoding ScenariosUnitSystem"; direction = :neutral)
end
Base.string(value::ScenariosUnitSystem) = string(value.value)
