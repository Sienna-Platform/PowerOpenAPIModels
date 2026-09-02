@doc "    InterruptibleStandardLoadPowerUnits\n\nUnit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
struct InterruptibleStandardLoadPowerUnits
    value::String
    function InterruptibleStandardLoadPowerUnits(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid InterruptibleStandardLoadPowerUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{InterruptibleStandardLoadPowerUnits}, value) = _decode(InterruptibleStandardLoadPowerUnits, value, true)
function _decode(::Type{InterruptibleStandardLoadPowerUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/InterruptibleStandardLoad/properties/power_units"), value, "decoding InterruptibleStandardLoadPowerUnits"; direction = :neutral)
    return InterruptibleStandardLoadPowerUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::InterruptibleStandardLoadPowerUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/InterruptibleStandardLoad/properties/power_units"), output, "encoding InterruptibleStandardLoadPowerUnits"; direction = :neutral)
end
Base.string(value::InterruptibleStandardLoadPowerUnits) = string(value.value)
