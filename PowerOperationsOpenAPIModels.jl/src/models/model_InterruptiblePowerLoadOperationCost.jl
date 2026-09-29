"""
    InterruptiblePowerLoadOperationCost

Operational cost of interrupting load. or MarketBidCost
"""
struct InterruptiblePowerLoadOperationCost <: OneOfAPIModel
    value::Union{
        ImportExportTimeSeriesCost,
        LoadCost,
        MarketBidCost,
        MarketBidTimeSeriesCost,
    }
end
_decode(::Type{InterruptiblePowerLoadOperationCost}, value) =
    _decode(InterruptiblePowerLoadOperationCost, value, true)
function _decode(
    ::Type{InterruptiblePowerLoadOperationCost},
    value,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-ec8a29e67e38f2c866dc.json",
            pointer="/properties/operation_cost",
        ),
        value,
        "decoding InterruptiblePowerLoadOperationCost";
        direction=:neutral,
    )
    object = _object(value, "InterruptiblePowerLoadOperationCost")
    tag = get(object, "cost_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(
            DecodeError(
                "discriminator value must be a string for InterruptiblePowerLoadOperationCost",
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
            "unknown discriminator value $(repr(tag)) for InterruptiblePowerLoadOperationCost",
        ),
    )
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for InterruptiblePowerLoadOperationCost",
            ),
        )
    return InterruptiblePowerLoadOperationCost(_decode(selected[1], value, false))
end
function _encode_unvalidated(value::InterruptiblePowerLoadOperationCost)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::InterruptiblePowerLoadOperationCost) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-ec8a29e67e38f2c866dc.json",
        pointer="/properties/operation_cost",
    ),
    _encode_unvalidated(value),
    "encoding InterruptiblePowerLoadOperationCost";
    direction=:neutral,
)
