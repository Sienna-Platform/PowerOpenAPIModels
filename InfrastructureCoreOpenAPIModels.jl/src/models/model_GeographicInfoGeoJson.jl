Base.@kwdef struct GeographicInfoGeoJson
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{GeographicInfoGeoJson}, value) = _decode(GeographicInfoGeoJson, value, true)
function _decode(::Type{GeographicInfoGeoJson}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/GeographicInfo/properties/geo_json"), _openapi_raw, "decoding GeographicInfoGeoJson"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "GeographicInfoGeoJson")
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in () && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return GeographicInfoGeoJson(; additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::GeographicInfoGeoJson)
    _openapi_output = JSON.Object{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/GeographicInfo/properties/geo_json"), _openapi_output, "encoding GeographicInfoGeoJson"; direction = :neutral)
end

function _form_fields(_openapi_value::GeographicInfoGeoJson)
    _openapi_output = Pair{String,Any}[]
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
