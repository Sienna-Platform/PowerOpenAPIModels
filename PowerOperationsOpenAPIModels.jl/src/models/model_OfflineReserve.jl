@doc "    OfflineReserve\n\nA non-spinning reserve product from devices not currently synchronized with the system but able to come online quickly after an unexpected contingency. Upward only, so unlike `OnlineReserve` there is no reserve direction. The procurement requirement is static unless a `requirement` time series is attached, in which case `requirement` is the scaling factor.\n\n- `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.\n- `deployed_fraction`: Fraction of service procurement that is assumed to be actually deployed. Most commonly, this is assumed to be either 0.0 or 1.0.\n- `id`: Unique integer identifier for this component.\n- `max_output_fraction`: The maximum fraction of each device's output that can be assigned to the service.\n- `max_participation_factor`: The maximum portion [0, 1.0] of the reserve that can be contributed per device.\n- `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.\n- `requirement`: The value of required reserves. Units: MW.\n- `sustained_time`: The time reserve contribution must be sustained at a specified level. Units: min.\n- `time_frame`: The saturation time frame to provide reserve contribution. Units: min.\n- `variable`: Operating reserve demand curve, either static or time-series-backed. Time series values are carried via `time_series_associations` in the sidecar, never inline. Omit when the reserve has no demand curve."
Base.@kwdef struct OfflineReserve
    available::Bool
    deployed_fraction::Union{Absent,Float64,Nothing} = ABSENT
    id::Int64
    max_output_fraction::Union{Absent,Float64,Nothing} = ABSENT
    max_participation_factor::Union{Absent,Float64,Nothing} = ABSENT
    name::String
    requirement::Union{Absent,Float64,Nothing} = ABSENT
    sustained_time::Union{Absent,Float64,Nothing} = ABSENT
    time_frame::Float64
    variable::Union{Absent,Nothing,OfflineReserveVariable} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{OfflineReserve}, value) = _decode(OfflineReserve, value, true)
function _decode(::Type{OfflineReserve}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/OfflineReserve"), _openapi_raw, "decoding OfflineReserve"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "OfflineReserve")
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "OfflineReserve"), _openapi_validate)
    _openapi_field_deployed_fraction = haskey(_openapi_object, "deployed_fraction") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["deployed_fraction"], _openapi_validate) : ABSENT
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "OfflineReserve"), _openapi_validate)
    _openapi_field_max_output_fraction = haskey(_openapi_object, "max_output_fraction") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["max_output_fraction"], _openapi_validate) : ABSENT
    _openapi_field_max_participation_factor = haskey(_openapi_object, "max_participation_factor") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["max_participation_factor"], _openapi_validate) : ABSENT
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "OfflineReserve"), _openapi_validate)
    _openapi_field_requirement = haskey(_openapi_object, "requirement") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["requirement"], _openapi_validate) : ABSENT
    _openapi_field_sustained_time = haskey(_openapi_object, "sustained_time") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["sustained_time"], _openapi_validate) : ABSENT
    _openapi_field_time_frame = _decode(Float64, _required(_openapi_object, "time_frame", "OfflineReserve"), _openapi_validate)
    _openapi_field_variable = haskey(_openapi_object, "variable") ? _decode(Union{Absent,Nothing,OfflineReserveVariable}, _openapi_object["variable"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("available","deployed_fraction","id","max_output_fraction","max_participation_factor","name","requirement","sustained_time","time_frame","variable") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return OfflineReserve(; available = _openapi_field_available, deployed_fraction = _openapi_field_deployed_fraction, id = _openapi_field_id, max_output_fraction = _openapi_field_max_output_fraction, max_participation_factor = _openapi_field_max_participation_factor, name = _openapi_field_name, requirement = _openapi_field_requirement, sustained_time = _openapi_field_sustained_time, time_frame = _openapi_field_time_frame, variable = _openapi_field_variable, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::OfflineReserve)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.deployed_fraction isa Absent || (_openapi_output["deployed_fraction"] = _encode(_openapi_value.deployed_fraction))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.max_output_fraction isa Absent || (_openapi_output["max_output_fraction"] = _encode(_openapi_value.max_output_fraction))
    _openapi_value.max_participation_factor isa Absent || (_openapi_output["max_participation_factor"] = _encode(_openapi_value.max_participation_factor))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.requirement isa Absent || (_openapi_output["requirement"] = _encode(_openapi_value.requirement))
    _openapi_value.sustained_time isa Absent || (_openapi_output["sustained_time"] = _encode(_openapi_value.sustained_time))
    _openapi_value.time_frame isa Absent || (_openapi_output["time_frame"] = _encode(_openapi_value.time_frame))
    _openapi_value.variable isa Absent || (_openapi_output["variable"] = _encode(_openapi_value.variable))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/OfflineReserve"), _openapi_output, "encoding OfflineReserve"; direction = :neutral)
end

function _form_fields(_openapi_value::OfflineReserve)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.deployed_fraction isa Absent || push!(_openapi_output, "deployed_fraction" => _openapi_value.deployed_fraction)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.max_output_fraction isa Absent || push!(_openapi_output, "max_output_fraction" => _openapi_value.max_output_fraction)
    _openapi_value.max_participation_factor isa Absent || push!(_openapi_output, "max_participation_factor" => _openapi_value.max_participation_factor)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.requirement isa Absent || push!(_openapi_output, "requirement" => _openapi_value.requirement)
    _openapi_value.sustained_time isa Absent || push!(_openapi_output, "sustained_time" => _openapi_value.sustained_time)
    _openapi_value.time_frame isa Absent || push!(_openapi_output, "time_frame" => _openapi_value.time_frame)
    _openapi_value.variable isa Absent || push!(_openapi_output, "variable" => _openapi_value.variable)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
