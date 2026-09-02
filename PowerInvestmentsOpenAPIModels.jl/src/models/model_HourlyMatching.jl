@doc "    HourlyMatching\n\nPolicy requirement that the qualified demand-side technologies have their demand met by an equal amount of generation from qualified supply in every hour, such that `sum(P)_qualified_supply >= sum(D)_qualified_demand`.\n\n- `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`).\n- `id`: ID for individual component.\n- `name`: Name of the component."
Base.@kwdef struct HourlyMatching
    available::Bool
    id::Int64
    name::String
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{HourlyMatching}, value) = _decode(HourlyMatching, value, true)
function _decode(::Type{HourlyMatching}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/HourlyMatching"), _openapi_raw, "decoding HourlyMatching"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "HourlyMatching")
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "HourlyMatching"), _openapi_validate)
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "HourlyMatching"), _openapi_validate)
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "HourlyMatching"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("available","id","name") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return HourlyMatching(; available = _openapi_field_available, id = _openapi_field_id, name = _openapi_field_name, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::HourlyMatching)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/HourlyMatching"), _openapi_output, "encoding HourlyMatching"; direction = :neutral)
end

function _form_fields(_openapi_value::HourlyMatching)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
