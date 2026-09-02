@doc "    ExponentialLoadPowerUnits\n\nUnit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
struct ExponentialLoadPowerUnits
    value::String
    function ExponentialLoadPowerUnits(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid ExponentialLoadPowerUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ExponentialLoadPowerUnits}, value) = _decode(ExponentialLoadPowerUnits, value, true)
function _decode(::Type{ExponentialLoadPowerUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ExponentialLoad/properties/power_units"), value, "decoding ExponentialLoadPowerUnits"; direction = :neutral)
    return ExponentialLoadPowerUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::ExponentialLoadPowerUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ExponentialLoad/properties/power_units"), output, "encoding ExponentialLoadPowerUnits"; direction = :neutral)
end
Base.string(value::ExponentialLoadPowerUnits) = string(value.value)
