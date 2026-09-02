@doc "    StandardLoadPowerUnits\n\nUnit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
struct StandardLoadPowerUnits
    value::String
    function StandardLoadPowerUnits(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid StandardLoadPowerUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{StandardLoadPowerUnits}, value) = _decode(StandardLoadPowerUnits, value, true)
function _decode(::Type{StandardLoadPowerUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/StandardLoad/properties/power_units"), value, "decoding StandardLoadPowerUnits"; direction = :neutral)
    return StandardLoadPowerUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::StandardLoadPowerUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/StandardLoad/properties/power_units"), output, "encoding StandardLoadPowerUnits"; direction = :neutral)
end
Base.string(value::StandardLoadPowerUnits) = string(value.value)
