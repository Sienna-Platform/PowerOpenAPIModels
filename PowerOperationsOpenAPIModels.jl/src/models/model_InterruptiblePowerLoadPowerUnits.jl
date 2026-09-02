@doc "    InterruptiblePowerLoadPowerUnits\n\nUnit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
struct InterruptiblePowerLoadPowerUnits
    value::String
    function InterruptiblePowerLoadPowerUnits(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid InterruptiblePowerLoadPowerUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{InterruptiblePowerLoadPowerUnits}, value) = _decode(InterruptiblePowerLoadPowerUnits, value, true)
function _decode(::Type{InterruptiblePowerLoadPowerUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/InterruptiblePowerLoad/properties/power_units"), value, "decoding InterruptiblePowerLoadPowerUnits"; direction = :neutral)
    return InterruptiblePowerLoadPowerUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::InterruptiblePowerLoadPowerUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/InterruptiblePowerLoad/properties/power_units"), output, "encoding InterruptiblePowerLoadPowerUnits"; direction = :neutral)
end
Base.string(value::InterruptiblePowerLoadPowerUnits) = string(value.value)
