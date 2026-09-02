@doc "    InterruptiblePowerLoadOperationCost\n\nOperational cost of interrupting load. or MarketBidCost"
struct InterruptiblePowerLoadOperationCost
    value::Union{ImportExportTimeSeriesCost,LoadCost,MarketBidCost,MarketBidTimeSeriesCost}
end
_decode(::Type{InterruptiblePowerLoadOperationCost}, value) = _decode(InterruptiblePowerLoadOperationCost, value, true)
function _decode(::Type{InterruptiblePowerLoadOperationCost}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/InterruptiblePowerLoad/properties/operation_cost"), value, "decoding InterruptiblePowerLoadOperationCost"; direction = :neutral)
    object = _object(value, "InterruptiblePowerLoadOperationCost")
    tag = get(object, "cost_type", ABSENT)
    tag isa Absent || tag isa AbstractString || throw(DecodeError("discriminator value must be a string for InterruptiblePowerLoadOperationCost"))
    selected = get(Dict(
        "IMPORT_EXPORT_TIME_SERIES" => (ImportExportTimeSeriesCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ImportExportTimeSeriesCost")),
        "ImportExportTimeSeriesCost" => (ImportExportTimeSeriesCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ImportExportTimeSeriesCost")),
        "LOAD" => (LoadCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/LoadCost")),
        "LoadCost" => (LoadCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/LoadCost")),
        "MARKET_BID" => (MarketBidCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/MarketBidCost")),
        "MARKET_BID_TIME_SERIES" => (MarketBidTimeSeriesCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/MarketBidTimeSeriesCost")),
        "MarketBidCost" => (MarketBidCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/MarketBidCost")),
        "MarketBidTimeSeriesCost" => (MarketBidTimeSeriesCost, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/MarketBidTimeSeriesCost")),
    ), tag isa Absent ? "" : String(tag), nothing)
    selected === nothing && throw(DecodeError("unknown discriminator value $(repr(tag)) for InterruptiblePowerLoadOperationCost"))
    !_openapi_validate || _schema_valid(_SPEC, selected[2], value; direction = :neutral) || throw(DecodeError("discriminator-selected schema did not validate for InterruptiblePowerLoadOperationCost"))
    return InterruptiblePowerLoadOperationCost(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::InterruptiblePowerLoadOperationCost)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/InterruptiblePowerLoad/properties/operation_cost"), output, "encoding InterruptiblePowerLoadOperationCost"; direction = :neutral)
end
