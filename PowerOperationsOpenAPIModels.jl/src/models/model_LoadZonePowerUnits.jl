@doc "    LoadZonePowerUnits\n\nUnit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
struct LoadZonePowerUnits
    value::String
    function LoadZonePowerUnits(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid LoadZonePowerUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{LoadZonePowerUnits}, value) = _decode(LoadZonePowerUnits, value, true)
function _decode(::Type{LoadZonePowerUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/LoadZone/properties/power_units"), value, "decoding LoadZonePowerUnits"; direction = :neutral)
    return LoadZonePowerUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::LoadZonePowerUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/LoadZone/properties/power_units"), output, "encoding LoadZonePowerUnits"; direction = :neutral)
end
Base.string(value::LoadZonePowerUnits) = string(value.value)
