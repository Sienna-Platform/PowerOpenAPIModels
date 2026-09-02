@doc "    ProductionVariableCostCurve\n\nVariable production cost of a device, selected by `variable_cost_type` between a curve denominated directly in currency (`COST`) and one denominated in fuel with a separate fuel price (`FUEL`)."
struct ProductionVariableCostCurve
    value::Union{CostCurve,FuelCurve}
end
_decode(::Type{ProductionVariableCostCurve}, value) = _decode(ProductionVariableCostCurve, value, true)
function _decode(::Type{ProductionVariableCostCurve}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/ProductionVariableCostCurve"), value, "decoding ProductionVariableCostCurve"; direction = :neutral)
    object = _object(value, "ProductionVariableCostCurve")
    tag = get(object, "variable_cost_type", ABSENT)
    tag isa Absent || tag isa AbstractString || throw(DecodeError("discriminator value must be a string for ProductionVariableCostCurve"))
    selected = get(Dict(
        "COST" => (CostCurve, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/CostCurve")),
        "CostCurve" => (CostCurve, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/CostCurve")),
        "FUEL" => (FuelCurve, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/FuelCurve")),
        "FuelCurve" => (FuelCurve, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/FuelCurve")),
    ), tag isa Absent ? "" : String(tag), nothing)
    selected === nothing && throw(DecodeError("unknown discriminator value $(repr(tag)) for ProductionVariableCostCurve"))
    !_openapi_validate || _schema_valid(_SPEC, selected[2], value; direction = :neutral) || throw(DecodeError("discriminator-selected schema did not validate for ProductionVariableCostCurve"))
    return ProductionVariableCostCurve(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::ProductionVariableCostCurve)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/ProductionVariableCostCurve"), output, "encoding ProductionVariableCostCurve"; direction = :neutral)
end
