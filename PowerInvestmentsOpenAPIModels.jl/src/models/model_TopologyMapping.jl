@doc "    TopologyMapping\n\nSupplemental attribute storing the mapping between a zone and the associated buses in the base system.\n\n- `buses`: List of buses in the base system that are associated with a zone.\n- `id`: ID for individual component."
Base.@kwdef struct TopologyMapping
    buses::Union{Absent,Nothing,Vector{String}} = ABSENT
    id::Int64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{TopologyMapping}, value) = _decode(TopologyMapping, value, true)
function _decode(::Type{TopologyMapping}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/TopologyMapping"), _openapi_raw, "decoding TopologyMapping"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "TopologyMapping")
    _openapi_field_buses = haskey(_openapi_object, "buses") ? _decode(Union{Absent,Nothing,Vector{String}}, _openapi_object["buses"], _openapi_validate) : ABSENT
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "TopologyMapping"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("buses","id") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return TopologyMapping(; buses = _openapi_field_buses, id = _openapi_field_id, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::TopologyMapping)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.buses isa Absent || (_openapi_output["buses"] = _encode(_openapi_value.buses))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/TopologyMapping"), _openapi_output, "encoding TopologyMapping"; direction = :neutral)
end

function _form_fields(_openapi_value::TopologyMapping)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.buses isa Absent || push!(_openapi_output, "buses" => _openapi_value.buses)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
