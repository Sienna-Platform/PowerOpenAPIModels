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
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-8b4207e8484211f67fb3.json",
            pointer="/properties/operation_costs_inverter",
        ),
        value,
        "decoding ColocatedSupplyStorageTechnologyOperationCostsInverter";
        direction=:neutral,
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
                    resource="https://openapi.invalid/schema/external-0c77f7276093a5d31ba5.json",
                    pointer="/\$defs/CostCurve",
                ),
            ),
            "FUEL" => (
                FuelCurve,
                (
                    resource="https://openapi.invalid/schema/external-0c77f7276093a5d31ba5.json",
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
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for ColocatedSupplyStorageTechnologyOperationCostsInverter",
            ),
        )
    return ColocatedSupplyStorageTechnologyOperationCostsInverter(
        _decode(selected[1], value, _openapi_validate),
    )
end
function _encode(value::ColocatedSupplyStorageTechnologyOperationCostsInverter)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-8b4207e8484211f67fb3.json",
            pointer="/properties/operation_costs_inverter",
        ),
        output,
        "encoding ColocatedSupplyStorageTechnologyOperationCostsInverter";
        direction=:neutral,
    )
end
