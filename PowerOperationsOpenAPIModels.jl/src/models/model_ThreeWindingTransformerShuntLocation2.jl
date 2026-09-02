@doc "    ThreeWindingTransformerShuntLocation2\n\nPlacement of `magnetizing_shunt` in the equivalent star model."
struct ThreeWindingTransformerShuntLocation2
    value::String
    function ThreeWindingTransformerShuntLocation2(value::String)
        value in ("PRIMARY","STAR") || throw(ArgumentError("invalid ThreeWindingTransformerShuntLocation2 value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ThreeWindingTransformerShuntLocation2}, value) = _decode(ThreeWindingTransformerShuntLocation2, value, true)
function _decode(::Type{ThreeWindingTransformerShuntLocation2}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ThreeWindingTransformer/properties/shunt_location"), value, "decoding ThreeWindingTransformerShuntLocation2"; direction = :neutral)
    return ThreeWindingTransformerShuntLocation2(_decode(String, value, _openapi_validate))
end
function _encode(value::ThreeWindingTransformerShuntLocation2)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ThreeWindingTransformer/properties/shunt_location"), output, "encoding ThreeWindingTransformerShuntLocation2"; direction = :neutral)
end
Base.string(value::ThreeWindingTransformerShuntLocation2) = string(value.value)
