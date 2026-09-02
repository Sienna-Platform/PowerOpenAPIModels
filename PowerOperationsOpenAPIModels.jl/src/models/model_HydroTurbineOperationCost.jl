@doc "    HydroTurbineOperationCost\n\nOperating cost of generation. or MarketBidCost; default PSY.HydroGenerationCost(nothing)"
struct HydroTurbineOperationCost
    value::Union{HydroGenerationCost,ImportExportTimeSeriesCost,MarketBidCost,MarketBidTimeSeriesCost}
end
_decode(::Type{HydroTurbineOperationCost}, value) = _decode(HydroTurbineOperationCost, value, true)
function _decode(::Type{HydroTurbineOperationCost}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/HydroTurbine/properties/operation_cost"), value, "decoding HydroTurbineOperationCost"; direction = :neutral)
    object = _object(value, "HydroTurbineOperationCost")
    tag = get(object, "cost_type", ABSENT)
    tag isa Absent || tag isa AbstractString || throw(DecodeError("discriminator value must be a string for HydroTurbineOperationCost"))
    selected = get(Dict(
        "HYDRO_GEN" => (HydroGenerationCost, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/HydroGenerationCost")),
        "HydroGenerationCost" => (HydroGenerationCost, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/HydroGenerationCost")),
        "IMPORT_EXPORT_TIME_SERIES" => (ImportExportTimeSeriesCost, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ImportExportTimeSeriesCost")),
        "ImportExportTimeSeriesCost" => (ImportExportTimeSeriesCost, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ImportExportTimeSeriesCost")),
        "MARKET_BID" => (MarketBidCost, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/MarketBidCost")),
        "MARKET_BID_TIME_SERIES" => (MarketBidTimeSeriesCost, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/MarketBidTimeSeriesCost")),
        "MarketBidCost" => (MarketBidCost, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/MarketBidCost")),
        "MarketBidTimeSeriesCost" => (MarketBidTimeSeriesCost, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/MarketBidTimeSeriesCost")),
    ), tag isa Absent ? "" : String(tag), nothing)
    selected === nothing && throw(DecodeError("unknown discriminator value $(repr(tag)) for HydroTurbineOperationCost"))
    !_openapi_validate || _schema_valid(_SPEC, selected[2], value; direction = :neutral) || throw(DecodeError("discriminator-selected schema did not validate for HydroTurbineOperationCost"))
    return HydroTurbineOperationCost(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::HydroTurbineOperationCost)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/HydroTurbine/properties/operation_cost"), output, "encoding HydroTurbineOperationCost"; direction = :neutral)
end
