@doc "    FACTSControlDevicePowerUnits\n\nUnit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
struct FACTSControlDevicePowerUnits
    value::String
    function FACTSControlDevicePowerUnits(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid FACTSControlDevicePowerUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{FACTSControlDevicePowerUnits}, value) = _decode(FACTSControlDevicePowerUnits, value, true)
function _decode(::Type{FACTSControlDevicePowerUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/FACTSControlDevice/properties/power_units"), value, "decoding FACTSControlDevicePowerUnits"; direction = :neutral)
    return FACTSControlDevicePowerUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::FACTSControlDevicePowerUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/FACTSControlDevice/properties/power_units"), output, "encoding FACTSControlDevicePowerUnits"; direction = :neutral)
end
Base.string(value::FACTSControlDevicePowerUnits) = string(value.value)
