@doc "    AggregateRetrofitPotential\n\nSupplemental attribute defining a total amount of a supply technology's capacity that can be retrofit, given either as an absolute quantity or as a fraction of existing capacity. `retrofit_id` groups retrofittable source technologies with the retrofit options available to them inside the same zone.\n\n- `id`: ID for individual component.\n- `retrofit_fraction`: Fraction of existing capacity that is eligible for retrofits. Alternative to retrofit_potential. Units: 1.\n- `retrofit_id`: Unique identifier to group retrofittable source technologies with retrofit options inside the same zone.\n- `retrofit_potential`: Amount of existing capacity for technology that can be retrofitted. Units: MW."
Base.@kwdef struct AggregateRetrofitPotential
    id::Int64
    retrofit_fraction::Union{Absent,Float64,Nothing} = ABSENT
    retrofit_id::Union{Absent,Int64,Nothing} = ABSENT
    retrofit_potential::Union{Absent,Float64,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{AggregateRetrofitPotential}, value) = _decode(AggregateRetrofitPotential, value, true)
function _decode(::Type{AggregateRetrofitPotential}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/AggregateRetrofitPotential"), _openapi_raw, "decoding AggregateRetrofitPotential"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "AggregateRetrofitPotential")
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "AggregateRetrofitPotential"), _openapi_validate)
    _openapi_field_retrofit_fraction = haskey(_openapi_object, "retrofit_fraction") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["retrofit_fraction"], _openapi_validate) : ABSENT
    _openapi_field_retrofit_id = haskey(_openapi_object, "retrofit_id") ? _decode(Union{Absent,Int64,Nothing}, _openapi_object["retrofit_id"], _openapi_validate) : ABSENT
    _openapi_field_retrofit_potential = haskey(_openapi_object, "retrofit_potential") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["retrofit_potential"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("id","retrofit_fraction","retrofit_id","retrofit_potential") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return AggregateRetrofitPotential(; id = _openapi_field_id, retrofit_fraction = _openapi_field_retrofit_fraction, retrofit_id = _openapi_field_retrofit_id, retrofit_potential = _openapi_field_retrofit_potential, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::AggregateRetrofitPotential)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.retrofit_fraction isa Absent || (_openapi_output["retrofit_fraction"] = _encode(_openapi_value.retrofit_fraction))
    _openapi_value.retrofit_id isa Absent || (_openapi_output["retrofit_id"] = _encode(_openapi_value.retrofit_id))
    _openapi_value.retrofit_potential isa Absent || (_openapi_output["retrofit_potential"] = _encode(_openapi_value.retrofit_potential))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/AggregateRetrofitPotential"), _openapi_output, "encoding AggregateRetrofitPotential"; direction = :neutral)
end

function _form_fields(_openapi_value::AggregateRetrofitPotential)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.retrofit_fraction isa Absent || push!(_openapi_output, "retrofit_fraction" => _openapi_value.retrofit_fraction)
    _openapi_value.retrofit_id isa Absent || push!(_openapi_output, "retrofit_id" => _openapi_value.retrofit_id)
    _openapi_value.retrofit_potential isa Absent || push!(_openapi_output, "retrofit_potential" => _openapi_value.retrofit_potential)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
