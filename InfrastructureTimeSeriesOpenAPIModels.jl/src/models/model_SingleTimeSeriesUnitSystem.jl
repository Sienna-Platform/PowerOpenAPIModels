@doc "    SingleTimeSeriesUnitSystem\n\nBasis the series values are already expressed in. A declaration, not a conversion: nothing here rescales values, and converting a COMPONENT_BASE series back to natural units needs the owning component's base_power. Absent means unspecified, which is deliberately not the same as NATURAL_UNITS."
struct SingleTimeSeriesUnitSystem
    value::String
    function SingleTimeSeriesUnitSystem(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid SingleTimeSeriesUnitSystem value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{SingleTimeSeriesUnitSystem}, value) = _decode(SingleTimeSeriesUnitSystem, value, true)
function _decode(::Type{SingleTimeSeriesUnitSystem}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-d907e2d1c7ab387eab6d.json", pointer = "/components/schemas/SingleTimeSeries/properties/unit_system"), value, "decoding SingleTimeSeriesUnitSystem"; direction = :neutral)
    return SingleTimeSeriesUnitSystem(_decode(String, value, _openapi_validate))
end
function _encode(value::SingleTimeSeriesUnitSystem)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-d907e2d1c7ab387eab6d.json", pointer = "/components/schemas/SingleTimeSeries/properties/unit_system"), output, "encoding SingleTimeSeriesUnitSystem"; direction = :neutral)
end
Base.string(value::SingleTimeSeriesUnitSystem) = string(value.value)
