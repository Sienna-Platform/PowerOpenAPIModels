@doc "    ThermalMultiStartPowerUnits\n\nUnit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
struct ThermalMultiStartPowerUnits
    value::String
    function ThermalMultiStartPowerUnits(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid ThermalMultiStartPowerUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ThermalMultiStartPowerUnits}, value) = _decode(ThermalMultiStartPowerUnits, value, true)
function _decode(::Type{ThermalMultiStartPowerUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ThermalMultiStart/properties/power_units"), value, "decoding ThermalMultiStartPowerUnits"; direction = :neutral)
    return ThermalMultiStartPowerUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::ThermalMultiStartPowerUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ThermalMultiStart/properties/power_units"), output, "encoding ThermalMultiStartPowerUnits"; direction = :neutral)
end
Base.string(value::ThermalMultiStartPowerUnits) = string(value.value)
