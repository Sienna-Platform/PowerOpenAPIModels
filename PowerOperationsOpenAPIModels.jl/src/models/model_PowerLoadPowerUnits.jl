@doc "    PowerLoadPowerUnits\n\nUnit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
struct PowerLoadPowerUnits
    value::String
    function PowerLoadPowerUnits(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid PowerLoadPowerUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{PowerLoadPowerUnits}, value) = _decode(PowerLoadPowerUnits, value, true)
function _decode(::Type{PowerLoadPowerUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/PowerLoad/properties/power_units"), value, "decoding PowerLoadPowerUnits"; direction = :neutral)
    return PowerLoadPowerUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::PowerLoadPowerUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/PowerLoad/properties/power_units"), output, "encoding PowerLoadPowerUnits"; direction = :neutral)
end
Base.string(value::PowerLoadPowerUnits) = string(value.value)
