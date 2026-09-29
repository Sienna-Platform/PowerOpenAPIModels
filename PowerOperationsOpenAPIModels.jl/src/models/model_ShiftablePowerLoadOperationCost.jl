"""
    ShiftablePowerLoadOperationCost

Operational cost of interrupting load. or MarketBidCost
"""
struct ShiftablePowerLoadOperationCost <: OneOfAPIModel
    value::Union{
        ImportExportTimeSeriesCost,
        LoadCost,
        MarketBidCost,
        MarketBidTimeSeriesCost,
    }
end
_decode(::Type{ShiftablePowerLoadOperationCost}, value) =
    _decode(ShiftablePowerLoadOperationCost, value, true)
function _decode(::Type{ShiftablePowerLoadOperationCost}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-bd6c298a3c4199cefc3f.json",
            pointer="/properties/operation_cost",
        ),
        value,
        "decoding ShiftablePowerLoadOperationCost";
        direction=:neutral,
    )
    object = _object(value, "ShiftablePowerLoadOperationCost")
    tag = get(object, "cost_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(
            DecodeError(
                "discriminator value must be a string for ShiftablePowerLoadOperationCost",
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
            "LOAD" => (
                LoadCost,
                (
                    resource="https://openapi.invalid/schema/external-3986f25ac97b4ae1d3d9.json",
                    pointer="/\$defs/LoadCost",
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
        ),
        tag isa Absent ? "" : String(tag),
        nothing,
    )
    selected === nothing && throw(
        DecodeError(
            "unknown discriminator value $(repr(tag)) for ShiftablePowerLoadOperationCost",
        ),
    )
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for ShiftablePowerLoadOperationCost",
            ),
        )
    return ShiftablePowerLoadOperationCost(_decode(selected[1], value, false))
end
function _encode_unvalidated(value::ShiftablePowerLoadOperationCost)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::ShiftablePowerLoadOperationCost) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-bd6c298a3c4199cefc3f.json",
        pointer="/properties/operation_cost",
    ),
    _encode_unvalidated(value),
    "encoding ShiftablePowerLoadOperationCost";
    direction=:neutral,
)
