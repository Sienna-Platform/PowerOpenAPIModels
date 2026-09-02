@doc "    Arc\n\nA topological directed edge connecting two buses. Arcs are used to define the `from_id` and `to_id` endpoints when defining a line or transformer.\n\n- `from_id`: ID of the initial bus.\n- `id`: Unique integer identifier for this component.\n- `to_id`: ID of the terminal bus."
Base.@kwdef struct Arc
    from_id::Int64
    id::Int64
    to_id::Int64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{Arc}, value) = _decode(Arc, value, true)
function _decode(::Type{Arc}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/Arc"), _openapi_raw, "decoding Arc"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "Arc")
    _openapi_field_from_id = _decode(Int64, _required(_openapi_object, "from_id", "Arc"), _openapi_validate)
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "Arc"), _openapi_validate)
    _openapi_field_to_id = _decode(Int64, _required(_openapi_object, "to_id", "Arc"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("from_id","id","to_id") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return Arc(; from_id = _openapi_field_from_id, id = _openapi_field_id, to_id = _openapi_field_to_id, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::Arc)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.from_id isa Absent || (_openapi_output["from_id"] = _encode(_openapi_value.from_id))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.to_id isa Absent || (_openapi_output["to_id"] = _encode(_openapi_value.to_id))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/Arc"), _openapi_output, "encoding Arc"; direction = :neutral)
end

function _form_fields(_openapi_value::Arc)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.from_id isa Absent || push!(_openapi_output, "from_id" => _openapi_value.from_id)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.to_id isa Absent || push!(_openapi_output, "to_id" => _openapi_value.to_id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
