"""
    SourceOperationCost

Cost of importing and exporting power at the source. or MarketBidCost
"""
struct SourceOperationCost <: OneOfAPIModel
    value::Union{ImportExportCost, ImportExportTimeSeriesCost, MarketBidTimeSeriesCost}
end
_decode(::Type{SourceOperationCost}, value) = _decode(SourceOperationCost, value, true)
function _decode(::Type{SourceOperationCost}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-8461e1a22a4426110a08.json",
            pointer="/properties/operation_cost",
        ),
        value,
        "decoding SourceOperationCost";
        direction=:neutral,
    )
    object = _object(value, "SourceOperationCost")
    tag = get(object, "cost_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(DecodeError("discriminator value must be a string for SourceOperationCost"))
    selected = get(
        Dict(
            "IMPORTEXPORT" => (
                ImportExportCost,
                (
                    resource="https://openapi.invalid/schema/external-304f3f166e66c59799cf.json",
                    pointer="/\$defs/ImportExportCost",
                ),
            ),
            "IMPORT_EXPORT_TIME_SERIES" => (
                ImportExportTimeSeriesCost,
                (
                    resource="https://openapi.invalid/schema/external-304f3f166e66c59799cf.json",
                    pointer="/\$defs/ImportExportTimeSeriesCost",
                ),
            ),
            "MARKET_BID_TIME_SERIES" => (
                MarketBidTimeSeriesCost,
                (
                    resource="https://openapi.invalid/schema/external-304f3f166e66c59799cf.json",
                    pointer="/\$defs/MarketBidTimeSeriesCost",
                ),
            ),
        ),
        tag isa Absent ? "" : String(tag),
        nothing,
    )
    selected === nothing && throw(
        DecodeError("unknown discriminator value $(repr(tag)) for SourceOperationCost"),
    )
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for SourceOperationCost",
            ),
        )
    return SourceOperationCost(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::SourceOperationCost)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-8461e1a22a4426110a08.json",
            pointer="/properties/operation_cost",
        ),
        output,
        "encoding SourceOperationCost";
        direction=:neutral,
    )
end
