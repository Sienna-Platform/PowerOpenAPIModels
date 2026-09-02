@doc "    TwoTerminalVSCLinePowerUnits\n\nUnit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
struct TwoTerminalVSCLinePowerUnits
    value::String
    function TwoTerminalVSCLinePowerUnits(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid TwoTerminalVSCLinePowerUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TwoTerminalVSCLinePowerUnits}, value) = _decode(TwoTerminalVSCLinePowerUnits, value, true)
function _decode(::Type{TwoTerminalVSCLinePowerUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoTerminalVSCLine/properties/power_units"), value, "decoding TwoTerminalVSCLinePowerUnits"; direction = :neutral)
    return TwoTerminalVSCLinePowerUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::TwoTerminalVSCLinePowerUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoTerminalVSCLine/properties/power_units"), output, "encoding TwoTerminalVSCLinePowerUnits"; direction = :neutral)
end
Base.string(value::TwoTerminalVSCLinePowerUnits) = string(value.value)
