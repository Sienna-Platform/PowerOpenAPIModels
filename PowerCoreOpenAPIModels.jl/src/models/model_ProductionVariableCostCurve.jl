"""
    ProductionVariableCostCurve

Variable production cost of a device, selected by `variable_cost_type` between a curve denominated directly in currency (`COST`) and one denominated in fuel with a separate fuel price (`FUEL`).
"""
struct ProductionVariableCostCurve <: OneOfAPIModel
    value::Union{CostCurve, FuelCurve}
end
_decode(::Type{ProductionVariableCostCurve}, value) =
    _decode(ProductionVariableCostCurve, value, true)
function _decode(::Type{ProductionVariableCostCurve}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/ProductionVariableCostCurve",
        ),
        value,
        "decoding ProductionVariableCostCurve";
        direction=:neutral,
    )
    object = _object(value, "ProductionVariableCostCurve")
    tag = get(object, "variable_cost_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(
            DecodeError(
                "discriminator value must be a string for ProductionVariableCostCurve",
            ),
        )
    selected = get(
        Dict(
            "COST" => (
                CostCurve,
                (
                    resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
                    pointer="/\$defs/CostCurve",
                ),
            ),
            "FUEL" => (
                FuelCurve,
                (
                    resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
                    pointer="/\$defs/FuelCurve",
                ),
            ),
        ),
        tag isa Absent ? "" : String(tag),
        nothing,
    )
    selected === nothing && throw(
        DecodeError(
            "unknown discriminator value $(repr(tag)) for ProductionVariableCostCurve",
        ),
    )
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for ProductionVariableCostCurve",
            ),
        )
    return ProductionVariableCostCurve(_decode(selected[1], value, false))
end
function _encode_unvalidated(value::ProductionVariableCostCurve)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::ProductionVariableCostCurve) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
        pointer="/\$defs/ProductionVariableCostCurve",
    ),
    _encode_unvalidated(value),
    "encoding ProductionVariableCostCurve";
    direction=:neutral,
)
