@doc "    SupplyTechnologyRampLimits\n\nMaximum decrease and increase in output between operation periods. Units: MW/min."
Base.@kwdef struct SupplyTechnologyRampLimits
    down::Float64
    up::Float64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{SupplyTechnologyRampLimits}, value) = _decode(SupplyTechnologyRampLimits, value, true)
function _decode(::Type{SupplyTechnologyRampLimits}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/SupplyTechnology/properties/ramp_limits"), _openapi_raw, "decoding SupplyTechnologyRampLimits"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "SupplyTechnologyRampLimits")
    _openapi_field_down = _decode(Float64, _required(_openapi_object, "down", "SupplyTechnologyRampLimits"), _openapi_validate)
    _openapi_field_up = _decode(Float64, _required(_openapi_object, "up", "SupplyTechnologyRampLimits"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("down","up") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return SupplyTechnologyRampLimits(; down = _openapi_field_down, up = _openapi_field_up, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::SupplyTechnologyRampLimits)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.down isa Absent || (_openapi_output["down"] = _encode(_openapi_value.down))
    _openapi_value.up isa Absent || (_openapi_output["up"] = _encode(_openapi_value.up))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/SupplyTechnology/properties/ramp_limits"), _openapi_output, "encoding SupplyTechnologyRampLimits"; direction = :neutral)
end

function _form_fields(_openapi_value::SupplyTechnologyRampLimits)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.down isa Absent || push!(_openapi_output, "down" => _openapi_value.down)
    _openapi_value.up isa Absent || push!(_openapi_output, "up" => _openapi_value.up)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
