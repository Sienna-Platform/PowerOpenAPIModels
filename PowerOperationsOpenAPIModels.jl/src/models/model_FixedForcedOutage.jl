@doc "    FixedForcedOutage\n\nSupplemental attribute recording a component's forced outage status directly, rather than as a probability. `outage_status` is 1 when the component is outaged and 0 when it is available, and it can be backed by a time series drawn from a stochastic simulation or from historical records.\n\n- `monitored_components`: IDs of devices whose post-contingency state should be modeled when this outage occurs. Empty by default; semantics of an empty list are decided by the downstream consumer."
Base.@kwdef struct FixedForcedOutage
    id::Int64
    monitored_components::Union{Absent,Nothing,Vector{Int64}} = ABSENT
    outage_status::Float64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{FixedForcedOutage}, value) = _decode(FixedForcedOutage, value, true)
function _decode(::Type{FixedForcedOutage}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/FixedForcedOutage"), _openapi_raw, "decoding FixedForcedOutage"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "FixedForcedOutage")
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "FixedForcedOutage"), _openapi_validate)
    _openapi_field_monitored_components = haskey(_openapi_object, "monitored_components") ? _decode(Union{Absent,Nothing,Vector{Int64}}, _openapi_object["monitored_components"], _openapi_validate) : ABSENT
    _openapi_field_outage_status = _decode(Float64, _required(_openapi_object, "outage_status", "FixedForcedOutage"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("id","monitored_components","outage_status") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return FixedForcedOutage(; id = _openapi_field_id, monitored_components = _openapi_field_monitored_components, outage_status = _openapi_field_outage_status, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::FixedForcedOutage)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.monitored_components isa Absent || (_openapi_output["monitored_components"] = _encode(_openapi_value.monitored_components))
    _openapi_value.outage_status isa Absent || (_openapi_output["outage_status"] = _encode(_openapi_value.outage_status))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/FixedForcedOutage"), _openapi_output, "encoding FixedForcedOutage"; direction = :neutral)
end

function _form_fields(_openapi_value::FixedForcedOutage)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.monitored_components isa Absent || push!(_openapi_output, "monitored_components" => _openapi_value.monitored_components)
    _openapi_value.outage_status isa Absent || push!(_openapi_output, "outage_status" => _openapi_value.outage_status)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
