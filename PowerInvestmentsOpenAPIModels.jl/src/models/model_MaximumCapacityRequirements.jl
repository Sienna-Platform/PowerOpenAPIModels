"""
    MaximumCapacityRequirements

Policy requirement that the total capacity of all eligible technologies in the target year be less than the specified limit in MW.

  - `id`: ID for individual component.
  - `name`: Name of the component.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`).
  - `target_year`: Year in which this requirement is applied.
  - `max_capacity_mw`: Maximum total capacity across all eligible resources. Units: MW.
"""
Base.@kwdef struct MaximumCapacityRequirements <: APIModel
    id::Int64
    name::String
    available::Bool
    target_year::Union{Absent, Int64, Nothing} = ABSENT
    max_capacity_mw::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{MaximumCapacityRequirements}, value) =
    _decode(MaximumCapacityRequirements, value, true)
function _decode(::Type{MaximumCapacityRequirements}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-33336c7963e6c0ab9cdb.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding MaximumCapacityRequirements";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "MaximumCapacityRequirements")
    _openapi_field_id = _decode(
        Int64,
        _required(_openapi_object, "id", "MaximumCapacityRequirements"),
        _openapi_validate,
    )
    _openapi_field_name = _decode(
        String,
        _required(_openapi_object, "name", "MaximumCapacityRequirements"),
        _openapi_validate,
    )
    _openapi_field_available = _decode(
        Bool,
        _required(_openapi_object, "available", "MaximumCapacityRequirements"),
        _openapi_validate,
    )
    _openapi_field_target_year =
        haskey(_openapi_object, "target_year") ?
        _decode(
            Union{Absent, Int64, Nothing},
            _openapi_object["target_year"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_max_capacity_mw =
        haskey(_openapi_object, "max_capacity_mw") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["max_capacity_mw"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in
        ("id", "name", "available", "target_year", "max_capacity_mw") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return MaximumCapacityRequirements(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        target_year=_openapi_field_target_year,
        max_capacity_mw=_openapi_field_max_capacity_mw,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::MaximumCapacityRequirements)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.target_year isa Absent ||
        (_openapi_output["target_year"] = _encode(_openapi_value.target_year))
    _openapi_value.max_capacity_mw isa Absent ||
        (_openapi_output["max_capacity_mw"] = _encode(_openapi_value.max_capacity_mw))
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
            resource="https://openapi.invalid/schema/external-33336c7963e6c0ab9cdb.json",
            pointer="",
        ),
        _openapi_output,
        "encoding MaximumCapacityRequirements";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::MaximumCapacityRequirements)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.target_year isa Absent ||
        push!(_openapi_output, "target_year" => _openapi_value.target_year)
    _openapi_value.max_capacity_mw isa Absent ||
        push!(_openapi_output, "max_capacity_mw" => _openapi_value.max_capacity_mw)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
