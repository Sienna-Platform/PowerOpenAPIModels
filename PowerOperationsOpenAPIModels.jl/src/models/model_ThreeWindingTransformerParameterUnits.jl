@doc "    ThreeWindingTransformerParameterUnits\n\nUnit basis for the pairwise measured impedance fields (r_12, x_12, r_23, x_23, r_31, x_31). PSS/E supplies a single CZ flag for the whole three-winding transformer record, so one basis governs all three winding pairs."
struct ThreeWindingTransformerParameterUnits
    value::String
    function ThreeWindingTransformerParameterUnits(value::String)
        value in ("NATURAL_UNITS","COMPONENT_BASE") || throw(ArgumentError("invalid ThreeWindingTransformerParameterUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ThreeWindingTransformerParameterUnits}, value) = _decode(ThreeWindingTransformerParameterUnits, value, true)
function _decode(::Type{ThreeWindingTransformerParameterUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ThreeWindingTransformer/properties/parameter_units"), value, "decoding ThreeWindingTransformerParameterUnits"; direction = :neutral)
    return ThreeWindingTransformerParameterUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::ThreeWindingTransformerParameterUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ThreeWindingTransformer/properties/parameter_units"), output, "encoding ThreeWindingTransformerParameterUnits"; direction = :neutral)
end
Base.string(value::ThreeWindingTransformerParameterUnits) = string(value.value)
