@doc "    PointToPointBidSpreadBid\n\nWillingness-to-pay curve on the to-minus-from price spread, as an offer-curve operating cost (incremental side only)."
struct PointToPointBidSpreadBid
    value::Union{MarketBidCost,MarketBidTimeSeriesCost}
end
_decode(::Type{PointToPointBidSpreadBid}, value) = _decode(PointToPointBidSpreadBid, value, true)
function _decode(::Type{PointToPointBidSpreadBid}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/PointToPointBid/properties/spread_bid"), value, "decoding PointToPointBidSpreadBid"; direction = :neutral)
    object = _object(value, "PointToPointBidSpreadBid")
    tag = get(object, "cost_type", ABSENT)
    tag isa Absent || tag isa AbstractString || throw(DecodeError("discriminator value must be a string for PointToPointBidSpreadBid"))
    selected = get(Dict(
        "MARKET_BID" => (MarketBidCost, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/MarketBidCost")),
        "MARKET_BID_TIME_SERIES" => (MarketBidTimeSeriesCost, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/MarketBidTimeSeriesCost")),
        "MarketBidCost" => (MarketBidCost, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/MarketBidCost")),
        "MarketBidTimeSeriesCost" => (MarketBidTimeSeriesCost, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/MarketBidTimeSeriesCost")),
    ), tag isa Absent ? "" : String(tag), nothing)
    selected === nothing && throw(DecodeError("unknown discriminator value $(repr(tag)) for PointToPointBidSpreadBid"))
    !_openapi_validate || _schema_valid(_SPEC, selected[2], value; direction = :neutral) || throw(DecodeError("discriminator-selected schema did not validate for PointToPointBidSpreadBid"))
    return PointToPointBidSpreadBid(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::PointToPointBidSpreadBid)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/PointToPointBid/properties/spread_bid"), output, "encoding PointToPointBidSpreadBid"; direction = :neutral)
end
