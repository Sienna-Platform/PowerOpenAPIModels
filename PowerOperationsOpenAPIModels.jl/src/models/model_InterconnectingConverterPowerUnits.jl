@doc "    InterconnectingConverterPowerUnits\n\nUnit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
struct InterconnectingConverterPowerUnits
    value::String
    function InterconnectingConverterPowerUnits(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid InterconnectingConverterPowerUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{InterconnectingConverterPowerUnits}, value) = _decode(InterconnectingConverterPowerUnits, value, true)
function _decode(::Type{InterconnectingConverterPowerUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/InterconnectingConverter/properties/power_units"), value, "decoding InterconnectingConverterPowerUnits"; direction = :neutral)
    return InterconnectingConverterPowerUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::InterconnectingConverterPowerUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/InterconnectingConverter/properties/power_units"), output, "encoding InterconnectingConverterPowerUnits"; direction = :neutral)
end
Base.string(value::InterconnectingConverterPowerUnits) = string(value.value)
