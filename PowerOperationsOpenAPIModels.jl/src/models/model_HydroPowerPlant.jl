@doc "    HydroPowerPlant\n\nAttribute to represent hydro power plants. Shared penstocks between units are recorded as PlantAssociation rows with role='penstock'.\n\n- `name`: Name of the hydro power plant"
Base.@kwdef struct HydroPowerPlant
    id::Int64
    name::String
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{HydroPowerPlant}, value) = _decode(HydroPowerPlant, value, true)
function _decode(::Type{HydroPowerPlant}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HydroPowerPlant"), _openapi_raw, "decoding HydroPowerPlant"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "HydroPowerPlant")
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "HydroPowerPlant"), _openapi_validate)
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "HydroPowerPlant"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("id","name") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return HydroPowerPlant(; id = _openapi_field_id, name = _openapi_field_name, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::HydroPowerPlant)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HydroPowerPlant"), _openapi_output, "encoding HydroPowerPlant"; direction = :neutral)
end

function _form_fields(_openapi_value::HydroPowerPlant)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
