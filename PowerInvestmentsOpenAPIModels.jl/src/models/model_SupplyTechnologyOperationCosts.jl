@doc "    SupplyTechnologyOperationCosts\n\nFixed and variable O&M costs for a technology. Units: USD/MWh."
struct SupplyTechnologyOperationCosts
    value::Union{HydroGenerationCost,RenewableGenerationCost,ThermalGenerationCost}
end
_decode(::Type{SupplyTechnologyOperationCosts}, value) = _decode(SupplyTechnologyOperationCosts, value, true)
function _decode(::Type{SupplyTechnologyOperationCosts}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/SupplyTechnology/properties/operation_costs"), value, "decoding SupplyTechnologyOperationCosts"; direction = :neutral)
    object = _object(value, "SupplyTechnologyOperationCosts")
    tag = get(object, "cost_type", ABSENT)
    tag isa Absent || tag isa AbstractString || throw(DecodeError("discriminator value must be a string for SupplyTechnologyOperationCosts"))
    selected = get(Dict(
        "HYDRO_GEN" => (HydroGenerationCost, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/HydroGenerationCost")),
        "HydroGenerationCost" => (HydroGenerationCost, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/HydroGenerationCost")),
        "RENEWABLE" => (RenewableGenerationCost, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/RenewableGenerationCost")),
        "RenewableGenerationCost" => (RenewableGenerationCost, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/RenewableGenerationCost")),
        "THERMAL" => (ThermalGenerationCost, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/ThermalGenerationCost")),
        "ThermalGenerationCost" => (ThermalGenerationCost, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/ThermalGenerationCost")),
    ), tag isa Absent ? "" : String(tag), nothing)
    selected === nothing && throw(DecodeError("unknown discriminator value $(repr(tag)) for SupplyTechnologyOperationCosts"))
    !_openapi_validate || _schema_valid(_SPEC, selected[2], value; direction = :neutral) || throw(DecodeError("discriminator-selected schema did not validate for SupplyTechnologyOperationCosts"))
    return SupplyTechnologyOperationCosts(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::SupplyTechnologyOperationCosts)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/SupplyTechnology/properties/operation_costs"), output, "encoding SupplyTechnologyOperationCosts"; direction = :neutral)
end
