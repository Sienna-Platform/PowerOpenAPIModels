"""
    InterruptibleStandardLoadOperationCost

Operational cost of interrupting load. or MarketBidCost
"""
struct InterruptibleStandardLoadOperationCost <: OneOfAPIModel
    value::Union{
        ImportExportTimeSeriesCost,
        LoadCost,
        MarketBidCost,
        MarketBidTimeSeriesCost,
    }
end
_decode(::Type{InterruptibleStandardLoadOperationCost}, value) =
    _decode(InterruptibleStandardLoadOperationCost, value, true)
function _decode(
    ::Type{InterruptibleStandardLoadOperationCost},
    value,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-ebca6755033db6949fb3.json",
            pointer="/properties/operation_cost",
        ),
        value,
        "decoding InterruptibleStandardLoadOperationCost";
        direction=:neutral,
    )
    object = _object(value, "InterruptibleStandardLoadOperationCost")
    tag = get(object, "cost_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(
            DecodeError(
                "discriminator value must be a string for InterruptibleStandardLoadOperationCost",
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
            "unknown discriminator value $(repr(tag)) for InterruptibleStandardLoadOperationCost",
        ),
    )
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for InterruptibleStandardLoadOperationCost",
            ),
        )
    return InterruptibleStandardLoadOperationCost(_decode(selected[1], value, false))
end
function _encode_unvalidated(value::InterruptibleStandardLoadOperationCost)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::InterruptibleStandardLoadOperationCost) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-ebca6755033db6949fb3.json",
        pointer="/properties/operation_cost",
    ),
    _encode_unvalidated(value),
    "encoding InterruptibleStandardLoadOperationCost";
    direction=:neutral,
)
