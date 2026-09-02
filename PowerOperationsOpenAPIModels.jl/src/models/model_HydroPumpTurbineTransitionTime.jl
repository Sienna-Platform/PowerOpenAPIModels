@doc "    HydroPumpTurbineTransitionTime\n\nTransition time to switch into the specific mode. Units: min."
Base.@kwdef struct HydroPumpTurbineTransitionTime
    pump::Float64
    turbine::Float64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{HydroPumpTurbineTransitionTime}, value) = _decode(HydroPumpTurbineTransitionTime, value, true)
function _decode(::Type{HydroPumpTurbineTransitionTime}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HydroPumpTurbine/properties/transition_time"), _openapi_raw, "decoding HydroPumpTurbineTransitionTime"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "HydroPumpTurbineTransitionTime")
    _openapi_field_pump = _decode(Float64, _required(_openapi_object, "pump", "HydroPumpTurbineTransitionTime"), _openapi_validate)
    _openapi_field_turbine = _decode(Float64, _required(_openapi_object, "turbine", "HydroPumpTurbineTransitionTime"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("pump","turbine") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return HydroPumpTurbineTransitionTime(; pump = _openapi_field_pump, turbine = _openapi_field_turbine, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::HydroPumpTurbineTransitionTime)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.pump isa Absent || (_openapi_output["pump"] = _encode(_openapi_value.pump))
    _openapi_value.turbine isa Absent || (_openapi_output["turbine"] = _encode(_openapi_value.turbine))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HydroPumpTurbine/properties/transition_time"), _openapi_output, "encoding HydroPumpTurbineTransitionTime"; direction = :neutral)
end

function _form_fields(_openapi_value::HydroPumpTurbineTransitionTime)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.pump isa Absent || push!(_openapi_output, "pump" => _openapi_value.pump)
    _openapi_value.turbine isa Absent || push!(_openapi_output, "turbine" => _openapi_value.turbine)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
