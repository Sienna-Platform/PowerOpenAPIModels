"""
    ThermalMultiStartOperationCost

Operating cost of generation. or MarketBidCost
"""
struct ThermalMultiStartOperationCost <: OneOfAPIModel
    value::Union{
        ImportExportTimeSeriesCost,
        MarketBidCost,
        MarketBidTimeSeriesCost,
        ThermalGenerationCost,
    }
end
_decode(::Type{ThermalMultiStartOperationCost}, value) =
    _decode(ThermalMultiStartOperationCost, value, true)
function _decode(::Type{ThermalMultiStartOperationCost}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-2a649abe3e7984a9c39a.json",
            pointer="/properties/operation_cost",
        ),
        value,
        "decoding ThermalMultiStartOperationCost";
        direction=:neutral,
    )
    object = _object(value, "ThermalMultiStartOperationCost")
    tag = get(object, "cost_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(
            DecodeError(
                "discriminator value must be a string for ThermalMultiStartOperationCost",
            ),
        )
    selected = get(
        Dict(
            "IMPORT_EXPORT_TIME_SERIES" => (
                ImportExportTimeSeriesCost,
                (
                    resource="https://openapi.invalid/schema/external-ca198532ff44628c87dd.json",
                    pointer="/\$defs/ImportExportTimeSeriesCost",
                ),
            ),
            "MARKET_BID" => (
                MarketBidCost,
                (
                    resource="https://openapi.invalid/schema/external-ca198532ff44628c87dd.json",
                    pointer="/\$defs/MarketBidCost",
                ),
            ),
            "MARKET_BID_TIME_SERIES" => (
                MarketBidTimeSeriesCost,
                (
                    resource="https://openapi.invalid/schema/external-ca198532ff44628c87dd.json",
                    pointer="/\$defs/MarketBidTimeSeriesCost",
                ),
            ),
            "THERMAL" => (
                ThermalGenerationCost,
                (
                    resource="https://openapi.invalid/schema/external-ca198532ff44628c87dd.json",
                    pointer="/\$defs/ThermalGenerationCost",
                ),
            ),
        ),
        tag isa Absent ? "" : String(tag),
        nothing,
    )
    selected === nothing && throw(
        DecodeError(
            "unknown discriminator value $(repr(tag)) for ThermalMultiStartOperationCost",
        ),
    )
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for ThermalMultiStartOperationCost",
            ),
        )
    return ThermalMultiStartOperationCost(_decode(selected[1], value, false))
end
function _encode_unvalidated(value::ThermalMultiStartOperationCost)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::ThermalMultiStartOperationCost) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-2a649abe3e7984a9c39a.json",
        pointer="/properties/operation_cost",
    ),
    _encode_unvalidated(value),
    "encoding ThermalMultiStartOperationCost";
    direction=:neutral,
)
