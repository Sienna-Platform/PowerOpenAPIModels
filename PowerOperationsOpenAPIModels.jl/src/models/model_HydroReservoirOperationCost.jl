struct HydroReservoirOperationCost
    value::Union{HydroReservoirCost,ImportExportTimeSeriesCost,MarketBidTimeSeriesCost}
end
_decode(::Type{HydroReservoirOperationCost}, value) = _decode(HydroReservoirOperationCost, value, true)
function _decode(::Type{HydroReservoirOperationCost}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HydroReservoir/properties/operation_cost"), value, "decoding HydroReservoirOperationCost"; direction = :neutral)
    object = _object(value, "HydroReservoirOperationCost")
    tag = get(object, "cost_type", ABSENT)
    tag isa Absent || tag isa AbstractString || throw(DecodeError("discriminator value must be a string for HydroReservoirOperationCost"))
    selected = get(Dict(
        "HYDRO_RES" => (HydroReservoirCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HydroReservoirCost")),
        "HydroReservoirCost" => (HydroReservoirCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HydroReservoirCost")),
        "IMPORT_EXPORT_TIME_SERIES" => (ImportExportTimeSeriesCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ImportExportTimeSeriesCost")),
        "ImportExportTimeSeriesCost" => (ImportExportTimeSeriesCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ImportExportTimeSeriesCost")),
        "MARKET_BID_TIME_SERIES" => (MarketBidTimeSeriesCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/MarketBidTimeSeriesCost")),
        "MarketBidTimeSeriesCost" => (MarketBidTimeSeriesCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/MarketBidTimeSeriesCost")),
    ), tag isa Absent ? "" : String(tag), nothing)
    selected === nothing && throw(DecodeError("unknown discriminator value $(repr(tag)) for HydroReservoirOperationCost"))
    !_openapi_validate || _schema_valid(_SPEC, selected[2], value; direction = :neutral) || throw(DecodeError("discriminator-selected schema did not validate for HydroReservoirOperationCost"))
    return HydroReservoirOperationCost(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::HydroReservoirOperationCost)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HydroReservoir/properties/operation_cost"), output, "encoding HydroReservoirOperationCost"; direction = :neutral)
end
