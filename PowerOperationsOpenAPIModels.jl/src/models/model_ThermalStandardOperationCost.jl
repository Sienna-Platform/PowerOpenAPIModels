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
            resource="https://openapi.invalid/schema/external-f85eab5c307b11923e49.json",
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
                    resource="https://openapi.invalid/schema/external-3986f25ac97b4ae1d3d9.json",
                    pointer="/\$defs/ImportExportTimeSeriesCost",
                ),
            ),
            "MARKET_BID" => (
                MarketBidCost,
                (
                    resource="https://openapi.invalid/schema/external-3986f25ac97b4ae1d3d9.json",
                    pointer="/\$defs/MarketBidCost",
                ),
            ),
            "MARKET_BID_TIME_SERIES" => (
                MarketBidTimeSeriesCost,
                (
                    resource="https://openapi.invalid/schema/external-3986f25ac97b4ae1d3d9.json",
                    pointer="/\$defs/MarketBidTimeSeriesCost",
                ),
            ),
            "THERMAL" => (
                ThermalGenerationCost,
                (
                    resource="https://openapi.invalid/schema/external-3986f25ac97b4ae1d3d9.json",
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
    return ThermalStandardOperationCost(_decode(selected[1], value, false))
end
function _encode_unvalidated(value::ThermalStandardOperationCost)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::ThermalStandardOperationCost) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-f85eab5c307b11923e49.json",
        pointer="/properties/operation_cost",
    ),
    _encode_unvalidated(value),
    "encoding ThermalStandardOperationCost";
    direction=:neutral,
)
