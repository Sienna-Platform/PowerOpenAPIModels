@doc "    HybridSystemPowerUnits\n\nUnit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
struct HybridSystemPowerUnits
    value::String
    function HybridSystemPowerUnits(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid HybridSystemPowerUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{HybridSystemPowerUnits}, value) = _decode(HybridSystemPowerUnits, value, true)
function _decode(::Type{HybridSystemPowerUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HybridSystem/properties/power_units"), value, "decoding HybridSystemPowerUnits"; direction = :neutral)
    return HybridSystemPowerUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::HybridSystemPowerUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HybridSystem/properties/power_units"), output, "encoding HybridSystemPowerUnits"; direction = :neutral)
end
Base.string(value::HybridSystemPowerUnits) = string(value.value)
