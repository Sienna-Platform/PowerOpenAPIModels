"""
    EnergyShareRequirements

Policy requirement that the total generation of the eligible technologies be at least a pre-determined fraction of the total annual demand across the eligible zones in the target year.

  - `id`: ID for individual component.
  - `name`: Name of the component.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`).
  - `target_year`: Year in which this requirement is applied.
  - `generation_fraction_requirement`: Fraction of total annual demand across all eligible zones that needs to be met by eligible resources. Units: 1.
"""
Base.@kwdef struct EnergyShareRequirements <: APIModel
    id::Int64
    name::String
    available::Bool
    target_year::Union{Absent, Int64, Nothing} = ABSENT
    generation_fraction_requirement::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{EnergyShareRequirements}, value) =
    _decode(EnergyShareRequirements, value, true)
function _decode(::Type{EnergyShareRequirements}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-6d58e76673c50883bd3a.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding EnergyShareRequirements";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "EnergyShareRequirements")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "EnergyShareRequirements"), false)
    _openapi_field_name = _decode(
        String,
        _required(_openapi_object, "name", "EnergyShareRequirements"),
        false,
    )
    _openapi_field_available = _decode(
        Bool,
        _required(_openapi_object, "available", "EnergyShareRequirements"),
        false,
    )
    _openapi_field_target_year =
        haskey(_openapi_object, "target_year") ?
        _decode(Union{Absent, Int64, Nothing}, _openapi_object["target_year"], false) :
        ABSENT
    _openapi_field_generation_fraction_requirement =
        haskey(_openapi_object, "generation_fraction_requirement") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["generation_fraction_requirement"],
            false,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in
        ("id", "name", "available", "target_year", "generation_fraction_requirement") &&
            continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return EnergyShareRequirements(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        target_year=_openapi_field_target_year,
        generation_fraction_requirement=_openapi_field_generation_fraction_requirement,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::EnergyShareRequirements)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode_unvalidated(_openapi_value.name))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode_unvalidated(_openapi_value.available))
    _openapi_value.target_year isa Absent ||
        (_openapi_output["target_year"] = _encode_unvalidated(_openapi_value.target_year))
    _openapi_value.generation_fraction_requirement isa Absent || (
        _openapi_output["generation_fraction_requirement"] =
            _encode_unvalidated(_openapi_value.generation_fraction_requirement)
    )
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(
            ArgumentError(
                "additional property conflicts with declared field: " * _openapi_key,
            ),
        )
        _openapi_output[_openapi_key] = _encode_unvalidated(_openapi_item)
    end
    return _openapi_output
end
_encode(_openapi_value::EnergyShareRequirements) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-6d58e76673c50883bd3a.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding EnergyShareRequirements";
    direction=:neutral,
)

function _form_fields(_openapi_value::EnergyShareRequirements)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.target_year isa Absent ||
        push!(_openapi_output, "target_year" => _openapi_value.target_year)
    _openapi_value.generation_fraction_requirement isa Absent || push!(
        _openapi_output,
        "generation_fraction_requirement" =>
            _openapi_value.generation_fraction_requirement,
    )
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
