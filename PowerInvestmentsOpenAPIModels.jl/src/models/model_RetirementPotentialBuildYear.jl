@doc "    RetirementPotentialBuildYear\n\nOptional dictionary to indicate the year in which existing generators in the base system were built."
Base.@kwdef struct RetirementPotentialBuildYear
    additional_properties::Dict{String,Int64} = Dict{String,Int64}()
end
_decode(::Type{RetirementPotentialBuildYear}, value) = _decode(RetirementPotentialBuildYear, value, true)
function _decode(::Type{RetirementPotentialBuildYear}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/RetirementPotential/properties/build_year"), _openapi_raw, "decoding RetirementPotentialBuildYear"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "RetirementPotentialBuildYear")
    _openapi_additional_properties = Dict{String,Int64}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in () && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Int64, _openapi_item, _openapi_validate)
    end
    return RetirementPotentialBuildYear(; additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::RetirementPotentialBuildYear)
    _openapi_output = JSON.Object{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/RetirementPotential/properties/build_year"), _openapi_output, "encoding RetirementPotentialBuildYear"; direction = :neutral)
end

function _form_fields(_openapi_value::RetirementPotentialBuildYear)
    _openapi_output = Pair{String,Any}[]
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
