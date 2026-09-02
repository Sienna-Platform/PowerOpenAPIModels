@doc "    RenewableDispatchPowerUnits\n\nUnit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
struct RenewableDispatchPowerUnits
    value::String
    function RenewableDispatchPowerUnits(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid RenewableDispatchPowerUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{RenewableDispatchPowerUnits}, value) = _decode(RenewableDispatchPowerUnits, value, true)
function _decode(::Type{RenewableDispatchPowerUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/RenewableDispatch/properties/power_units"), value, "decoding RenewableDispatchPowerUnits"; direction = :neutral)
    return RenewableDispatchPowerUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::RenewableDispatchPowerUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/RenewableDispatch/properties/power_units"), output, "encoding RenewableDispatchPowerUnits"; direction = :neutral)
end
Base.string(value::RenewableDispatchPowerUnits) = string(value.value)
