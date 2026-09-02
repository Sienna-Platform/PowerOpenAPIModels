@doc "    ThermalMultiStartRampLimits\n\nRamp up and ramp down limits. Units: per power_units — NATURAL_UNITS: MW/min, COMPONENT_BASE: pu/min ."
Base.@kwdef struct ThermalMultiStartRampLimits
    down::Float64
    up::Float64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{ThermalMultiStartRampLimits}, value) = _decode(ThermalMultiStartRampLimits, value, true)
function _decode(::Type{ThermalMultiStartRampLimits}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ThermalMultiStart/properties/ramp_limits"), _openapi_raw, "decoding ThermalMultiStartRampLimits"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "ThermalMultiStartRampLimits")
    _openapi_field_down = _decode(Float64, _required(_openapi_object, "down", "ThermalMultiStartRampLimits"), _openapi_validate)
    _openapi_field_up = _decode(Float64, _required(_openapi_object, "up", "ThermalMultiStartRampLimits"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("down","up") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return ThermalMultiStartRampLimits(; down = _openapi_field_down, up = _openapi_field_up, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::ThermalMultiStartRampLimits)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.down isa Absent || (_openapi_output["down"] = _encode(_openapi_value.down))
    _openapi_value.up isa Absent || (_openapi_output["up"] = _encode(_openapi_value.up))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ThermalMultiStart/properties/ramp_limits"), _openapi_output, "encoding ThermalMultiStartRampLimits"; direction = :neutral)
end

function _form_fields(_openapi_value::ThermalMultiStartRampLimits)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.down isa Absent || push!(_openapi_output, "down" => _openapi_value.down)
    _openapi_value.up isa Absent || push!(_openapi_output, "up" => _openapi_value.up)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
