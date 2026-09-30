"""
    VirtualParticipantOperationCost

Bid curves as an offer-curve operating cost.
"""
struct VirtualParticipantOperationCost <: OneOfAPIModel
    value::Union{MarketBidCost, MarketBidTimeSeriesCost}
end
_decode(::Type{VirtualParticipantOperationCost}, value) =
    _decode(VirtualParticipantOperationCost, value, true)
function _decode(::Type{VirtualParticipantOperationCost}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-93547ad8c2b21cc361f5.json",
            pointer="/properties/operation_cost",
        ),
        value,
        "decoding VirtualParticipantOperationCost";
        direction=:neutral,
    )
    object = _object(value, "VirtualParticipantOperationCost")
    tag = get(object, "cost_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(
            DecodeError(
                "discriminator value must be a string for VirtualParticipantOperationCost",
            ),
        )
    selected = get(
        Dict(
            "MARKET_BID" => (
                MarketBidCost,
                (
                    resource="https://openapi.invalid/schema/external-ca198532ff44628c87dd.json",
                    pointer="/\$defs/MarketBidCost",
                ),
            ),
            "MARKET_BID_TIME_SERIES" => (
                MarketBidTimeSeriesCost,
                (
                    resource="https://openapi.invalid/schema/external-ca198532ff44628c87dd.json",
                    pointer="/\$defs/MarketBidTimeSeriesCost",
                ),
            ),
        ),
        tag isa Absent ? "" : String(tag),
        nothing,
    )
    selected === nothing && throw(
        DecodeError(
            "unknown discriminator value $(repr(tag)) for VirtualParticipantOperationCost",
        ),
    )
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for VirtualParticipantOperationCost",
            ),
        )
    return VirtualParticipantOperationCost(_decode(selected[1], value, false))
end
function _encode_unvalidated(value::VirtualParticipantOperationCost)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::VirtualParticipantOperationCost) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-93547ad8c2b21cc361f5.json",
        pointer="/properties/operation_cost",
    ),
    _encode_unvalidated(value),
    "encoding VirtualParticipantOperationCost";
    direction=:neutral,
)
