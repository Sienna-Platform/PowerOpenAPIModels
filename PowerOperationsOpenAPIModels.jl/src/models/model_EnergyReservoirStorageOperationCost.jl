"""
    EnergyReservoirStorageOperationCost

Operating cost of storage. or MarketBidCost
"""
struct EnergyReservoirStorageOperationCost <: OneOfAPIModel
    value::Union{
        ImportExportTimeSeriesCost,
        MarketBidCost,
        MarketBidTimeSeriesCost,
        StorageCost,
    }
end
_decode(::Type{EnergyReservoirStorageOperationCost}, value) =
    _decode(EnergyReservoirStorageOperationCost, value, true)
function _decode(
    ::Type{EnergyReservoirStorageOperationCost},
    value,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-712a19ab60adec14ae67.json",
            pointer="/properties/operation_cost",
        ),
        value,
        "decoding EnergyReservoirStorageOperationCost";
        direction=:neutral,
    )
    object = _object(value, "EnergyReservoirStorageOperationCost")
    tag = get(object, "cost_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(
            DecodeError(
                "discriminator value must be a string for EnergyReservoirStorageOperationCost",
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
            "STORAGE" => (
                StorageCost,
                (
                    resource="https://openapi.invalid/schema/external-3986f25ac97b4ae1d3d9.json",
                    pointer="/\$defs/StorageCost",
                ),
            ),
        ),
        tag isa Absent ? "" : String(tag),
        nothing,
    )
    selected === nothing && throw(
        DecodeError(
            "unknown discriminator value $(repr(tag)) for EnergyReservoirStorageOperationCost",
        ),
    )
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for EnergyReservoirStorageOperationCost",
            ),
        )
    return EnergyReservoirStorageOperationCost(_decode(selected[1], value, false))
end
function _encode_unvalidated(value::EnergyReservoirStorageOperationCost)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::EnergyReservoirStorageOperationCost) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-712a19ab60adec14ae67.json",
        pointer="/properties/operation_cost",
    ),
    _encode_unvalidated(value),
    "encoding EnergyReservoirStorageOperationCost";
    direction=:neutral,
)
