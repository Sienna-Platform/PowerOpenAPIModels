@doc "    HydroDispatchPowerUnits\n\nUnit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
struct HydroDispatchPowerUnits
    value::String
    function HydroDispatchPowerUnits(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid HydroDispatchPowerUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{HydroDispatchPowerUnits}, value) = _decode(HydroDispatchPowerUnits, value, true)
function _decode(::Type{HydroDispatchPowerUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HydroDispatch/properties/power_units"), value, "decoding HydroDispatchPowerUnits"; direction = :neutral)
    return HydroDispatchPowerUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::HydroDispatchPowerUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HydroDispatch/properties/power_units"), output, "encoding HydroDispatchPowerUnits"; direction = :neutral)
end
Base.string(value::HydroDispatchPowerUnits) = string(value.value)
