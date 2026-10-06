struct HydroReservoirOperationCost <: OneOfAPIModel
    value::Union{HydroReservoirCost, ImportExportTimeSeriesCost, MarketBidTimeSeriesCost}
end
_decode(::Type{HydroReservoirOperationCost}, value) =
    _decode(HydroReservoirOperationCost, value, true)
function _decode(::Type{HydroReservoirOperationCost}, value, _openapi_validate::Bool)
    object = _object(value, "HydroReservoirOperationCost")
    tag = get(object, "cost_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(
            DecodeError(
                "discriminator value must be a string for HydroReservoirOperationCost",
            ),
        )
    selected = get(
        Dict(
            "HYDRO_RES" => (
                HydroReservoirCost,
                (
                    resource="https://openapi.invalid/schema/external-b5b452f268c6b68cab8f.json",
                    pointer="/\$defs/HydroReservoirCost",
                ),
            ),
            "IMPORT_EXPORT_TIME_SERIES" => (
                ImportExportTimeSeriesCost,
                (
                    resource="https://openapi.invalid/schema/external-b5b452f268c6b68cab8f.json",
                    pointer="/\$defs/ImportExportTimeSeriesCost",
                ),
            ),
            "MARKET_BID_TIME_SERIES" => (
                MarketBidTimeSeriesCost,
                (
                    resource="https://openapi.invalid/schema/external-b5b452f268c6b68cab8f.json",
                    pointer="/\$defs/MarketBidTimeSeriesCost",
                ),
            ),
        ),
        tag isa Absent ? "" : String(tag),
        nothing,
    )
    selected === nothing && throw(
        DecodeError(
            "unknown discriminator value $(repr(tag)) for HydroReservoirOperationCost",
        ),
    )
    _openapi_validate && _validate_schema(
        _SPEC,
        selected[2],
        value,
        "decoding HydroReservoirOperationCost";
        direction=:neutral,
    )
    return HydroReservoirOperationCost(_decode(selected[1], value, false))
end
function _encode_unvalidated(value::HydroReservoirOperationCost)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::HydroReservoirOperationCost) = _encode(value.value)
