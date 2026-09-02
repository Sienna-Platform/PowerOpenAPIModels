@doc "    SupplyTechnologyCofireStartLimits\n\nMinimum and maximum blending level of each fuel during start-up process for multi-fuel generator. Units: 1."
Base.@kwdef struct SupplyTechnologyCofireStartLimits
    additional_properties::Dict{String,MinMax} = Dict{String,MinMax}()
end
_decode(::Type{SupplyTechnologyCofireStartLimits}, value) = _decode(SupplyTechnologyCofireStartLimits, value, true)
function _decode(::Type{SupplyTechnologyCofireStartLimits}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/SupplyTechnology/properties/cofire_start_limits"), _openapi_raw, "decoding SupplyTechnologyCofireStartLimits"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "SupplyTechnologyCofireStartLimits")
    _openapi_additional_properties = Dict{String,MinMax}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in () && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(MinMax, _openapi_item, _openapi_validate)
    end
    return SupplyTechnologyCofireStartLimits(; additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::SupplyTechnologyCofireStartLimits)
    _openapi_output = JSON.Object{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/SupplyTechnology/properties/cofire_start_limits"), _openapi_output, "encoding SupplyTechnologyCofireStartLimits"; direction = :neutral)
end

function _form_fields(_openapi_value::SupplyTechnologyCofireStartLimits)
    _openapi_output = Pair{String,Any}[]
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
