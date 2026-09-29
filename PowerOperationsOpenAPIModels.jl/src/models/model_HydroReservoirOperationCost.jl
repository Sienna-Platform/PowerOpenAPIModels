struct HydroReservoirOperationCost <: OneOfAPIModel
    value::Union{HydroReservoirCost, ImportExportTimeSeriesCost, MarketBidTimeSeriesCost}
end
_decode(::Type{HydroReservoirOperationCost}, value) =
    _decode(HydroReservoirOperationCost, value, true)
function _decode(::Type{HydroReservoirOperationCost}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-af97cc7bb8185ba70477.json",
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
                    resource="https://openapi.invalid/schema/external-3986f25ac97b4ae1d3d9.json",
                    pointer="/\$defs/HydroReservoirCost",
                ),
            ),
            "IMPORT_EXPORT_TIME_SERIES" => (
                ImportExportTimeSeriesCost,
                (
                    resource="https://openapi.invalid/schema/external-3986f25ac97b4ae1d3d9.json",
                    pointer="/\$defs/ImportExportTimeSeriesCost",
                ),
            ),
            "MARKET_BID_TIME_SERIES" => (
                MarketBidTimeSeriesCost,
                (
                    resource="https://openapi.invalid/schema/external-3986f25ac97b4ae1d3d9.json",
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
    return HydroReservoirOperationCost(_decode(selected[1], value, false))
end
function _encode_unvalidated(value::HydroReservoirOperationCost)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::HydroReservoirOperationCost) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-af97cc7bb8185ba70477.json",
        pointer="/properties/operation_cost",
    ),
    _encode_unvalidated(value),
    "encoding HydroReservoirOperationCost";
    direction=:neutral,
)
