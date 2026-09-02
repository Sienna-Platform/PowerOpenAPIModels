@doc "    DeterministicSingleTimeSeriesUnitSystem\n\nBasis the series values are already expressed in. A declaration, not a conversion: nothing here rescales values, and converting a COMPONENT_BASE series back to natural units needs the owning component's base_power. Absent means unspecified, which is deliberately not the same as NATURAL_UNITS."
struct DeterministicSingleTimeSeriesUnitSystem
    value::String
    function DeterministicSingleTimeSeriesUnitSystem(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid DeterministicSingleTimeSeriesUnitSystem value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{DeterministicSingleTimeSeriesUnitSystem}, value) = _decode(DeterministicSingleTimeSeriesUnitSystem, value, true)
function _decode(::Type{DeterministicSingleTimeSeriesUnitSystem}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/DeterministicSingleTimeSeries/properties/unit_system"), value, "decoding DeterministicSingleTimeSeriesUnitSystem"; direction = :neutral)
    return DeterministicSingleTimeSeriesUnitSystem(_decode(String, value, _openapi_validate))
end
function _encode(value::DeterministicSingleTimeSeriesUnitSystem)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/DeterministicSingleTimeSeries/properties/unit_system"), output, "encoding DeterministicSingleTimeSeriesUnitSystem"; direction = :neutral)
end
Base.string(value::DeterministicSingleTimeSeriesUnitSystem) = string(value.value)
