"""
    CapacityReserveMargin

Policy requirement enforcing a minimum capacity reserve margin in the target year, such that `(total_capacity - peak_demand) / peak_demand >= capacity_reserve_fraction`.

  - `id`: ID for individual component.
  - `name`: Name of the component.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`).
  - `target_year`: Year in which this requirement is applied.
  - `capacity_reserve_fraction`: Capacity reserve requirements, represented as a fraction of peak demand in a region. Units: 1.
"""
Base.@kwdef struct CapacityReserveMargin <: APIModel
    id::Int64
    name::String
    available::Bool
    target_year::Union{Absent, Int64, Nothing} = ABSENT
    capacity_reserve_fraction::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{CapacityReserveMargin}, value) = _decode(CapacityReserveMargin, value, true)
function _decode(::Type{CapacityReserveMargin}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-df0a29ae02a67207b1db.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding CapacityReserveMargin";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "CapacityReserveMargin")
    _openapi_field_id = _decode(
        Int64,
        _required(_openapi_object, "id", "CapacityReserveMargin"),
        _openapi_validate,
    )
    _openapi_field_name = _decode(
        String,
        _required(_openapi_object, "name", "CapacityReserveMargin"),
        _openapi_validate,
    )
    _openapi_field_available = _decode(
        Bool,
        _required(_openapi_object, "available", "CapacityReserveMargin"),
        _openapi_validate,
    )
    _openapi_field_target_year =
        haskey(_openapi_object, "target_year") ?
        _decode(
            Union{Absent, Int64, Nothing},
            _openapi_object["target_year"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_capacity_reserve_fraction =
        haskey(_openapi_object, "capacity_reserve_fraction") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["capacity_reserve_fraction"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in
        ("id", "name", "available", "target_year", "capacity_reserve_fraction") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return CapacityReserveMargin(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        target_year=_openapi_field_target_year,
        capacity_reserve_fraction=_openapi_field_capacity_reserve_fraction,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::CapacityReserveMargin)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.target_year isa Absent ||
        (_openapi_output["target_year"] = _encode(_openapi_value.target_year))
    _openapi_value.capacity_reserve_fraction isa Absent || (
        _openapi_output["capacity_reserve_fraction"] =
            _encode(_openapi_value.capacity_reserve_fraction)
    )
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
            resource="https://openapi.invalid/schema/external-df0a29ae02a67207b1db.json",
            pointer="",
        ),
        _openapi_output,
        "encoding CapacityReserveMargin";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::CapacityReserveMargin)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.target_year isa Absent ||
        push!(_openapi_output, "target_year" => _openapi_value.target_year)
    _openapi_value.capacity_reserve_fraction isa Absent || push!(
        _openapi_output,
        "capacity_reserve_fraction" => _openapi_value.capacity_reserve_fraction,
    )
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
