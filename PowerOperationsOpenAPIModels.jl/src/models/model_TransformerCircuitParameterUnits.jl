@doc "    TransformerCircuitParameterUnits\n\nUnit basis for this circuit's impedance fields (r, x)."
struct TransformerCircuitParameterUnits
    value::String
    function TransformerCircuitParameterUnits(value::String)
        value in ("NATURAL_UNITS","COMPONENT_BASE") || throw(ArgumentError("invalid TransformerCircuitParameterUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TransformerCircuitParameterUnits}, value) = _decode(TransformerCircuitParameterUnits, value, true)
function _decode(::Type{TransformerCircuitParameterUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TransformerCircuit/properties/parameter_units"), value, "decoding TransformerCircuitParameterUnits"; direction = :neutral)
    return TransformerCircuitParameterUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::TransformerCircuitParameterUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TransformerCircuit/properties/parameter_units"), output, "encoding TransformerCircuitParameterUnits"; direction = :neutral)
end
Base.string(value::TransformerCircuitParameterUnits) = string(value.value)
