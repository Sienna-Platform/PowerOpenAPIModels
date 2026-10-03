"""
    SupplyTechnologyOperationCosts

Fixed and variable O&M costs for a technology. Units: USD/MWh.
"""
struct SupplyTechnologyOperationCosts <: OneOfAPIModel
    value::Union{HydroGenerationCost, RenewableGenerationCost, ThermalGenerationCost}
end
_decode(::Type{SupplyTechnologyOperationCosts}, value) =
    _decode(SupplyTechnologyOperationCosts, value, true)
function _decode(::Type{SupplyTechnologyOperationCosts}, value, _openapi_validate::Bool)
    object = _object(value, "SupplyTechnologyOperationCosts")
    tag = get(object, "cost_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(
            DecodeError(
                "discriminator value must be a string for SupplyTechnologyOperationCosts",
            ),
        )
    selected = get(
        Dict(
            "HYDRO_GEN" => (
                HydroGenerationCost,
                (
                    resource="https://openapi.invalid/schema/external-1e9a0d19d7563e537121.json",
                    pointer="/\$defs/HydroGenerationCost",
                ),
            ),
            "RENEWABLE" => (
                RenewableGenerationCost,
                (
                    resource="https://openapi.invalid/schema/external-1e9a0d19d7563e537121.json",
                    pointer="/\$defs/RenewableGenerationCost",
                ),
            ),
            "THERMAL" => (
                ThermalGenerationCost,
                (
                    resource="https://openapi.invalid/schema/external-1e9a0d19d7563e537121.json",
                    pointer="/\$defs/ThermalGenerationCost",
                ),
            ),
        ),
        tag isa Absent ? "" : String(tag),
        nothing,
    )
    selected === nothing && throw(
        DecodeError(
            "unknown discriminator value $(repr(tag)) for SupplyTechnologyOperationCosts",
        ),
    )
    _openapi_validate && _validate_schema(
        _SPEC,
        selected[2],
        value,
        "decoding SupplyTechnologyOperationCosts";
        direction=:neutral,
    )
    return SupplyTechnologyOperationCosts(_decode(selected[1], value, false))
end
function _encode_unvalidated(value::SupplyTechnologyOperationCosts)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::SupplyTechnologyOperationCosts) = _encode(value.value)
