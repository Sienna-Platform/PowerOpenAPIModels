@doc "    PlannedOutage\n\nSupplemental attribute describing outages that are scheduled in advance, naming the time series that carries the schedule.\n\n- `monitored_components`: IDs of devices whose post-contingency state should be modeled when this outage occurs. Empty by default; semantics of an empty list are decided by the downstream consumer."
Base.@kwdef struct PlannedOutage
    id::Int64
    monitored_components::Union{Absent,Nothing,Vector{Int64}} = ABSENT
    outage_schedule::String
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{PlannedOutage}, value) = _decode(PlannedOutage, value, true)
function _decode(::Type{PlannedOutage}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/PlannedOutage"), _openapi_raw, "decoding PlannedOutage"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "PlannedOutage")
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "PlannedOutage"), _openapi_validate)
    _openapi_field_monitored_components = haskey(_openapi_object, "monitored_components") ? _decode(Union{Absent,Nothing,Vector{Int64}}, _openapi_object["monitored_components"], _openapi_validate) : ABSENT
    _openapi_field_outage_schedule = _decode(String, _required(_openapi_object, "outage_schedule", "PlannedOutage"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("id","monitored_components","outage_schedule") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return PlannedOutage(; id = _openapi_field_id, monitored_components = _openapi_field_monitored_components, outage_schedule = _openapi_field_outage_schedule, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::PlannedOutage)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.monitored_components isa Absent || (_openapi_output["monitored_components"] = _encode(_openapi_value.monitored_components))
    _openapi_value.outage_schedule isa Absent || (_openapi_output["outage_schedule"] = _encode(_openapi_value.outage_schedule))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/PlannedOutage"), _openapi_output, "encoding PlannedOutage"; direction = :neutral)
end

function _form_fields(_openapi_value::PlannedOutage)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.monitored_components isa Absent || push!(_openapi_output, "monitored_components" => _openapi_value.monitored_components)
    _openapi_value.outage_schedule isa Absent || push!(_openapi_output, "outage_schedule" => _openapi_value.outage_schedule)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
