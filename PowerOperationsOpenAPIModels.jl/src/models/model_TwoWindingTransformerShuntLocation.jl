"""
    TwoWindingTransformerShuntLocation

Placement of a TwoWindingTransformer's magnetizing shunt admittance. PRIMARY: applied on the primary side. SECONDARY: applied on the secondary side. SPLIT: applied on both sides.
"""
struct TwoWindingTransformerShuntLocation <: EnumAPIModel
    value::String
    function TwoWindingTransformerShuntLocation(value::String)
        value in ("PRIMARY", "SECONDARY", "SPLIT") || throw(
            ArgumentError(
                "invalid TwoWindingTransformerShuntLocation value $(repr(value))",
            ),
        )
        return new(value)
    end
end
_decode(::Type{TwoWindingTransformerShuntLocation}, value) =
    _decode(TwoWindingTransformerShuntLocation, value, true)
function _decode(::Type{TwoWindingTransformerShuntLocation}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-93346ccf4b7969b6d994.json",
            pointer="/components/schemas/TwoWindingTransformerShuntLocation",
        ),
        value,
        "decoding TwoWindingTransformerShuntLocation";
        direction=:neutral,
    )
    return TwoWindingTransformerShuntLocation(_decode(String, value, _openapi_validate))
end
function _encode(value::TwoWindingTransformerShuntLocation)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-93346ccf4b7969b6d994.json",
            pointer="/components/schemas/TwoWindingTransformerShuntLocation",
        ),
        output,
        "encoding TwoWindingTransformerShuntLocation";
        direction=:neutral,
    )
end
Base.string(value::TwoWindingTransformerShuntLocation) = string(value.value)
