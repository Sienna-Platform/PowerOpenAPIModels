@doc "    SourcePowerUnits\n\nUnit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
struct SourcePowerUnits
    value::String
    function SourcePowerUnits(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid SourcePowerUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{SourcePowerUnits}, value) = _decode(SourcePowerUnits, value, true)
function _decode(::Type{SourcePowerUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/Source/properties/power_units"), value, "decoding SourcePowerUnits"; direction = :neutral)
    return SourcePowerUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::SourcePowerUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/Source/properties/power_units"), output, "encoding SourcePowerUnits"; direction = :neutral)
end
Base.string(value::SourcePowerUnits) = string(value.value)
