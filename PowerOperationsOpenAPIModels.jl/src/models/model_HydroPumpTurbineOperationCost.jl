"""
    HydroPumpTurbineOperationCost

Operating cost of generation. or MarketBidCost; default PSY.HydroGenerationCost(nothing)
"""
struct HydroPumpTurbineOperationCost <: OneOfAPIModel
    value::Union{
        HydroGenerationCost,
        ImportExportTimeSeriesCost,
        MarketBidCost,
        MarketBidTimeSeriesCost,
    }
end
_decode(::Type{HydroPumpTurbineOperationCost}, value) =
    _decode(HydroPumpTurbineOperationCost, value, true)
function _decode(::Type{HydroPumpTurbineOperationCost}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-e18af837c2d0e608e9b3.json",
            pointer="/properties/operation_cost",
        ),
        value,
        "decoding HydroPumpTurbineOperationCost";
        direction=:neutral,
    )
    object = _object(value, "HydroPumpTurbineOperationCost")
    tag = get(object, "cost_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(
            DecodeError(
                "discriminator value must be a string for HydroPumpTurbineOperationCost",
            ),
        )
    selected = get(
        Dict(
            "HYDRO_GEN" => (
                HydroGenerationCost,
                (
                    resource="https://openapi.invalid/schema/external-ca198532ff44628c87dd.json",
                    pointer="/\$defs/HydroGenerationCost",
                ),
            ),
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
        ),
        tag isa Absent ? "" : String(tag),
        nothing,
    )
    selected === nothing && throw(
        DecodeError(
            "unknown discriminator value $(repr(tag)) for HydroPumpTurbineOperationCost",
        ),
    )
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for HydroPumpTurbineOperationCost",
            ),
        )
    return HydroPumpTurbineOperationCost(_decode(selected[1], value, false))
end
function _encode_unvalidated(value::HydroPumpTurbineOperationCost)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::HydroPumpTurbineOperationCost) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-e18af837c2d0e608e9b3.json",
        pointer="/properties/operation_cost",
    ),
    _encode_unvalidated(value),
    "encoding HydroPumpTurbineOperationCost";
    direction=:neutral,
)
