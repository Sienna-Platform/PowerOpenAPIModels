@doc "    Substation\n\nSupplemental attribute representing a substation that groups node buses and switching devices of a full-topology (node-breaker) network model. Attach the attribute to every member component. Geospatial data is not stored here; attach a GeographicInfo attribute to the member components instead.\n\n- `grounding_resistance`: Substation grounding DC resistance. Units: ohm.\n- `name`: Name of the substation\n- `number`: Substation number in the source power flow data"
Base.@kwdef struct Substation
    grounding_resistance::Float64
    id::Int64
    name::String
    number::Int64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{Substation}, value) = _decode(Substation, value, true)
function _decode(::Type{Substation}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/Substation"), _openapi_raw, "decoding Substation"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "Substation")
    _openapi_field_grounding_resistance = _decode(Float64, _required(_openapi_object, "grounding_resistance", "Substation"), _openapi_validate)
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "Substation"), _openapi_validate)
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "Substation"), _openapi_validate)
    _openapi_field_number = _decode(Int64, _required(_openapi_object, "number", "Substation"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("grounding_resistance","id","name","number") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return Substation(; grounding_resistance = _openapi_field_grounding_resistance, id = _openapi_field_id, name = _openapi_field_name, number = _openapi_field_number, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::Substation)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.grounding_resistance isa Absent || (_openapi_output["grounding_resistance"] = _encode(_openapi_value.grounding_resistance))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.number isa Absent || (_openapi_output["number"] = _encode(_openapi_value.number))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/Substation"), _openapi_output, "encoding Substation"; direction = :neutral)
end

function _form_fields(_openapi_value::Substation)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.grounding_resistance isa Absent || push!(_openapi_output, "grounding_resistance" => _openapi_value.grounding_resistance)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.number isa Absent || push!(_openapi_output, "number" => _openapi_value.number)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
