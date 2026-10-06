"""
    RenewableDispatchOperationCost

Operating cost of generation. or MarketBidCost
"""
struct RenewableDispatchOperationCost <: OneOfAPIModel
    value::Union{
        ImportExportTimeSeriesCost,
        MarketBidCost,
        MarketBidTimeSeriesCost,
        RenewableGenerationCost,
    }
end
_decode(::Type{RenewableDispatchOperationCost}, value) =
    _decode(RenewableDispatchOperationCost, value, true)
function _decode(::Type{RenewableDispatchOperationCost}, value, _openapi_validate::Bool)
    object = _object(value, "RenewableDispatchOperationCost")
    tag = get(object, "cost_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(
            DecodeError(
                "discriminator value must be a string for RenewableDispatchOperationCost",
            ),
        )
    selected = get(
        Dict(
            "IMPORT_EXPORT_TIME_SERIES" => (
                ImportExportTimeSeriesCost,
                (
                    resource="https://openapi.invalid/schema/external-b5b452f268c6b68cab8f.json",
                    pointer="/\$defs/ImportExportTimeSeriesCost",
                ),
            ),
            "MARKET_BID" => (
                MarketBidCost,
                (
                    resource="https://openapi.invalid/schema/external-b5b452f268c6b68cab8f.json",
                    pointer="/\$defs/MarketBidCost",
                ),
            ),
            "MARKET_BID_TIME_SERIES" => (
                MarketBidTimeSeriesCost,
                (
                    resource="https://openapi.invalid/schema/external-b5b452f268c6b68cab8f.json",
                    pointer="/\$defs/MarketBidTimeSeriesCost",
                ),
            ),
            "RENEWABLE" => (
                RenewableGenerationCost,
                (
                    resource="https://openapi.invalid/schema/external-b5b452f268c6b68cab8f.json",
                    pointer="/\$defs/RenewableGenerationCost",
                ),
            ),
        ),
        tag isa Absent ? "" : String(tag),
        nothing,
    )
    selected === nothing && throw(
        DecodeError(
            "unknown discriminator value $(repr(tag)) for RenewableDispatchOperationCost",
        ),
    )
    _openapi_validate && _validate_schema(
        _SPEC,
        selected[2],
        value,
        "decoding RenewableDispatchOperationCost";
        direction=:neutral,
    )
    return RenewableDispatchOperationCost(_decode(selected[1], value, false))
end
function _encode_unvalidated(value::RenewableDispatchOperationCost)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::RenewableDispatchOperationCost) = _encode(value.value)
