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
            resource="https://openapi.invalid/schema/external-98ed6538b1d3543b4530.json",
            pointer="/\$defs/ThreeWindingTransformerShuntLocation",
        ),
        value,
        "decoding ThreeWindingTransformerShuntLocation";
        direction=:neutral,
    )
    return ThreeWindingTransformerShuntLocation(_decode(String, value, false))
end
function _encode_unvalidated(value::ThreeWindingTransformerShuntLocation)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::ThreeWindingTransformerShuntLocation) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-98ed6538b1d3543b4530.json",
        pointer="/\$defs/ThreeWindingTransformerShuntLocation",
    ),
    _encode_unvalidated(value),
    "encoding ThreeWindingTransformerShuntLocation";
    direction=:neutral,
)
Base.string(value::ThreeWindingTransformerShuntLocation) = string(value.value)
