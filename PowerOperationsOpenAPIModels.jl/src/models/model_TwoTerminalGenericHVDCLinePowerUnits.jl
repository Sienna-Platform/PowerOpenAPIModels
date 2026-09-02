@doc "    TwoTerminalGenericHVDCLinePowerUnits\n\nUnit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
struct TwoTerminalGenericHVDCLinePowerUnits
    value::String
    function TwoTerminalGenericHVDCLinePowerUnits(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid TwoTerminalGenericHVDCLinePowerUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TwoTerminalGenericHVDCLinePowerUnits}, value) = _decode(TwoTerminalGenericHVDCLinePowerUnits, value, true)
function _decode(::Type{TwoTerminalGenericHVDCLinePowerUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoTerminalGenericHVDCLine/properties/power_units"), value, "decoding TwoTerminalGenericHVDCLinePowerUnits"; direction = :neutral)
    return TwoTerminalGenericHVDCLinePowerUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::TwoTerminalGenericHVDCLinePowerUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoTerminalGenericHVDCLine/properties/power_units"), output, "encoding TwoTerminalGenericHVDCLinePowerUnits"; direction = :neutral)
end
Base.string(value::TwoTerminalGenericHVDCLinePowerUnits) = string(value.value)
