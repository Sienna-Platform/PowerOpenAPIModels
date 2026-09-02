@doc "    HydroDispatchOperationCost\n\nOperating cost of generation. or MarketBidCost; default PSY.HydroGenerationCost(nothing)"
struct HydroDispatchOperationCost
    value::Union{HydroGenerationCost,ImportExportTimeSeriesCost,MarketBidCost,MarketBidTimeSeriesCost}
end
_decode(::Type{HydroDispatchOperationCost}, value) = _decode(HydroDispatchOperationCost, value, true)
function _decode(::Type{HydroDispatchOperationCost}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HydroDispatch/properties/operation_cost"), value, "decoding HydroDispatchOperationCost"; direction = :neutral)
    object = _object(value, "HydroDispatchOperationCost")
    tag = get(object, "cost_type", ABSENT)
    tag isa Absent || tag isa AbstractString || throw(DecodeError("discriminator value must be a string for HydroDispatchOperationCost"))
    selected = get(Dict(
        "HYDRO_GEN" => (HydroGenerationCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HydroGenerationCost")),
        "HydroGenerationCost" => (HydroGenerationCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HydroGenerationCost")),
        "IMPORT_EXPORT_TIME_SERIES" => (ImportExportTimeSeriesCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ImportExportTimeSeriesCost")),
        "ImportExportTimeSeriesCost" => (ImportExportTimeSeriesCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ImportExportTimeSeriesCost")),
        "MARKET_BID" => (MarketBidCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/MarketBidCost")),
        "MARKET_BID_TIME_SERIES" => (MarketBidTimeSeriesCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/MarketBidTimeSeriesCost")),
        "MarketBidCost" => (MarketBidCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/MarketBidCost")),
        "MarketBidTimeSeriesCost" => (MarketBidTimeSeriesCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/MarketBidTimeSeriesCost")),
    ), tag isa Absent ? "" : String(tag), nothing)
    selected === nothing && throw(DecodeError("unknown discriminator value $(repr(tag)) for HydroDispatchOperationCost"))
    !_openapi_validate || _schema_valid(_SPEC, selected[2], value; direction = :neutral) || throw(DecodeError("discriminator-selected schema did not validate for HydroDispatchOperationCost"))
    return HydroDispatchOperationCost(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::HydroDispatchOperationCost)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HydroDispatch/properties/operation_cost"), output, "encoding HydroDispatchOperationCost"; direction = :neutral)
end
