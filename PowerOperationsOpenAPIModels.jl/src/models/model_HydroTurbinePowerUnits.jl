@doc "    HydroTurbinePowerUnits\n\nUnit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
struct HydroTurbinePowerUnits
    value::String
    function HydroTurbinePowerUnits(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid HydroTurbinePowerUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{HydroTurbinePowerUnits}, value) = _decode(HydroTurbinePowerUnits, value, true)
function _decode(::Type{HydroTurbinePowerUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HydroTurbine/properties/power_units"), value, "decoding HydroTurbinePowerUnits"; direction = :neutral)
    return HydroTurbinePowerUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::HydroTurbinePowerUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HydroTurbine/properties/power_units"), output, "encoding HydroTurbinePowerUnits"; direction = :neutral)
end
Base.string(value::HydroTurbinePowerUnits) = string(value.value)
