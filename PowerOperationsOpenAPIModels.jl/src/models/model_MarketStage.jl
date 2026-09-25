"""
    MarketStage

Market stage a bilateral transaction was reported against. DAY_AHEAD: day-ahead. REAL_TIME: real-time.
"""
struct MarketStage <: EnumAPIModel
    value::String
    function MarketStage(value::String)
        value in ("DAY_AHEAD", "REAL_TIME") ||
            throw(ArgumentError("invalid MarketStage value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{MarketStage}, value) = _decode(MarketStage, value, true)
function _decode(::Type{MarketStage}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-452260947985e8a3e864.json",
            pointer="/\$defs/MarketStage",
        ),
        value,
        "decoding MarketStage";
        direction=:neutral,
    )
    return MarketStage(_decode(String, value, false))
end
function _encode_unvalidated(value::MarketStage)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::MarketStage) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-452260947985e8a3e864.json",
        pointer="/\$defs/MarketStage",
    ),
    _encode_unvalidated(value),
    "encoding MarketStage";
    direction=:neutral,
)
Base.string(value::MarketStage) = string(value.value)
