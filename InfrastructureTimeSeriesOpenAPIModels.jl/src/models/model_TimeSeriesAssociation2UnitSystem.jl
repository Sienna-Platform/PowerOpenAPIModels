@doc "    TimeSeriesAssociation2UnitSystem\n\nBasis the series values are already expressed in. A declaration, not a conversion: nothing here rescales values, and converting a COMPONENT_BASE series back to natural units needs the owning component's base_power. Absent means unspecified, which is deliberately not the same as NATURAL_UNITS."
struct TimeSeriesAssociation2UnitSystem
    value::String
    function TimeSeriesAssociation2UnitSystem(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid TimeSeriesAssociation2UnitSystem value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TimeSeriesAssociation2UnitSystem}, value) = _decode(TimeSeriesAssociation2UnitSystem, value, true)
function _decode(::Type{TimeSeriesAssociation2UnitSystem}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesAssociation/oneOf/1/properties/unit_system"), value, "decoding TimeSeriesAssociation2UnitSystem"; direction = :neutral)
    return TimeSeriesAssociation2UnitSystem(_decode(String, value, _openapi_validate))
end
function _encode(value::TimeSeriesAssociation2UnitSystem)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesAssociation/oneOf/1/properties/unit_system"), output, "encoding TimeSeriesAssociation2UnitSystem"; direction = :neutral)
end
Base.string(value::TimeSeriesAssociation2UnitSystem) = string(value.value)
