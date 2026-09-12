"""
    GroupReserve

A reserve product met by a group of individual reserves. The group requirement is additional to each member's own requirement, and a device contributing to a member reserve also counts toward the group. Membership is carried by `ServiceAssociation` rows, not by a field here.

  - `id`: Unique integer identifier for this component.
  - `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.
  - `requirement`: The value of required reserves. Units: MW.
  - `variable`: Operating reserve demand curve for the group, either static or time-series-backed. A group carrying a curve is elastic: its requirement is priced by the curve rather than enforced. Time series values are carried via `time_series_associations` in the sidecar, never inline. Omit when the group has no demand curve.
  - `reserve_direction`: Whether the reserve is an upward, downward, or symmetric reserve product.
"""
Base.@kwdef struct GroupReserve <: APIModel
    id::Int64
    name::String
    available::Bool
    requirement::Float64
    variable::Union{Absent, CostCurve, Nothing} = ABSENT
    reserve_direction::ReserveDirection
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{GroupReserve}, value) = _decode(GroupReserve, value, true)
function _decode(::Type{GroupReserve}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-6ac3b98751d47b5d81a6.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding GroupReserve";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "GroupReserve")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "GroupReserve"), _openapi_validate)
    _openapi_field_name = _decode(
        String,
        _required(_openapi_object, "name", "GroupReserve"),
        _openapi_validate,
    )
    _openapi_field_available = _decode(
        Bool,
        _required(_openapi_object, "available", "GroupReserve"),
        _openapi_validate,
    )
    _openapi_field_requirement = _decode(
        Float64,
        _required(_openapi_object, "requirement", "GroupReserve"),
        _openapi_validate,
    )
    _openapi_field_variable =
        haskey(_openapi_object, "variable") ?
        _decode(
            Union{Absent, CostCurve, Nothing},
            _openapi_object["variable"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_reserve_direction = _decode(
        ReserveDirection,
        _required(_openapi_object, "reserve_direction", "GroupReserve"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in
        ("id", "name", "available", "requirement", "variable", "reserve_direction") &&
            continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return GroupReserve(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        requirement=_openapi_field_requirement,
        variable=_openapi_field_variable,
        reserve_direction=_openapi_field_reserve_direction,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::GroupReserve)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.requirement isa Absent ||
        (_openapi_output["requirement"] = _encode(_openapi_value.requirement))
    _openapi_value.variable isa Absent ||
        (_openapi_output["variable"] = _encode(_openapi_value.variable))
    _openapi_value.reserve_direction isa Absent ||
        (_openapi_output["reserve_direction"] = _encode(_openapi_value.reserve_direction))
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
            resource="https://openapi.invalid/schema/external-6ac3b98751d47b5d81a6.json",
            pointer="",
        ),
        _openapi_output,
        "encoding GroupReserve";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::GroupReserve)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.requirement isa Absent ||
        push!(_openapi_output, "requirement" => _openapi_value.requirement)
    _openapi_value.variable isa Absent ||
        push!(_openapi_output, "variable" => _openapi_value.variable)
    _openapi_value.reserve_direction isa Absent ||
        push!(_openapi_output, "reserve_direction" => _openapi_value.reserve_direction)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
