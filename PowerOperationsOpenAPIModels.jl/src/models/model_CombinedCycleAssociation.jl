@doc "    CombinedCycleAssociation\n\nAssociation between a CombinedCycleBlock plant and a CT or CA unit, identifying which HRSG the unit feeds into or receives from. Supports n-to-m relationships: a single CT or CA can participate in multiple HRSGs by appearing in multiple rows.\n\n- `entity_id`: ID of the CT or CA generating unit\n- `hrsg_index`: HRSG (heat recovery steam generator) index this unit is associated with\n- `plant_id`: ID of the parent CombinedCycleBlock supplemental attribute\n- `role`: Role of the entity within the combined cycle block (combustion turbine input or combustion-augmented steam output)"
Base.@kwdef struct CombinedCycleAssociation
    entity_id::Int64
    hrsg_index::Int64
    plant_id::Int64
    role::CombinedCycleAssociationRole
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{CombinedCycleAssociation}, value) = _decode(CombinedCycleAssociation, value, true)
function _decode(::Type{CombinedCycleAssociation}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/CombinedCycleAssociation"), _openapi_raw, "decoding CombinedCycleAssociation"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "CombinedCycleAssociation")
    _openapi_field_entity_id = _decode(Int64, _required(_openapi_object, "entity_id", "CombinedCycleAssociation"), _openapi_validate)
    _openapi_field_hrsg_index = _decode(Int64, _required(_openapi_object, "hrsg_index", "CombinedCycleAssociation"), _openapi_validate)
    _openapi_field_plant_id = _decode(Int64, _required(_openapi_object, "plant_id", "CombinedCycleAssociation"), _openapi_validate)
    _openapi_field_role = _decode(CombinedCycleAssociationRole, _required(_openapi_object, "role", "CombinedCycleAssociation"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("entity_id","hrsg_index","plant_id","role") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return CombinedCycleAssociation(; entity_id = _openapi_field_entity_id, hrsg_index = _openapi_field_hrsg_index, plant_id = _openapi_field_plant_id, role = _openapi_field_role, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::CombinedCycleAssociation)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.entity_id isa Absent || (_openapi_output["entity_id"] = _encode(_openapi_value.entity_id))
    _openapi_value.hrsg_index isa Absent || (_openapi_output["hrsg_index"] = _encode(_openapi_value.hrsg_index))
    _openapi_value.plant_id isa Absent || (_openapi_output["plant_id"] = _encode(_openapi_value.plant_id))
    _openapi_value.role isa Absent || (_openapi_output["role"] = _encode(_openapi_value.role))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/CombinedCycleAssociation"), _openapi_output, "encoding CombinedCycleAssociation"; direction = :neutral)
end

function _form_fields(_openapi_value::CombinedCycleAssociation)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.entity_id isa Absent || push!(_openapi_output, "entity_id" => _openapi_value.entity_id)
    _openapi_value.hrsg_index isa Absent || push!(_openapi_output, "hrsg_index" => _openapi_value.hrsg_index)
    _openapi_value.plant_id isa Absent || push!(_openapi_output, "plant_id" => _openapi_value.plant_id)
    _openapi_value.role isa Absent || push!(_openapi_output, "role" => _openapi_value.role)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
