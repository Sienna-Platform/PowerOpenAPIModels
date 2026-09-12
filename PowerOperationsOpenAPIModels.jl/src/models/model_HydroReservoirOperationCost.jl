struct HydroReservoirOperationCost <: OneOfAPIModel
    value::Union{HydroReservoirCost, ImportExportTimeSeriesCost, MarketBidTimeSeriesCost}
end
_decode(::Type{HydroReservoirOperationCost}, value) =
    _decode(HydroReservoirOperationCost, value, true)
function _decode(::Type{HydroReservoirOperationCost}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-d7efd24f681bcc70f626.json",
            pointer="/properties/operation_cost",
        ),
        value,
        "decoding HydroReservoirOperationCost";
        direction=:neutral,
    )
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
                    resource="https://openapi.invalid/schema/external-3883dfdcf540e854004c.json",
                    pointer="/\$defs/HydroReservoirCost",
                ),
            ),
            "IMPORT_EXPORT_TIME_SERIES" => (
                ImportExportTimeSeriesCost,
                (
                    resource="https://openapi.invalid/schema/external-3883dfdcf540e854004c.json",
                    pointer="/\$defs/ImportExportTimeSeriesCost",
                ),
            ),
            "MARKET_BID_TIME_SERIES" => (
                MarketBidTimeSeriesCost,
                (
                    resource="https://openapi.invalid/schema/external-3883dfdcf540e854004c.json",
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
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for HydroReservoirOperationCost",
            ),
        )
    return HydroReservoirOperationCost(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::HydroReservoirOperationCost)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-d7efd24f681bcc70f626.json",
            pointer="/properties/operation_cost",
        ),
        output,
        "encoding HydroReservoirOperationCost";
        direction=:neutral,
    )
end
