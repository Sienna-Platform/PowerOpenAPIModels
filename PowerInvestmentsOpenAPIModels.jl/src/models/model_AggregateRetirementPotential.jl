@doc "    AggregateRetirementPotential\n\nSupplemental attribute defining a total amount of a technology's existing capacity that can be retired, as a quantity rather than a list of named units.\n\n- `id`: ID for individual component.\n- `retirement_potential`: Amount of pre-existing capacity for a technology that is eligible for retirement. Units: MW."
Base.@kwdef struct AggregateRetirementPotential
    id::Int64
    retirement_potential::Union{Absent,Float64,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{AggregateRetirementPotential}, value) = _decode(AggregateRetirementPotential, value, true)
function _decode(::Type{AggregateRetirementPotential}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/AggregateRetirementPotential"), _openapi_raw, "decoding AggregateRetirementPotential"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "AggregateRetirementPotential")
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "AggregateRetirementPotential"), _openapi_validate)
    _openapi_field_retirement_potential = haskey(_openapi_object, "retirement_potential") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["retirement_potential"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("id","retirement_potential") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return AggregateRetirementPotential(; id = _openapi_field_id, retirement_potential = _openapi_field_retirement_potential, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::AggregateRetirementPotential)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.retirement_potential isa Absent || (_openapi_output["retirement_potential"] = _encode(_openapi_value.retirement_potential))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/AggregateRetirementPotential"), _openapi_output, "encoding AggregateRetirementPotential"; direction = :neutral)
end

function _form_fields(_openapi_value::AggregateRetirementPotential)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.retirement_potential isa Absent || push!(_openapi_output, "retirement_potential" => _openapi_value.retirement_potential)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
