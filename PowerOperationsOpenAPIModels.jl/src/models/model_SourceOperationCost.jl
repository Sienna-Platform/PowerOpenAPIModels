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
            resource="https://openapi.invalid/schema/external-589c935ffa1ef1530dc8.json",
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
                    resource="https://openapi.invalid/schema/external-ca198532ff44628c87dd.json",
                    pointer="/\$defs/ImportExportCost",
                ),
            ),
            "IMPORT_EXPORT_TIME_SERIES" => (
                ImportExportTimeSeriesCost,
                (
                    resource="https://openapi.invalid/schema/external-ca198532ff44628c87dd.json",
                    pointer="/\$defs/ImportExportTimeSeriesCost",
                ),
            ),
            "MARKET_BID_TIME_SERIES" => (
                MarketBidTimeSeriesCost,
                (
                    resource="https://openapi.invalid/schema/external-ca198532ff44628c87dd.json",
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
    return SourceOperationCost(_decode(selected[1], value, false))
end
function _encode_unvalidated(value::SourceOperationCost)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::SourceOperationCost) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-589c935ffa1ef1530dc8.json",
        pointer="/properties/operation_cost",
    ),
    _encode_unvalidated(value),
    "encoding SourceOperationCost";
    direction=:neutral,
)
