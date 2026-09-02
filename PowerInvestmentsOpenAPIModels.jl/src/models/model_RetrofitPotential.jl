@doc "    RetrofitPotential\n\nSupplemental attribute defining which existing generators mapped to a supply technology are eligible for retrofit.\n\n- `eligible_generators`: Names of individual generation units mapped to this technology that can be retrofitted.\n- `id`: ID for individual component."
Base.@kwdef struct RetrofitPotential
    eligible_generators::Union{Absent,Nothing,Vector{String}} = ABSENT
    id::Int64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{RetrofitPotential}, value) = _decode(RetrofitPotential, value, true)
function _decode(::Type{RetrofitPotential}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/RetrofitPotential"), _openapi_raw, "decoding RetrofitPotential"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "RetrofitPotential")
    _openapi_field_eligible_generators = haskey(_openapi_object, "eligible_generators") ? _decode(Union{Absent,Nothing,Vector{String}}, _openapi_object["eligible_generators"], _openapi_validate) : ABSENT
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "RetrofitPotential"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("eligible_generators","id") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return RetrofitPotential(; eligible_generators = _openapi_field_eligible_generators, id = _openapi_field_id, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::RetrofitPotential)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.eligible_generators isa Absent || (_openapi_output["eligible_generators"] = _encode(_openapi_value.eligible_generators))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/RetrofitPotential"), _openapi_output, "encoding RetrofitPotential"; direction = :neutral)
end

function _form_fields(_openapi_value::RetrofitPotential)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.eligible_generators isa Absent || push!(_openapi_output, "eligible_generators" => _openapi_value.eligible_generators)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
