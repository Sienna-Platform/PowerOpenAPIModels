@doc "    ServiceAssociation\n\nLinks a service to one component that contributes to it. One record per (service, member) pair: the many-to-many reserve-participation relation is normalized here rather than carried as a list on either side, so each membership is an individually addressable row. The type of either side is resolved through the entity registry rather than duplicated here, matching the shape of PlantAssociation and SupplementalAttributeAssociation. `entity_id` may name a Device (the reserve case), a Branch (TransmissionInterface), or another Service (GroupReserve), so no member-type discriminator is needed. The data model library stores the same relation on the device side as `Device.services`.\n\n- `entity_id`: ID of the contributing member: a Device, a Branch, or another Service.\n- `service_id`: ID of the service the membership belongs to."
Base.@kwdef struct ServiceAssociation
    entity_id::Int64
    service_id::Int64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{ServiceAssociation}, value) = _decode(ServiceAssociation, value, true)
function _decode(::Type{ServiceAssociation}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ServiceAssociation"), _openapi_raw, "decoding ServiceAssociation"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "ServiceAssociation")
    _openapi_field_entity_id = _decode(Int64, _required(_openapi_object, "entity_id", "ServiceAssociation"), _openapi_validate)
    _openapi_field_service_id = _decode(Int64, _required(_openapi_object, "service_id", "ServiceAssociation"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("entity_id","service_id") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return ServiceAssociation(; entity_id = _openapi_field_entity_id, service_id = _openapi_field_service_id, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::ServiceAssociation)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.entity_id isa Absent || (_openapi_output["entity_id"] = _encode(_openapi_value.entity_id))
    _openapi_value.service_id isa Absent || (_openapi_output["service_id"] = _encode(_openapi_value.service_id))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ServiceAssociation"), _openapi_output, "encoding ServiceAssociation"; direction = :neutral)
end

function _form_fields(_openapi_value::ServiceAssociation)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.entity_id isa Absent || push!(_openapi_output, "entity_id" => _openapi_value.entity_id)
    _openapi_value.service_id isa Absent || push!(_openapi_output, "service_id" => _openapi_value.service_id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
