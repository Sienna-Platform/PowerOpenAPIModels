@doc "    StartUpShutDown\n\nA pair of values, one for the start-up phase and one for the shut-down phase of a unit's cycle."
Base.@kwdef struct StartUpShutDown
    shutdown::Union{Absent,Float64,Nothing} = ABSENT
    startup::Union{Absent,Float64,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{StartUpShutDown}, value) = _decode(StartUpShutDown, value, true)
function _decode(::Type{StartUpShutDown}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/StartUpShutDown"), _openapi_raw, "decoding StartUpShutDown"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "StartUpShutDown")
    _openapi_field_shutdown = haskey(_openapi_object, "shutdown") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["shutdown"], _openapi_validate) : ABSENT
    _openapi_field_startup = haskey(_openapi_object, "startup") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["startup"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("shutdown","startup") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return StartUpShutDown(; shutdown = _openapi_field_shutdown, startup = _openapi_field_startup, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::StartUpShutDown)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.shutdown isa Absent || (_openapi_output["shutdown"] = _encode(_openapi_value.shutdown))
    _openapi_value.startup isa Absent || (_openapi_output["startup"] = _encode(_openapi_value.startup))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/StartUpShutDown"), _openapi_output, "encoding StartUpShutDown"; direction = :neutral)
end

function _form_fields(_openapi_value::StartUpShutDown)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.shutdown isa Absent || push!(_openapi_output, "shutdown" => _openapi_value.shutdown)
    _openapi_value.startup isa Absent || push!(_openapi_output, "startup" => _openapi_value.startup)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
