@doc "    TransformerCircuitPowerUnits\n\nUnit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
struct TransformerCircuitPowerUnits
    value::String
    function TransformerCircuitPowerUnits(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid TransformerCircuitPowerUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TransformerCircuitPowerUnits}, value) = _decode(TransformerCircuitPowerUnits, value, true)
function _decode(::Type{TransformerCircuitPowerUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TransformerCircuit/properties/power_units"), value, "decoding TransformerCircuitPowerUnits"; direction = :neutral)
    return TransformerCircuitPowerUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::TransformerCircuitPowerUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TransformerCircuit/properties/power_units"), output, "encoding TransformerCircuitPowerUnits"; direction = :neutral)
end
Base.string(value::TransformerCircuitPowerUnits) = string(value.value)
