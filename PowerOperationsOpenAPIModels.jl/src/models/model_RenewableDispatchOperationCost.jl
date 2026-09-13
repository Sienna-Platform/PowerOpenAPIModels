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
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-da909f0e7a327bfb63ef.json",
            pointer="/properties/operation_cost",
        ),
        value,
        "decoding RenewableDispatchOperationCost";
        direction=:neutral,
    )
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
                    resource="https://openapi.invalid/schema/external-3883dfdcf540e854004c.json",
                    pointer="/\$defs/ImportExportTimeSeriesCost",
                ),
            ),
            "MARKET_BID" => (
                MarketBidCost,
                (
                    resource="https://openapi.invalid/schema/external-3883dfdcf540e854004c.json",
                    pointer="/\$defs/MarketBidCost",
                ),
            ),
            "MARKET_BID_TIME_SERIES" => (
                MarketBidTimeSeriesCost,
                (
                    resource="https://openapi.invalid/schema/external-3883dfdcf540e854004c.json",
                    pointer="/\$defs/MarketBidTimeSeriesCost",
                ),
            ),
            "RENEWABLE" => (
                RenewableGenerationCost,
                (
                    resource="https://openapi.invalid/schema/external-3883dfdcf540e854004c.json",
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
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for RenewableDispatchOperationCost",
            ),
        )
    return RenewableDispatchOperationCost(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::RenewableDispatchOperationCost)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-da909f0e7a327bfb63ef.json",
            pointer="/properties/operation_cost",
        ),
        output,
        "encoding RenewableDispatchOperationCost";
        direction=:neutral,
    )
end
