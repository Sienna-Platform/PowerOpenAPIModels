"""
    RetirementPotential

Supplemental attribute defining which existing generators mapped to a supply technology are eligible for retirement, optionally with the year each was built and the year each is already scheduled to retire.

  - `id`: ID for individual component.
  - `eligible_generators`: Names of individual generation units mapped to a technology that are eligible for retirement.
  - `planned_retirement_year`: Optional dictionary to indicate the year in which the forced/planned retirement will occur.
  - `build_year`: Optional dictionary to indicate the year in which existing generators in the base system were built.
  - `retirement_cost`: Cost associated with retiring the eligible generators. Units: USD/MW.
"""
Base.@kwdef struct RetirementPotential <: APIModel
    id::Int64
    eligible_generators::Vector{String}
    planned_retirement_year::Union{
        Absent,
        Nothing,
        RetirementPotentialPlannedRetirementYear,
    } = ABSENT
    build_year::Union{Absent, Nothing, RetirementPotentialBuildYear} = ABSENT
    retirement_cost::RetirementPotentialRetirementCost
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{RetirementPotential}, value) = _decode(RetirementPotential, value, true)
function _decode(::Type{RetirementPotential}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-c906cda7191beeec94f7.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding RetirementPotential";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "RetirementPotential")
    _openapi_field_id = _decode(
        Int64,
        _required(_openapi_object, "id", "RetirementPotential"),
        _openapi_validate,
    )
    _openapi_field_eligible_generators = _decode(
        Vector{String},
        _required(_openapi_object, "eligible_generators", "RetirementPotential"),
        _openapi_validate,
    )
    _openapi_field_planned_retirement_year =
        haskey(_openapi_object, "planned_retirement_year") ?
        _decode(
            Union{Absent, Nothing, RetirementPotentialPlannedRetirementYear},
            _openapi_object["planned_retirement_year"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_build_year =
        haskey(_openapi_object, "build_year") ?
        _decode(
            Union{Absent, Nothing, RetirementPotentialBuildYear},
            _openapi_object["build_year"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_retirement_cost = _decode(
        RetirementPotentialRetirementCost,
        _required(_openapi_object, "retirement_cost", "RetirementPotential"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "eligible_generators",
            "planned_retirement_year",
            "build_year",
            "retirement_cost",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return RetirementPotential(;
        id=_openapi_field_id,
        eligible_generators=_openapi_field_eligible_generators,
        planned_retirement_year=_openapi_field_planned_retirement_year,
        build_year=_openapi_field_build_year,
        retirement_cost=_openapi_field_retirement_cost,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::RetirementPotential)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.eligible_generators isa Absent || (
        _openapi_output["eligible_generators"] =
            _encode(_openapi_value.eligible_generators)
    )
    _openapi_value.planned_retirement_year isa Absent || (
        _openapi_output["planned_retirement_year"] =
            _encode(_openapi_value.planned_retirement_year)
    )
    _openapi_value.build_year isa Absent ||
        (_openapi_output["build_year"] = _encode(_openapi_value.build_year))
    _openapi_value.retirement_cost isa Absent ||
        (_openapi_output["retirement_cost"] = _encode(_openapi_value.retirement_cost))
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
            resource="https://openapi.invalid/schema/external-c906cda7191beeec94f7.json",
            pointer="",
        ),
        _openapi_output,
        "encoding RetirementPotential";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::RetirementPotential)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.eligible_generators isa Absent ||
        push!(_openapi_output, "eligible_generators" => _openapi_value.eligible_generators)
    _openapi_value.planned_retirement_year isa Absent || push!(
        _openapi_output,
        "planned_retirement_year" => _openapi_value.planned_retirement_year,
    )
    _openapi_value.build_year isa Absent ||
        push!(_openapi_output, "build_year" => _openapi_value.build_year)
    _openapi_value.retirement_cost isa Absent ||
        push!(_openapi_output, "retirement_cost" => _openapi_value.retirement_cost)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
