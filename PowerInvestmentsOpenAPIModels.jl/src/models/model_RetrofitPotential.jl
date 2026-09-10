"""
    RetrofitPotential

Supplemental attribute defining which existing generators mapped to a supply technology are eligible for retrofit.

  - `eligible_generators`: Names of individual generation units mapped to this technology that can be retrofitted.
  - `id`: ID for individual component.
  - `retrofit_cost`: Cost associated with retrofitting the eligible generators. Units: USD/MW.
  - `retrofit_fraction`: Fraction of existing capacity that is eligible for retrofits. Units: 1.
"""
Base.@kwdef struct RetrofitPotential <: APIModel
    eligible_generators::Vector{String}
    id::Int64
    retrofit_cost::RetrofitPotentialRetrofitCost
    retrofit_fraction::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{RetrofitPotential}, value) = _decode(RetrofitPotential, value, true)
function _decode(::Type{RetrofitPotential}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-384713fc06a7c2e0ea0f.json",
            pointer="/components/schemas/RetrofitPotential",
        ),
        _openapi_raw,
        "decoding RetrofitPotential";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "RetrofitPotential")
    _openapi_field_eligible_generators = _decode(
        Vector{String},
        _required(_openapi_object, "eligible_generators", "RetrofitPotential"),
        _openapi_validate,
    )
    _openapi_field_id = _decode(
        Int64,
        _required(_openapi_object, "id", "RetrofitPotential"),
        _openapi_validate,
    )
    _openapi_field_retrofit_cost = _decode(
        RetrofitPotentialRetrofitCost,
        _required(_openapi_object, "retrofit_cost", "RetrofitPotential"),
        _openapi_validate,
    )
    _openapi_field_retrofit_fraction =
        haskey(_openapi_object, "retrofit_fraction") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["retrofit_fraction"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in
        ("eligible_generators", "id", "retrofit_cost", "retrofit_fraction") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return RetrofitPotential(;
        eligible_generators=_openapi_field_eligible_generators,
        id=_openapi_field_id,
        retrofit_cost=_openapi_field_retrofit_cost,
        retrofit_fraction=_openapi_field_retrofit_fraction,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::RetrofitPotential)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.eligible_generators isa Absent || (
        _openapi_output["eligible_generators"] =
            _encode(_openapi_value.eligible_generators)
    )
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.retrofit_cost isa Absent ||
        (_openapi_output["retrofit_cost"] = _encode(_openapi_value.retrofit_cost))
    _openapi_value.retrofit_fraction isa Absent ||
        (_openapi_output["retrofit_fraction"] = _encode(_openapi_value.retrofit_fraction))
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
            resource="https://openapi.invalid/schema/root-384713fc06a7c2e0ea0f.json",
            pointer="/components/schemas/RetrofitPotential",
        ),
        _openapi_output,
        "encoding RetrofitPotential";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::RetrofitPotential)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.eligible_generators isa Absent ||
        push!(_openapi_output, "eligible_generators" => _openapi_value.eligible_generators)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.retrofit_cost isa Absent ||
        push!(_openapi_output, "retrofit_cost" => _openapi_value.retrofit_cost)
    _openapi_value.retrofit_fraction isa Absent ||
        push!(_openapi_output, "retrofit_fraction" => _openapi_value.retrofit_fraction)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
