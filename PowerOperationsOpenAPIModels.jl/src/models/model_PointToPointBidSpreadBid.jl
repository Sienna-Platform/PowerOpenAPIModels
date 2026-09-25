"""
    PointToPointBidSpreadBid

Willingness-to-pay curve on the to-minus-from price spread, as an offer-curve operating cost (incremental side only).
"""
struct PointToPointBidSpreadBid <: OneOfAPIModel
    value::Union{MarketBidCost, MarketBidTimeSeriesCost}
end
_decode(::Type{PointToPointBidSpreadBid}, value) =
    _decode(PointToPointBidSpreadBid, value, true)
function _decode(::Type{PointToPointBidSpreadBid}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-34db6823156783dac6a8.json",
            pointer="/properties/spread_bid",
        ),
        value,
        "decoding PointToPointBidSpreadBid";
        direction=:neutral,
    )
    object = _object(value, "PointToPointBidSpreadBid")
    tag = get(object, "cost_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(
            DecodeError(
                "discriminator value must be a string for PointToPointBidSpreadBid",
            ),
        )
    selected = get(
        Dict(
            "MARKET_BID" => (
                MarketBidCost,
                (
                    resource="https://openapi.invalid/schema/external-3986f25ac97b4ae1d3d9.json",
                    pointer="/\$defs/MarketBidCost",
                ),
            ),
            "MARKET_BID_TIME_SERIES" => (
                MarketBidTimeSeriesCost,
                (
                    resource="https://openapi.invalid/schema/external-3986f25ac97b4ae1d3d9.json",
                    pointer="/\$defs/MarketBidTimeSeriesCost",
                ),
            ),
        ),
        tag isa Absent ? "" : String(tag),
        nothing,
    )
    selected === nothing && throw(
        DecodeError(
            "unknown discriminator value $(repr(tag)) for PointToPointBidSpreadBid",
        ),
    )
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for PointToPointBidSpreadBid",
            ),
        )
    return PointToPointBidSpreadBid(_decode(selected[1], value, false))
end
function _encode_unvalidated(value::PointToPointBidSpreadBid)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::PointToPointBidSpreadBid) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-34db6823156783dac6a8.json",
        pointer="/properties/spread_bid",
    ),
    _encode_unvalidated(value),
    "encoding PointToPointBidSpreadBid";
    direction=:neutral,
)
