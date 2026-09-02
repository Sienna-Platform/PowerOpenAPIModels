@doc "    ThermalGenerationCostStartUp\n\nStart-up cost can take linear or multi-stage cost"
struct ThermalGenerationCostStartUp
    value::Union{Float64,StartUpStages}
end
_decode(::Type{ThermalGenerationCostStartUp}, value) = _decode(ThermalGenerationCostStartUp, value, true)
function _decode(::Type{ThermalGenerationCostStartUp}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/ThermalGenerationCost/properties/start_up"), value, "decoding ThermalGenerationCostStartUp"; direction = :neutral)
    object = _object(value, "ThermalGenerationCostStartUp")
    tag = get(object, "startup_stages_type", ABSENT)
    tag isa Absent || tag isa AbstractString || throw(DecodeError("discriminator value must be a string for ThermalGenerationCostStartUp"))
    selected = get(Dict(
        "STAGES" => (StartUpStages, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/StartUpStages")),
        "StartUpStages" => (StartUpStages, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/StartUpStages")),
    ), tag isa Absent ? "" : String(tag), nothing)
    selected === nothing && throw(DecodeError("unknown discriminator value $(repr(tag)) for ThermalGenerationCostStartUp"))
    !_openapi_validate || _schema_valid(_SPEC, selected[2], value; direction = :neutral) || throw(DecodeError("discriminator-selected schema did not validate for ThermalGenerationCostStartUp"))
    return ThermalGenerationCostStartUp(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::ThermalGenerationCostStartUp)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/ThermalGenerationCost/properties/start_up"), output, "encoding ThermalGenerationCostStartUp"; direction = :neutral)
end
