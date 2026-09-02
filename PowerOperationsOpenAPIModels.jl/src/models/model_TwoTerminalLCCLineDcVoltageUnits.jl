@doc "    TwoTerminalLCCLineDcVoltageUnits\n\nUnit basis for the DC voltage fields (scheduled_dc_voltage, switch_mode_voltage, min_compounding_voltage)."
struct TwoTerminalLCCLineDcVoltageUnits
    value::String
    function TwoTerminalLCCLineDcVoltageUnits(value::String)
        value in ("NATURAL_UNITS","COMPONENT_BASE") || throw(ArgumentError("invalid TwoTerminalLCCLineDcVoltageUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TwoTerminalLCCLineDcVoltageUnits}, value) = _decode(TwoTerminalLCCLineDcVoltageUnits, value, true)
function _decode(::Type{TwoTerminalLCCLineDcVoltageUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TwoTerminalLCCLine/properties/dc_voltage_units"), value, "decoding TwoTerminalLCCLineDcVoltageUnits"; direction = :neutral)
    return TwoTerminalLCCLineDcVoltageUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::TwoTerminalLCCLineDcVoltageUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TwoTerminalLCCLine/properties/dc_voltage_units"), output, "encoding TwoTerminalLCCLineDcVoltageUnits"; direction = :neutral)
end
Base.string(value::TwoTerminalLCCLineDcVoltageUnits) = string(value.value)
