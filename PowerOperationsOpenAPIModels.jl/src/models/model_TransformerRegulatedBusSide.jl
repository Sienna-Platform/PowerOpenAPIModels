"""
    TransformerRegulatedBusSide

Side of a transformer circuit's controlling winding on which the regulated bus lies, stated when the regulated bus is not one of the transformer's own terminal buses. CONTROLLING_WINDING: the regulated bus lies beyond the tapped (controlling) winding's terminal, PSS/E's negative CONT. OPPOSITE_WINDING: the regulated bus lies beyond the other winding's terminal, PSS/E's positive CONT.
"""
struct TransformerRegulatedBusSide <: EnumAPIModel
    value::String
    function TransformerRegulatedBusSide(value::String)
        value in ("CONTROLLING_WINDING", "OPPOSITE_WINDING") ||
            throw(ArgumentError("invalid TransformerRegulatedBusSide value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TransformerRegulatedBusSide}, value) =
    _decode(TransformerRegulatedBusSide, value, true)
function _decode(::Type{TransformerRegulatedBusSide}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-423dce12cabfb2353873.json",
            pointer="/\$defs/TransformerRegulatedBusSide",
        ),
        value,
        "decoding TransformerRegulatedBusSide";
        direction=:neutral,
    )
    return TransformerRegulatedBusSide(_decode(String, value, _openapi_validate))
end
function _encode(value::TransformerRegulatedBusSide)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-423dce12cabfb2353873.json",
            pointer="/\$defs/TransformerRegulatedBusSide",
        ),
        output,
        "encoding TransformerRegulatedBusSide";
        direction=:neutral,
    )
end
Base.string(value::TransformerRegulatedBusSide) = string(value.value)
