"""
    ThreeWindingTransformerShuntLocation

Placement of a ThreeWindingTransformer's magnetizing shunt admittance. PRIMARY: applied on the winding-1 terminal side. STAR: applied at the star node.
"""
struct ThreeWindingTransformerShuntLocation <: EnumAPIModel
    value::String
    function ThreeWindingTransformerShuntLocation(value::String)
        value in ("PRIMARY", "STAR") || throw(
            ArgumentError(
                "invalid ThreeWindingTransformerShuntLocation value $(repr(value))",
            ),
        )
        return new(value)
    end
end
_decode(::Type{ThreeWindingTransformerShuntLocation}, value) =
    _decode(ThreeWindingTransformerShuntLocation, value, true)
function _decode(
    ::Type{ThreeWindingTransformerShuntLocation},
    value,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-93346ccf4b7969b6d994.json",
            pointer="/components/schemas/ThreeWindingTransformerShuntLocation",
        ),
        value,
        "decoding ThreeWindingTransformerShuntLocation";
        direction=:neutral,
    )
    return ThreeWindingTransformerShuntLocation(_decode(String, value, _openapi_validate))
end
function _encode(value::ThreeWindingTransformerShuntLocation)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-93346ccf4b7969b6d994.json",
            pointer="/components/schemas/ThreeWindingTransformerShuntLocation",
        ),
        output,
        "encoding ThreeWindingTransformerShuntLocation";
        direction=:neutral,
    )
end
Base.string(value::ThreeWindingTransformerShuntLocation) = string(value.value)
