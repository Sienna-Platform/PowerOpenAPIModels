@doc "    LinePowerUnits\n\nUnit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
struct LinePowerUnits
    value::String
    function LinePowerUnits(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid LinePowerUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{LinePowerUnits}, value) = _decode(LinePowerUnits, value, true)
function _decode(::Type{LinePowerUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/Line/properties/power_units"), value, "decoding LinePowerUnits"; direction = :neutral)
    return LinePowerUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::LinePowerUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/Line/properties/power_units"), output, "encoding LinePowerUnits"; direction = :neutral)
end
Base.string(value::LinePowerUnits) = string(value.value)
