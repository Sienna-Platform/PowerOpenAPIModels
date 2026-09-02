@doc "    PlantAssociation\n\nAssociation between a power plant supplemental attribute and a generating unit, identifying the group the unit belongs to within the plant. Covers 1-to-n cases: ThermalPowerPlant shafts, HydroPowerPlant penstocks, RenewablePowerPlant PCCs, and CombinedCycleFractional exclusion groups. The semantics of group_index are determined by the parent plant's type.\n\n- `entity_id`: ID of the generating unit (entity) participating in the plant\n- `group_index`: Group number within the plant (shaft, penstock, PCC, or exclusion group, depending on the parent plant's type)\n- `plant_id`: ID of the parent plant supplemental attribute"
Base.@kwdef struct PlantAssociation
    entity_id::Int64
    group_index::Int64
    plant_id::Int64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{PlantAssociation}, value) = _decode(PlantAssociation, value, true)
function _decode(::Type{PlantAssociation}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/PlantAssociation"), _openapi_raw, "decoding PlantAssociation"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "PlantAssociation")
    _openapi_field_entity_id = _decode(Int64, _required(_openapi_object, "entity_id", "PlantAssociation"), _openapi_validate)
    _openapi_field_group_index = _decode(Int64, _required(_openapi_object, "group_index", "PlantAssociation"), _openapi_validate)
    _openapi_field_plant_id = _decode(Int64, _required(_openapi_object, "plant_id", "PlantAssociation"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("entity_id","group_index","plant_id") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return PlantAssociation(; entity_id = _openapi_field_entity_id, group_index = _openapi_field_group_index, plant_id = _openapi_field_plant_id, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::PlantAssociation)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.entity_id isa Absent || (_openapi_output["entity_id"] = _encode(_openapi_value.entity_id))
    _openapi_value.group_index isa Absent || (_openapi_output["group_index"] = _encode(_openapi_value.group_index))
    _openapi_value.plant_id isa Absent || (_openapi_output["plant_id"] = _encode(_openapi_value.plant_id))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/PlantAssociation"), _openapi_output, "encoding PlantAssociation"; direction = :neutral)
end

function _form_fields(_openapi_value::PlantAssociation)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.entity_id isa Absent || push!(_openapi_output, "entity_id" => _openapi_value.entity_id)
    _openapi_value.group_index isa Absent || push!(_openapi_output, "group_index" => _openapi_value.group_index)
    _openapi_value.plant_id isa Absent || push!(_openapi_output, "plant_id" => _openapi_value.plant_id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
