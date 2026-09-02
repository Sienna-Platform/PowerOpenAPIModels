@doc "    TModelHVDCLineActivePowerLimitsFrom\n\nMinimum and maximum active power flows to the FROM node. Units: MW."
Base.@kwdef struct TModelHVDCLineActivePowerLimitsFrom
    max::Union{Absent,Float64,Nothing} = ABSENT
    min::Union{Absent,Float64,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{TModelHVDCLineActivePowerLimitsFrom}, value) = _decode(TModelHVDCLineActivePowerLimitsFrom, value, true)
function _decode(::Type{TModelHVDCLineActivePowerLimitsFrom}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TModelHVDCLine/properties/active_power_limits_from"), _openapi_raw, "decoding TModelHVDCLineActivePowerLimitsFrom"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "TModelHVDCLineActivePowerLimitsFrom")
    _openapi_field_max = haskey(_openapi_object, "max") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["max"], _openapi_validate) : ABSENT
    _openapi_field_min = haskey(_openapi_object, "min") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["min"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("max","min") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return TModelHVDCLineActivePowerLimitsFrom(; max = _openapi_field_max, min = _openapi_field_min, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::TModelHVDCLineActivePowerLimitsFrom)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.max isa Absent || (_openapi_output["max"] = _encode(_openapi_value.max))
    _openapi_value.min isa Absent || (_openapi_output["min"] = _encode(_openapi_value.min))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TModelHVDCLine/properties/active_power_limits_from"), _openapi_output, "encoding TModelHVDCLineActivePowerLimitsFrom"; direction = :neutral)
end

function _form_fields(_openapi_value::TModelHVDCLineActivePowerLimitsFrom)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.max isa Absent || push!(_openapi_output, "max" => _openapi_value.max)
    _openapi_value.min isa Absent || push!(_openapi_output, "min" => _openapi_value.min)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
