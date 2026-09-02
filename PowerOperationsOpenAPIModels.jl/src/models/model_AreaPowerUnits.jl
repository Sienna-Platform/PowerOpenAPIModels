@doc "    AreaPowerUnits\n\nUnit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
struct AreaPowerUnits
    value::String
    function AreaPowerUnits(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid AreaPowerUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{AreaPowerUnits}, value) = _decode(AreaPowerUnits, value, true)
function _decode(::Type{AreaPowerUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/Area/properties/power_units"), value, "decoding AreaPowerUnits"; direction = :neutral)
    return AreaPowerUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::AreaPowerUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/Area/properties/power_units"), output, "encoding AreaPowerUnits"; direction = :neutral)
end
Base.string(value::AreaPowerUnits) = string(value.value)
