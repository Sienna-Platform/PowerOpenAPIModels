@doc "    TwoWindingTransformerShuntLocation2\n\nPlacement of `magnetizing_shunt` on the two sides of the circuit arc."
struct TwoWindingTransformerShuntLocation2
    value::String
    function TwoWindingTransformerShuntLocation2(value::String)
        value in ("PRIMARY","SECONDARY","SPLIT") || throw(ArgumentError("invalid TwoWindingTransformerShuntLocation2 value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TwoWindingTransformerShuntLocation2}, value) = _decode(TwoWindingTransformerShuntLocation2, value, true)
function _decode(::Type{TwoWindingTransformerShuntLocation2}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoWindingTransformer/properties/shunt_location"), value, "decoding TwoWindingTransformerShuntLocation2"; direction = :neutral)
    return TwoWindingTransformerShuntLocation2(_decode(String, value, _openapi_validate))
end
function _encode(value::TwoWindingTransformerShuntLocation2)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoWindingTransformer/properties/shunt_location"), output, "encoding TwoWindingTransformerShuntLocation2"; direction = :neutral)
end
Base.string(value::TwoWindingTransformerShuntLocation2) = string(value.value)
