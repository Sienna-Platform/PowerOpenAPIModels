"""
    RequirementAssociation

Links a policy requirement to one member subject to it. One record per (requirement, member) pair: the many-to-many relation between a requirement and the components it constrains is normalized here rather than carried as a list on either side, so each membership is an individually addressable row. The type of either side is resolved through the entity registry rather than duplicated here, matching the shape of SupplementalAttributeAssociation. `requirement_id` names the policy requirement (a CapacityReserveMargin, CarbonCap, EnergyShareRequirement, ...); `entity_id` names the member the requirement applies to, so no member-type discriminator is needed.

  - `requirement_id`: ID of the policy requirement the membership belongs to.
  - `entity_id`: ID of the member the requirement applies to.
"""
Base.@kwdef struct RequirementAssociation <: APIModel
    requirement_id::Int64
    entity_id::Int64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{RequirementAssociation}, value) =
    _decode(RequirementAssociation, value, true)
function _decode(::Type{RequirementAssociation}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-41d5028ee397c1c6e1b4.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding RequirementAssociation";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "RequirementAssociation")
    _openapi_field_requirement_id = _decode(
        Int64,
        _required(_openapi_object, "requirement_id", "RequirementAssociation"),
        _openapi_validate,
    )
    _openapi_field_entity_id = _decode(
        Int64,
        _required(_openapi_object, "entity_id", "RequirementAssociation"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("requirement_id", "entity_id") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return RequirementAssociation(;
        requirement_id=_openapi_field_requirement_id,
        entity_id=_openapi_field_entity_id,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::RequirementAssociation)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.requirement_id isa Absent ||
        (_openapi_output["requirement_id"] = _encode(_openapi_value.requirement_id))
    _openapi_value.entity_id isa Absent ||
        (_openapi_output["entity_id"] = _encode(_openapi_value.entity_id))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(
            ArgumentError(
                "additional property conflicts with declared field: " * _openapi_key,
            ),
        )
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-41d5028ee397c1c6e1b4.json",
            pointer="",
        ),
        _openapi_output,
        "encoding RequirementAssociation";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::RequirementAssociation)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.requirement_id isa Absent ||
        push!(_openapi_output, "requirement_id" => _openapi_value.requirement_id)
    _openapi_value.entity_id isa Absent ||
        push!(_openapi_output, "entity_id" => _openapi_value.entity_id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
