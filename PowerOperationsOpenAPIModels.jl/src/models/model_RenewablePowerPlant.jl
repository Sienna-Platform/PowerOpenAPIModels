@doc "    RenewablePowerPlant\n\nAttribute to represent renewable power plants. Point of common coupling (PCC) connections between units are recorded as PlantAssociation rows with role='pcc'.\n\n- `name`: Name of the renewable power plant"
Base.@kwdef struct RenewablePowerPlant
    id::Int64
    name::String
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{RenewablePowerPlant}, value) = _decode(RenewablePowerPlant, value, true)
function _decode(::Type{RenewablePowerPlant}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/RenewablePowerPlant"), _openapi_raw, "decoding RenewablePowerPlant"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "RenewablePowerPlant")
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "RenewablePowerPlant"), _openapi_validate)
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "RenewablePowerPlant"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("id","name") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return RenewablePowerPlant(; id = _openapi_field_id, name = _openapi_field_name, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::RenewablePowerPlant)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/RenewablePowerPlant"), _openapi_output, "encoding RenewablePowerPlant"; direction = :neutral)
end

function _form_fields(_openapi_value::RenewablePowerPlant)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
