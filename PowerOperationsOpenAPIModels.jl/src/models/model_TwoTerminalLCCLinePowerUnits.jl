@doc "    TwoTerminalLCCLinePowerUnits\n\nUnit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
struct TwoTerminalLCCLinePowerUnits
    value::String
    function TwoTerminalLCCLinePowerUnits(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid TwoTerminalLCCLinePowerUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TwoTerminalLCCLinePowerUnits}, value) = _decode(TwoTerminalLCCLinePowerUnits, value, true)
function _decode(::Type{TwoTerminalLCCLinePowerUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TwoTerminalLCCLine/properties/power_units"), value, "decoding TwoTerminalLCCLinePowerUnits"; direction = :neutral)
    return TwoTerminalLCCLinePowerUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::TwoTerminalLCCLinePowerUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TwoTerminalLCCLine/properties/power_units"), output, "encoding TwoTerminalLCCLinePowerUnits"; direction = :neutral)
end
Base.string(value::TwoTerminalLCCLinePowerUnits) = string(value.value)
