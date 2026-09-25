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
            resource="https://openapi.invalid/schema/external-6efb474538a6c3fd71b3.json",
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
                    resource="https://openapi.invalid/schema/external-3986f25ac97b4ae1d3d9.json",
                    pointer="/\$defs/ImportExportTimeSeriesCost",
                ),
            ),
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
            "RENEWABLE" => (
                RenewableGenerationCost,
                (
                    resource="https://openapi.invalid/schema/external-3986f25ac97b4ae1d3d9.json",
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
    return RenewableDispatchOperationCost(_decode(selected[1], value, false))
end
function _encode_unvalidated(value::RenewableDispatchOperationCost)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::RenewableDispatchOperationCost) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-6efb474538a6c3fd71b3.json",
        pointer="/properties/operation_cost",
    ),
    _encode_unvalidated(value),
    "encoding RenewableDispatchOperationCost";
    direction=:neutral,
)
