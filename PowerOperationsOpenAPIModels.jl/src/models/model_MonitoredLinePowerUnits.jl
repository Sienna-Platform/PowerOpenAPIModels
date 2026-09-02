@doc "    MonitoredLinePowerUnits\n\nUnit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
struct MonitoredLinePowerUnits
    value::String
    function MonitoredLinePowerUnits(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid MonitoredLinePowerUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{MonitoredLinePowerUnits}, value) = _decode(MonitoredLinePowerUnits, value, true)
function _decode(::Type{MonitoredLinePowerUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/MonitoredLine/properties/power_units"), value, "decoding MonitoredLinePowerUnits"; direction = :neutral)
    return MonitoredLinePowerUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::MonitoredLinePowerUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/MonitoredLine/properties/power_units"), output, "encoding MonitoredLinePowerUnits"; direction = :neutral)
end
Base.string(value::MonitoredLinePowerUnits) = string(value.value)
