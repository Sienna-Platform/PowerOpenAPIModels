"""
    ThermalStandardOperationCost

Operating cost of generation, or a MarketBidCost.
"""
struct ThermalStandardOperationCost <: OneOfAPIModel
    value::Union{
        ImportExportTimeSeriesCost,
        MarketBidCost,
        MarketBidTimeSeriesCost,
        ThermalGenerationCost,
    }
end
_decode(::Type{ThermalStandardOperationCost}, value) =
    _decode(ThermalStandardOperationCost, value, true)
function _decode(::Type{ThermalStandardOperationCost}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-06e8554569aace394570.json",
            pointer="/properties/operation_cost",
        ),
        value,
        "decoding ThermalStandardOperationCost";
        direction=:neutral,
    )
    object = _object(value, "ThermalStandardOperationCost")
    tag = get(object, "cost_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(
            DecodeError(
                "discriminator value must be a string for ThermalStandardOperationCost",
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
            "unknown discriminator value $(repr(tag)) for ThermalStandardOperationCost",
        ),
    )
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for ThermalStandardOperationCost",
            ),
        )
    return ThermalStandardOperationCost(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::ThermalStandardOperationCost)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-06e8554569aace394570.json",
            pointer="/properties/operation_cost",
        ),
        output,
        "encoding ThermalStandardOperationCost";
        direction=:neutral,
    )
end
