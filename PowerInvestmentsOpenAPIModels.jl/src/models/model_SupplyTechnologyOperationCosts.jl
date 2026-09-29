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
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-7b4dcc53473d04c21ad5.json",
            pointer="/properties/operation_costs",
        ),
        value,
        "decoding SupplyTechnologyOperationCosts";
        direction=:neutral,
    )
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
                    resource="https://openapi.invalid/schema/external-207c3896c96d98ecaf37.json",
                    pointer="/\$defs/HydroGenerationCost",
                ),
            ),
            "RENEWABLE" => (
                RenewableGenerationCost,
                (
                    resource="https://openapi.invalid/schema/external-207c3896c96d98ecaf37.json",
                    pointer="/\$defs/RenewableGenerationCost",
                ),
            ),
            "THERMAL" => (
                ThermalGenerationCost,
                (
                    resource="https://openapi.invalid/schema/external-207c3896c96d98ecaf37.json",
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
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for SupplyTechnologyOperationCosts",
            ),
        )
    return SupplyTechnologyOperationCosts(_decode(selected[1], value, false))
end
function _encode_unvalidated(value::SupplyTechnologyOperationCosts)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::SupplyTechnologyOperationCosts) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-7b4dcc53473d04c21ad5.json",
        pointer="/properties/operation_costs",
    ),
    _encode_unvalidated(value),
    "encoding SupplyTechnologyOperationCosts";
    direction=:neutral,
)
