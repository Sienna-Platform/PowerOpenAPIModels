"""
    RetrofitPotential

Supplemental attribute linking a retrofit: existing generators of a source supply technology that can be converted into a retrofit option supply technology. The same attribute is attached to both the source and the option, one attribute per source and option pair.

  - `id`: ID for individual component.
  - `eligible_generators`: Names of the existing generation units of the source technology that can be retrofitted into the option technology.
  - `retrofit_efficiency`: Capacity of the option technology obtained per unit of source capacity retrofitted, e.g. below 1 when a retrofit derates the plant. Units: 1.
  - `retrofit_cost`: Cost associated with retrofitting the eligible generators. Units: USD/MW.
"""
Base.@kwdef struct RetrofitPotential <: APIModel
    id::Int64
    eligible_generators::Vector{String}
    retrofit_efficiency::Union{Absent, Float64, Nothing} = ABSENT
    retrofit_cost::Union{Absent, Nothing, RetrofitPotentialRetrofitCost} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{RetrofitPotential}, value) = _decode(RetrofitPotential, value, true)
function _decode(::Type{RetrofitPotential}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-b22424e257b193e5d5fb.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding RetrofitPotential";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "RetrofitPotential")
    _openapi_field_id =
        _decode_zoned(Int64, _required(_openapi_object, "id", "RetrofitPotential"), false)
    _openapi_field_eligible_generators = _decode_zoned(
        Vector{String},
        _required(_openapi_object, "eligible_generators", "RetrofitPotential"),
        false,
    )
    _openapi_field_retrofit_efficiency =
        haskey(_openapi_object, "retrofit_efficiency") ?
        _decode_zoned(
            Union{Absent, Float64, Nothing},
            _openapi_object["retrofit_efficiency"],
            false,
        ) : ABSENT
    _openapi_field_retrofit_cost =
        haskey(_openapi_object, "retrofit_cost") ?
        _decode_zoned(
            Union{Absent, Nothing, RetrofitPotentialRetrofitCost},
            _openapi_object["retrofit_cost"],
            false,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in
        ("id", "eligible_generators", "retrofit_efficiency", "retrofit_cost") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return RetrofitPotential(;
        id=_openapi_field_id,
        eligible_generators=_openapi_field_eligible_generators,
        retrofit_efficiency=_openapi_field_retrofit_efficiency,
        retrofit_cost=_openapi_field_retrofit_cost,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::RetrofitPotential)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.eligible_generators isa Absent || (
        _openapi_output["eligible_generators"] =
            _encode_unvalidated(_openapi_value.eligible_generators)
    )
    _openapi_value.retrofit_efficiency isa Absent || (
        _openapi_output["retrofit_efficiency"] =
            _encode_unvalidated(_openapi_value.retrofit_efficiency)
    )
    _openapi_value.retrofit_cost isa Absent || (
        _openapi_output["retrofit_cost"] =
            _encode_unvalidated(_openapi_value.retrofit_cost)
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
_encode(_openapi_value::RetrofitPotential) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-b22424e257b193e5d5fb.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding RetrofitPotential";
    direction=:neutral,
)

function _form_fields(_openapi_value::RetrofitPotential)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.eligible_generators isa Absent ||
        push!(_openapi_output, "eligible_generators" => _openapi_value.eligible_generators)
    _openapi_value.retrofit_efficiency isa Absent ||
        push!(_openapi_output, "retrofit_efficiency" => _openapi_value.retrofit_efficiency)
    _openapi_value.retrofit_cost isa Absent ||
        push!(_openapi_output, "retrofit_cost" => _openapi_value.retrofit_cost)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
