"""
    TransformerRegulationOrientation

Which end of a transformer circuit's `arc` the tap adjustment treats the regulated bus as lying on, when the regulated bus is not an end of the arc: a remote bus, or another winding's terminal of a three-winding transformer. It sets the direction the tap moves to raise that bus's voltage (PSS/E sign of CONT). The `from` end is the tapped winding. UNDEFINED: the regulated bus is an end of the arc, so the connections give the direction, or there is no regulated bus. FROM: adjust as if the regulated bus lies on the `from` side (PSS/E negative CONT). TO: adjust as if it lies on the `to` side (PSS/E positive CONT).
"""
struct TransformerRegulationOrientation <: EnumAPIModel
    value::String
    function TransformerRegulationOrientation(value::String)
        value in ("UNDEFINED", "FROM", "TO") || throw(
            ArgumentError("invalid TransformerRegulationOrientation value $(repr(value))"),
        )
        return new(value)
    end
end
_decode(::Type{TransformerRegulationOrientation}, value) =
    _decode(TransformerRegulationOrientation, value, true)
function _decode(::Type{TransformerRegulationOrientation}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-ff7be472003e477ad03e.json",
            pointer="/\$defs/TransformerRegulationOrientation",
        ),
        value,
        "decoding TransformerRegulationOrientation";
        direction=:neutral,
    )
    return TransformerRegulationOrientation(_decode_zoned(String, value, false))
end
function _encode_unvalidated(value::TransformerRegulationOrientation)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::TransformerRegulationOrientation) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-ff7be472003e477ad03e.json",
        pointer="/\$defs/TransformerRegulationOrientation",
    ),
    _encode_unvalidated(value),
    "encoding TransformerRegulationOrientation";
    direction=:neutral,
)
Base.string(value::TransformerRegulationOrientation) = string(value.value)
