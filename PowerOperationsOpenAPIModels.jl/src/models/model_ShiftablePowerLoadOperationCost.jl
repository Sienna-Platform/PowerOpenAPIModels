@doc "    ShiftablePowerLoadOperationCost\n\nOperational cost of interrupting load. or MarketBidCost"
struct ShiftablePowerLoadOperationCost
    value::Union{ImportExportTimeSeriesCost,LoadCost,MarketBidCost,MarketBidTimeSeriesCost}
end
_decode(::Type{ShiftablePowerLoadOperationCost}, value) = _decode(ShiftablePowerLoadOperationCost, value, true)
function _decode(::Type{ShiftablePowerLoadOperationCost}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ShiftablePowerLoad/properties/operation_cost"), value, "decoding ShiftablePowerLoadOperationCost"; direction = :neutral)
    object = _object(value, "ShiftablePowerLoadOperationCost")
    tag = get(object, "cost_type", ABSENT)
    tag isa Absent || tag isa AbstractString || throw(DecodeError("discriminator value must be a string for ShiftablePowerLoadOperationCost"))
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
    selected === nothing && throw(DecodeError("unknown discriminator value $(repr(tag)) for ShiftablePowerLoadOperationCost"))
    !_openapi_validate || _schema_valid(_SPEC, selected[2], value; direction = :neutral) || throw(DecodeError("discriminator-selected schema did not validate for ShiftablePowerLoadOperationCost"))
    return ShiftablePowerLoadOperationCost(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::ShiftablePowerLoadOperationCost)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ShiftablePowerLoad/properties/operation_cost"), output, "encoding ShiftablePowerLoadOperationCost"; direction = :neutral)
end
