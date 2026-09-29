"""
    RetirementPotentialPlannedRetirementYear

Optional dictionary to indicate the year in which the forced/planned retirement will occur.
"""
Base.@kwdef struct RetirementPotentialPlannedRetirementYear <: APIModel
    additional_properties::Dict{String, Int64} = Dict{String, Int64}()
end
_decode(::Type{RetirementPotentialPlannedRetirementYear}, value) =
    _decode(RetirementPotentialPlannedRetirementYear, value, true)
function _decode(
    ::Type{RetirementPotentialPlannedRetirementYear},
    _openapi_raw,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-43c16ab3a65ba5ff9fd3.json",
            pointer="/properties/planned_retirement_year",
        ),
        _openapi_raw,
        "decoding RetirementPotentialPlannedRetirementYear";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "RetirementPotentialPlannedRetirementYear")
    _openapi_additional_properties = Dict{String, Int64}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in () && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Int64, _openapi_item, false)
    end
    return RetirementPotentialPlannedRetirementYear(;
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::RetirementPotentialPlannedRetirementYear)
    _openapi_output = JSON.Object{String, Any}()
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
_encode(_openapi_value::RetirementPotentialPlannedRetirementYear) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-43c16ab3a65ba5ff9fd3.json",
        pointer="/properties/planned_retirement_year",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding RetirementPotentialPlannedRetirementYear";
    direction=:neutral,
)

function _form_fields(_openapi_value::RetirementPotentialPlannedRetirementYear)
    _openapi_output = Pair{String, Any}[]
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
