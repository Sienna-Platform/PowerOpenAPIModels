"""
    TwoWindingTransformerShuntLocation

Placement of a `TwoWindingTransformer`'s magnetizing shunt admittance on the two sides of its single circuit arc. PRIMARY: the full magnetizing shunt is applied on the primary (from) side. SECONDARY: the full magnetizing shunt is applied on the secondary (to) side. SPLIT: the full complex magnetizing shunt value is applied on BOTH sides.
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
            resource="https://openapi.invalid/schema/external-98ed6538b1d3543b4530.json",
            pointer="/\$defs/TwoWindingTransformerShuntLocation",
        ),
        value,
        "decoding TwoWindingTransformerShuntLocation";
        direction=:neutral,
    )
    return TwoWindingTransformerShuntLocation(_decode(String, value, false))
end
function _encode_unvalidated(value::TwoWindingTransformerShuntLocation)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::TwoWindingTransformerShuntLocation) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-98ed6538b1d3543b4530.json",
        pointer="/\$defs/TwoWindingTransformerShuntLocation",
    ),
    _encode_unvalidated(value),
    "encoding TwoWindingTransformerShuntLocation";
    direction=:neutral,
)
Base.string(value::TwoWindingTransformerShuntLocation) = string(value.value)
