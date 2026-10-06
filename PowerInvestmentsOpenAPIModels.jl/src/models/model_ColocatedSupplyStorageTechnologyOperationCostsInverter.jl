"""
    ColocatedSupplyStorageTechnologyOperationCostsInverter

Operational costs for using inverter in co-located systems. Units: USD/MWh.
"""
struct ColocatedSupplyStorageTechnologyOperationCostsInverter <: OneOfAPIModel
    value::Union{CostCurve, FuelCurve}
end
_decode(::Type{ColocatedSupplyStorageTechnologyOperationCostsInverter}, value) =
    _decode(ColocatedSupplyStorageTechnologyOperationCostsInverter, value, true)
function _decode(
    ::Type{ColocatedSupplyStorageTechnologyOperationCostsInverter},
    value,
    _openapi_validate::Bool,
)
    object = _object(value, "ColocatedSupplyStorageTechnologyOperationCostsInverter")
    tag = get(object, "variable_cost_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(
            DecodeError(
                "discriminator value must be a string for ColocatedSupplyStorageTechnologyOperationCostsInverter",
            ),
        )
    selected = get(
        Dict(
            "COST" => (
                CostCurve,
                (
                    resource="https://openapi.invalid/schema/external-07322f5ca369953d3685.json",
                    pointer="/\$defs/CostCurve",
                ),
            ),
            "FUEL" => (
                FuelCurve,
                (
                    resource="https://openapi.invalid/schema/external-07322f5ca369953d3685.json",
                    pointer="/\$defs/FuelCurve",
                ),
            ),
        ),
        tag isa Absent ? "" : String(tag),
        nothing,
    )
    selected === nothing && throw(
        DecodeError(
            "unknown discriminator value $(repr(tag)) for ColocatedSupplyStorageTechnologyOperationCostsInverter",
        ),
    )
    _openapi_validate && _validate_schema(
        _SPEC,
        selected[2],
        value,
        "decoding ColocatedSupplyStorageTechnologyOperationCostsInverter";
        direction=:neutral,
    )
    return ColocatedSupplyStorageTechnologyOperationCostsInverter(
        _decode(selected[1], value, false),
    )
end
function _encode_unvalidated(value::ColocatedSupplyStorageTechnologyOperationCostsInverter)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::ColocatedSupplyStorageTechnologyOperationCostsInverter) =
    _encode(value.value)
