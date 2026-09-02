@doc "    EnergyReservoirStorageOperationCost\n\nOperating cost of storage. or MarketBidCost"
struct EnergyReservoirStorageOperationCost
    value::Union{ImportExportTimeSeriesCost,MarketBidCost,MarketBidTimeSeriesCost,StorageCost}
end
_decode(::Type{EnergyReservoirStorageOperationCost}, value) = _decode(EnergyReservoirStorageOperationCost, value, true)
function _decode(::Type{EnergyReservoirStorageOperationCost}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/EnergyReservoirStorage/properties/operation_cost"), value, "decoding EnergyReservoirStorageOperationCost"; direction = :neutral)
    object = _object(value, "EnergyReservoirStorageOperationCost")
    tag = get(object, "cost_type", ABSENT)
    tag isa Absent || tag isa AbstractString || throw(DecodeError("discriminator value must be a string for EnergyReservoirStorageOperationCost"))
    selected = get(Dict(
        "IMPORT_EXPORT_TIME_SERIES" => (ImportExportTimeSeriesCost, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ImportExportTimeSeriesCost")),
        "ImportExportTimeSeriesCost" => (ImportExportTimeSeriesCost, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ImportExportTimeSeriesCost")),
        "MARKET_BID" => (MarketBidCost, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/MarketBidCost")),
        "MARKET_BID_TIME_SERIES" => (MarketBidTimeSeriesCost, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/MarketBidTimeSeriesCost")),
        "MarketBidCost" => (MarketBidCost, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/MarketBidCost")),
        "MarketBidTimeSeriesCost" => (MarketBidTimeSeriesCost, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/MarketBidTimeSeriesCost")),
        "STORAGE" => (StorageCost, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/StorageCost")),
        "StorageCost" => (StorageCost, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/StorageCost")),
    ), tag isa Absent ? "" : String(tag), nothing)
    selected === nothing && throw(DecodeError("unknown discriminator value $(repr(tag)) for EnergyReservoirStorageOperationCost"))
    !_openapi_validate || _schema_valid(_SPEC, selected[2], value; direction = :neutral) || throw(DecodeError("discriminator-selected schema did not validate for EnergyReservoirStorageOperationCost"))
    return EnergyReservoirStorageOperationCost(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::EnergyReservoirStorageOperationCost)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/EnergyReservoirStorage/properties/operation_cost"), output, "encoding EnergyReservoirStorageOperationCost"; direction = :neutral)
end
