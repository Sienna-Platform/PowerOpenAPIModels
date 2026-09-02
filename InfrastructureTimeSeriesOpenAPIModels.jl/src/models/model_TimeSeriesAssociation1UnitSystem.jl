@doc "    TimeSeriesAssociation1UnitSystem\n\nBasis the series values are already expressed in. A declaration, not a conversion: nothing here rescales values, and converting a COMPONENT_BASE series back to natural units needs the owning component's base_power. Absent means unspecified, which is deliberately not the same as NATURAL_UNITS."
struct TimeSeriesAssociation1UnitSystem
    value::String
    function TimeSeriesAssociation1UnitSystem(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid TimeSeriesAssociation1UnitSystem value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TimeSeriesAssociation1UnitSystem}, value) = _decode(TimeSeriesAssociation1UnitSystem, value, true)
function _decode(::Type{TimeSeriesAssociation1UnitSystem}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesAssociation/oneOf/0/properties/unit_system"), value, "decoding TimeSeriesAssociation1UnitSystem"; direction = :neutral)
    return TimeSeriesAssociation1UnitSystem(_decode(String, value, _openapi_validate))
end
function _encode(value::TimeSeriesAssociation1UnitSystem)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesAssociation/oneOf/0/properties/unit_system"), output, "encoding TimeSeriesAssociation1UnitSystem"; direction = :neutral)
end
Base.string(value::TimeSeriesAssociation1UnitSystem) = string(value.value)
