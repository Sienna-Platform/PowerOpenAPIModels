@doc "    MinimumCapacityRequirements\n\nPolicy requirement that the total capacity of all eligible technologies in the target year be greater than or equal to the specified minimum in MW.\n\n- `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`).\n- `id`: ID for individual component.\n- `min_capacity_mw`: Minimum total capacity across all eligible resources. Units: MW.\n- `name`: Name of the component.\n- `target_year`: Year in which this requirement is applied."
Base.@kwdef struct MinimumCapacityRequirements
    available::Bool
    id::Int64
    min_capacity_mw::Union{Absent,Float64,Nothing} = ABSENT
    name::String
    target_year::Union{Absent,Int64,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{MinimumCapacityRequirements}, value) = _decode(MinimumCapacityRequirements, value, true)
function _decode(::Type{MinimumCapacityRequirements}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/MinimumCapacityRequirements"), _openapi_raw, "decoding MinimumCapacityRequirements"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "MinimumCapacityRequirements")
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "MinimumCapacityRequirements"), _openapi_validate)
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "MinimumCapacityRequirements"), _openapi_validate)
    _openapi_field_min_capacity_mw = haskey(_openapi_object, "min_capacity_mw") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["min_capacity_mw"], _openapi_validate) : ABSENT
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "MinimumCapacityRequirements"), _openapi_validate)
    _openapi_field_target_year = haskey(_openapi_object, "target_year") ? _decode(Union{Absent,Int64,Nothing}, _openapi_object["target_year"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("available","id","min_capacity_mw","name","target_year") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return MinimumCapacityRequirements(; available = _openapi_field_available, id = _openapi_field_id, min_capacity_mw = _openapi_field_min_capacity_mw, name = _openapi_field_name, target_year = _openapi_field_target_year, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::MinimumCapacityRequirements)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.min_capacity_mw isa Absent || (_openapi_output["min_capacity_mw"] = _encode(_openapi_value.min_capacity_mw))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.target_year isa Absent || (_openapi_output["target_year"] = _encode(_openapi_value.target_year))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/MinimumCapacityRequirements"), _openapi_output, "encoding MinimumCapacityRequirements"; direction = :neutral)
end

function _form_fields(_openapi_value::MinimumCapacityRequirements)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.min_capacity_mw isa Absent || push!(_openapi_output, "min_capacity_mw" => _openapi_value.min_capacity_mw)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.target_year isa Absent || push!(_openapi_output, "target_year" => _openapi_value.target_year)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
