"""
    ThreeWindingTransformerShuntLocation

Placement of a `ThreeWindingTransformer`'s magnetizing shunt admittance in the equivalent star model. PRIMARY: the full magnetizing shunt is applied on the winding-1 (primary) terminal side. STAR: the full magnetizing shunt is applied at the star node.
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
            resource="https://openapi.invalid/schema/root-a047aace9cc4451610fa.json",
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
            resource="https://openapi.invalid/schema/root-a047aace9cc4451610fa.json",
            pointer="/components/schemas/ThreeWindingTransformerShuntLocation",
        ),
        output,
        "encoding ThreeWindingTransformerShuntLocation";
        direction=:neutral,
    )
end
Base.string(value::ThreeWindingTransformerShuntLocation) = string(value.value)
