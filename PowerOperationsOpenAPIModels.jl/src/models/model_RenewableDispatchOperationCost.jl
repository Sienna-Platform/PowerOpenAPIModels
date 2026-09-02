@doc "    RenewableDispatchOperationCost\n\nOperating cost of generation. or MarketBidCost"
struct RenewableDispatchOperationCost
    value::Union{ImportExportTimeSeriesCost,MarketBidCost,MarketBidTimeSeriesCost,RenewableGenerationCost}
end
_decode(::Type{RenewableDispatchOperationCost}, value) = _decode(RenewableDispatchOperationCost, value, true)
function _decode(::Type{RenewableDispatchOperationCost}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/RenewableDispatch/properties/operation_cost"), value, "decoding RenewableDispatchOperationCost"; direction = :neutral)
    object = _object(value, "RenewableDispatchOperationCost")
    tag = get(object, "cost_type", ABSENT)
    tag isa Absent || tag isa AbstractString || throw(DecodeError("discriminator value must be a string for RenewableDispatchOperationCost"))
    selected = get(Dict(
        "IMPORT_EXPORT_TIME_SERIES" => (ImportExportTimeSeriesCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ImportExportTimeSeriesCost")),
        "ImportExportTimeSeriesCost" => (ImportExportTimeSeriesCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ImportExportTimeSeriesCost")),
        "MARKET_BID" => (MarketBidCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/MarketBidCost")),
        "MARKET_BID_TIME_SERIES" => (MarketBidTimeSeriesCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/MarketBidTimeSeriesCost")),
        "MarketBidCost" => (MarketBidCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/MarketBidCost")),
        "MarketBidTimeSeriesCost" => (MarketBidTimeSeriesCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/MarketBidTimeSeriesCost")),
        "RENEWABLE" => (RenewableGenerationCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/RenewableGenerationCost")),
        "RenewableGenerationCost" => (RenewableGenerationCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/RenewableGenerationCost")),
    ), tag isa Absent ? "" : String(tag), nothing)
    selected === nothing && throw(DecodeError("unknown discriminator value $(repr(tag)) for RenewableDispatchOperationCost"))
    !_openapi_validate || _schema_valid(_SPEC, selected[2], value; direction = :neutral) || throw(DecodeError("discriminator-selected schema did not validate for RenewableDispatchOperationCost"))
    return RenewableDispatchOperationCost(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::RenewableDispatchOperationCost)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/RenewableDispatch/properties/operation_cost"), output, "encoding RenewableDispatchOperationCost"; direction = :neutral)
end
