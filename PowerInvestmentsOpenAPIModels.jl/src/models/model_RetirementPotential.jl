@doc "    RetirementPotential\n\nSupplemental attribute defining which existing generators mapped to a supply technology are eligible for retirement, optionally with the year each was built and the year each is already scheduled to retire.\n\n- `build_year`: Optional dictionary to indicate the year in which existing generators in the base system were built.\n- `eligible_generators`: Names of individual generation units mapped to a technology that are eligible for retirement.\n- `id`: ID for individual component.\n- `planned_retirement_year`: Optional dictionary to indicate the year in which the forced/planned retirement will occur."
Base.@kwdef struct RetirementPotential
    build_year::Union{Absent,Nothing,RetirementPotentialBuildYear} = ABSENT
    eligible_generators::Union{Absent,Nothing,Vector{String}} = ABSENT
    id::Int64
    planned_retirement_year::Union{Absent,Nothing,RetirementPotentialPlannedRetirementYear} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{RetirementPotential}, value) = _decode(RetirementPotential, value, true)
function _decode(::Type{RetirementPotential}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/RetirementPotential"), _openapi_raw, "decoding RetirementPotential"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "RetirementPotential")
    _openapi_field_build_year = haskey(_openapi_object, "build_year") ? _decode(Union{Absent,Nothing,RetirementPotentialBuildYear}, _openapi_object["build_year"], _openapi_validate) : ABSENT
    _openapi_field_eligible_generators = haskey(_openapi_object, "eligible_generators") ? _decode(Union{Absent,Nothing,Vector{String}}, _openapi_object["eligible_generators"], _openapi_validate) : ABSENT
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "RetirementPotential"), _openapi_validate)
    _openapi_field_planned_retirement_year = haskey(_openapi_object, "planned_retirement_year") ? _decode(Union{Absent,Nothing,RetirementPotentialPlannedRetirementYear}, _openapi_object["planned_retirement_year"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("build_year","eligible_generators","id","planned_retirement_year") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return RetirementPotential(; build_year = _openapi_field_build_year, eligible_generators = _openapi_field_eligible_generators, id = _openapi_field_id, planned_retirement_year = _openapi_field_planned_retirement_year, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::RetirementPotential)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.build_year isa Absent || (_openapi_output["build_year"] = _encode(_openapi_value.build_year))
    _openapi_value.eligible_generators isa Absent || (_openapi_output["eligible_generators"] = _encode(_openapi_value.eligible_generators))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.planned_retirement_year isa Absent || (_openapi_output["planned_retirement_year"] = _encode(_openapi_value.planned_retirement_year))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/RetirementPotential"), _openapi_output, "encoding RetirementPotential"; direction = :neutral)
end

function _form_fields(_openapi_value::RetirementPotential)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.build_year isa Absent || push!(_openapi_output, "build_year" => _openapi_value.build_year)
    _openapi_value.eligible_generators isa Absent || push!(_openapi_output, "eligible_generators" => _openapi_value.eligible_generators)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.planned_retirement_year isa Absent || push!(_openapi_output, "planned_retirement_year" => _openapi_value.planned_retirement_year)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
