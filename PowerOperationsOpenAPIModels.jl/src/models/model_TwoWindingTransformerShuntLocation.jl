@doc "    TwoWindingTransformerShuntLocation\n\nPlacement of a `TwoWindingTransformer`'s magnetizing shunt admittance on the two sides of its single circuit arc. PRIMARY: the full magnetizing shunt is applied on the primary (from) side. SECONDARY: the full magnetizing shunt is applied on the secondary (to) side. SPLIT: the full complex magnetizing shunt value is applied on BOTH sides."
struct TwoWindingTransformerShuntLocation
    value::String
    function TwoWindingTransformerShuntLocation(value::String)
        value in ("PRIMARY","SECONDARY","SPLIT") || throw(ArgumentError("invalid TwoWindingTransformerShuntLocation value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TwoWindingTransformerShuntLocation}, value) = _decode(TwoWindingTransformerShuntLocation, value, true)
function _decode(::Type{TwoWindingTransformerShuntLocation}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TwoWindingTransformerShuntLocation"), value, "decoding TwoWindingTransformerShuntLocation"; direction = :neutral)
    return TwoWindingTransformerShuntLocation(_decode(String, value, _openapi_validate))
end
function _encode(value::TwoWindingTransformerShuntLocation)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TwoWindingTransformerShuntLocation"), output, "encoding TwoWindingTransformerShuntLocation"; direction = :neutral)
end
Base.string(value::TwoWindingTransformerShuntLocation) = string(value.value)
