@doc "    MarketStage\n\nMarket stage a bilateral transaction was reported against. DAY_AHEAD: day-ahead. REAL_TIME: real-time."
struct MarketStage
    value::String
    function MarketStage(value::String)
        value in ("DAY_AHEAD","REAL_TIME") || throw(ArgumentError("invalid MarketStage value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{MarketStage}, value) = _decode(MarketStage, value, true)
function _decode(::Type{MarketStage}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/MarketStage"), value, "decoding MarketStage"; direction = :neutral)
    return MarketStage(_decode(String, value, _openapi_validate))
end
function _encode(value::MarketStage)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/MarketStage"), output, "encoding MarketStage"; direction = :neutral)
end
Base.string(value::MarketStage) = string(value.value)
