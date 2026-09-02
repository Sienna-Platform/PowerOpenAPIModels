@doc "    SupplementalAttributeAssociation\n\nLinks a supplemental attribute to the component it describes — the JSON form of a row in the store's `supplemental_attribute_associations` catalog table, field-for-field. `component_type` and `attribute_type` are denormalized labels carried for filtering and reporting, not identity: identity is the `(component_id, attribute_id)` pair. Lives in Core because either side may be a Core or an Operations type. Unlike `components`, `supplemental_attributes` is a flat, untyped array, so `attribute_type` is this record's only per-row type discriminator.\n\n- `attribute_id`: ID of the supplemental attribute.\n- `attribute_type`: Schema title of the referenced supplemental attribute (e.g. \"EmissionsData\", \"GeographicInfo\"). A free-form string, not an enum: new attribute types are added elsewhere in this repo continuously, and a closed enum here would go stale.\n- `component_id`: ID of the component the attribute describes.\n- `component_type`: Type name of the component the attribute describes. A denormalized label matching the relational mirror's column, used for filtering; not part of the row's identity, which is the `(component_id, attribute_id)` pair."
Base.@kwdef struct SupplementalAttributeAssociation
    attribute_id::Int64
    attribute_type::String
    component_id::Int64
    component_type::String
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{SupplementalAttributeAssociation}, value) = _decode(SupplementalAttributeAssociation, value, true)
function _decode(::Type{SupplementalAttributeAssociation}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/SupplementalAttributeAssociation"), _openapi_raw, "decoding SupplementalAttributeAssociation"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "SupplementalAttributeAssociation")
    _openapi_field_attribute_id = _decode(Int64, _required(_openapi_object, "attribute_id", "SupplementalAttributeAssociation"), _openapi_validate)
    _openapi_field_attribute_type = _decode(String, _required(_openapi_object, "attribute_type", "SupplementalAttributeAssociation"), _openapi_validate)
    _openapi_field_component_id = _decode(Int64, _required(_openapi_object, "component_id", "SupplementalAttributeAssociation"), _openapi_validate)
    _openapi_field_component_type = _decode(String, _required(_openapi_object, "component_type", "SupplementalAttributeAssociation"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("attribute_id","attribute_type","component_id","component_type") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return SupplementalAttributeAssociation(; attribute_id = _openapi_field_attribute_id, attribute_type = _openapi_field_attribute_type, component_id = _openapi_field_component_id, component_type = _openapi_field_component_type, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::SupplementalAttributeAssociation)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.attribute_id isa Absent || (_openapi_output["attribute_id"] = _encode(_openapi_value.attribute_id))
    _openapi_value.attribute_type isa Absent || (_openapi_output["attribute_type"] = _encode(_openapi_value.attribute_type))
    _openapi_value.component_id isa Absent || (_openapi_output["component_id"] = _encode(_openapi_value.component_id))
    _openapi_value.component_type isa Absent || (_openapi_output["component_type"] = _encode(_openapi_value.component_type))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/SupplementalAttributeAssociation"), _openapi_output, "encoding SupplementalAttributeAssociation"; direction = :neutral)
end

function _form_fields(_openapi_value::SupplementalAttributeAssociation)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.attribute_id isa Absent || push!(_openapi_output, "attribute_id" => _openapi_value.attribute_id)
    _openapi_value.attribute_type isa Absent || push!(_openapi_output, "attribute_type" => _openapi_value.attribute_type)
    _openapi_value.component_id isa Absent || push!(_openapi_output, "component_id" => _openapi_value.component_id)
    _openapi_value.component_type isa Absent || push!(_openapi_output, "component_type" => _openapi_value.component_type)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
