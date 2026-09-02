@doc "    NonSequentialTimeSeriesUnitSystem\n\nBasis the series values are already expressed in. A declaration, not a conversion: nothing here rescales values, and converting a COMPONENT_BASE series back to natural units needs the owning component's base_power. Absent means unspecified, which is deliberately not the same as NATURAL_UNITS."
struct NonSequentialTimeSeriesUnitSystem
    value::String
    function NonSequentialTimeSeriesUnitSystem(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid NonSequentialTimeSeriesUnitSystem value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{NonSequentialTimeSeriesUnitSystem}, value) = _decode(NonSequentialTimeSeriesUnitSystem, value, true)
function _decode(::Type{NonSequentialTimeSeriesUnitSystem}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-d907e2d1c7ab387eab6d.json", pointer = "/components/schemas/NonSequentialTimeSeries/properties/unit_system"), value, "decoding NonSequentialTimeSeriesUnitSystem"; direction = :neutral)
    return NonSequentialTimeSeriesUnitSystem(_decode(String, value, _openapi_validate))
end
function _encode(value::NonSequentialTimeSeriesUnitSystem)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-d907e2d1c7ab387eab6d.json", pointer = "/components/schemas/NonSequentialTimeSeries/properties/unit_system"), output, "encoding NonSequentialTimeSeriesUnitSystem"; direction = :neutral)
end
Base.string(value::NonSequentialTimeSeriesUnitSystem) = string(value.value)
