@doc "    HydroPumpTurbinePowerUnits\n\nUnit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
struct HydroPumpTurbinePowerUnits
    value::String
    function HydroPumpTurbinePowerUnits(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid HydroPumpTurbinePowerUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{HydroPumpTurbinePowerUnits}, value) = _decode(HydroPumpTurbinePowerUnits, value, true)
function _decode(::Type{HydroPumpTurbinePowerUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HydroPumpTurbine/properties/power_units"), value, "decoding HydroPumpTurbinePowerUnits"; direction = :neutral)
    return HydroPumpTurbinePowerUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::HydroPumpTurbinePowerUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HydroPumpTurbine/properties/power_units"), output, "encoding HydroPumpTurbinePowerUnits"; direction = :neutral)
end
Base.string(value::HydroPumpTurbinePowerUnits) = string(value.value)
