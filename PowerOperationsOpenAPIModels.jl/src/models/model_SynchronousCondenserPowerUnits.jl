@doc "    SynchronousCondenserPowerUnits\n\nUnit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
struct SynchronousCondenserPowerUnits
    value::String
    function SynchronousCondenserPowerUnits(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid SynchronousCondenserPowerUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{SynchronousCondenserPowerUnits}, value) = _decode(SynchronousCondenserPowerUnits, value, true)
function _decode(::Type{SynchronousCondenserPowerUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/SynchronousCondenser/properties/power_units"), value, "decoding SynchronousCondenserPowerUnits"; direction = :neutral)
    return SynchronousCondenserPowerUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::SynchronousCondenserPowerUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/SynchronousCondenser/properties/power_units"), output, "encoding SynchronousCondenserPowerUnits"; direction = :neutral)
end
Base.string(value::SynchronousCondenserPowerUnits) = string(value.value)
