"""
    ShiftablePowerLoadOperationCost

Operational cost of interrupting load. or MarketBidCost
"""
struct ShiftablePowerLoadOperationCost <: OneOfAPIModel
    value::Union{
        ImportExportTimeSeriesCost,
        LoadCost,
        MarketBidCost,
        MarketBidTimeSeriesCost,
    }
end
_decode(::Type{ShiftablePowerLoadOperationCost}, value) =
    _decode(ShiftablePowerLoadOperationCost, value, true)
function _decode(::Type{ShiftablePowerLoadOperationCost}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-31cc1406780185093c90.json",
            pointer="/properties/operation_cost",
        ),
        value,
        "decoding ShiftablePowerLoadOperationCost";
        direction=:neutral,
    )
    object = _object(value, "ShiftablePowerLoadOperationCost")
    tag = get(object, "cost_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(
            DecodeError(
                "discriminator value must be a string for ShiftablePowerLoadOperationCost",
            ),
        )
    selected = get(
        Dict(
            "IMPORT_EXPORT_TIME_SERIES" => (
                ImportExportTimeSeriesCost,
                (
                    resource="https://openapi.invalid/schema/external-ca198532ff44628c87dd.json",
                    pointer="/\$defs/ImportExportTimeSeriesCost",
                ),
            ),
            "LOAD" => (
                LoadCost,
                (
                    resource="https://openapi.invalid/schema/external-ca198532ff44628c87dd.json",
                    pointer="/\$defs/LoadCost",
                ),
            ),
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
            "unknown discriminator value $(repr(tag)) for ShiftablePowerLoadOperationCost",
        ),
    )
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for ShiftablePowerLoadOperationCost",
            ),
        )
    return ShiftablePowerLoadOperationCost(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::ShiftablePowerLoadOperationCost)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-31cc1406780185093c90.json",
            pointer="/properties/operation_cost",
        ),
        output,
        "encoding ShiftablePowerLoadOperationCost";
        direction=:neutral,
    )
end
