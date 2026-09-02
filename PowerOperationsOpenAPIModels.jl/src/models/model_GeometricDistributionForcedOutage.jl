@doc "    GeometricDistributionForcedOutage\n\nSupplemental attribute describing forced outages whose transitions follow geometric distributions, parameterized by the probability of entering an outage and the mean time to recovery. Both the outage and recovery probabilities can be backed by time series.\n\n- `mean_time_to_recovery`: Mean time elapsed between a failure and the return to service, in minutes. Units: min.\n- `monitored_components`: IDs of devices whose post-contingency state should be modeled when this outage occurs. Empty by default; semantics of an empty list are decided by the downstream consumer.\n- `outage_transition_probability`: Probability of transitioning into a forced outage in one minute, the same time step `mean_time_to_recovery` is stated in."
Base.@kwdef struct GeometricDistributionForcedOutage
    id::Int64
    mean_time_to_recovery::Union{Absent,Float64,Nothing} = ABSENT
    monitored_components::Union{Absent,Nothing,Vector{Int64}} = ABSENT
    outage_transition_probability::Union{Absent,Float64,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{GeometricDistributionForcedOutage}, value) = _decode(GeometricDistributionForcedOutage, value, true)
function _decode(::Type{GeometricDistributionForcedOutage}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/GeometricDistributionForcedOutage"), _openapi_raw, "decoding GeometricDistributionForcedOutage"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "GeometricDistributionForcedOutage")
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "GeometricDistributionForcedOutage"), _openapi_validate)
    _openapi_field_mean_time_to_recovery = haskey(_openapi_object, "mean_time_to_recovery") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["mean_time_to_recovery"], _openapi_validate) : ABSENT
    _openapi_field_monitored_components = haskey(_openapi_object, "monitored_components") ? _decode(Union{Absent,Nothing,Vector{Int64}}, _openapi_object["monitored_components"], _openapi_validate) : ABSENT
    _openapi_field_outage_transition_probability = haskey(_openapi_object, "outage_transition_probability") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["outage_transition_probability"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("id","mean_time_to_recovery","monitored_components","outage_transition_probability") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return GeometricDistributionForcedOutage(; id = _openapi_field_id, mean_time_to_recovery = _openapi_field_mean_time_to_recovery, monitored_components = _openapi_field_monitored_components, outage_transition_probability = _openapi_field_outage_transition_probability, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::GeometricDistributionForcedOutage)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.mean_time_to_recovery isa Absent || (_openapi_output["mean_time_to_recovery"] = _encode(_openapi_value.mean_time_to_recovery))
    _openapi_value.monitored_components isa Absent || (_openapi_output["monitored_components"] = _encode(_openapi_value.monitored_components))
    _openapi_value.outage_transition_probability isa Absent || (_openapi_output["outage_transition_probability"] = _encode(_openapi_value.outage_transition_probability))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/GeometricDistributionForcedOutage"), _openapi_output, "encoding GeometricDistributionForcedOutage"; direction = :neutral)
end

function _form_fields(_openapi_value::GeometricDistributionForcedOutage)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.mean_time_to_recovery isa Absent || push!(_openapi_output, "mean_time_to_recovery" => _openapi_value.mean_time_to_recovery)
    _openapi_value.monitored_components isa Absent || push!(_openapi_output, "monitored_components" => _openapi_value.monitored_components)
    _openapi_value.outage_transition_probability isa Absent || push!(_openapi_output, "outage_transition_probability" => _openapi_value.outage_transition_probability)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
