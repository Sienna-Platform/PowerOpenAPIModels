@doc "    GeographicInfo\n\nSupplemental attribute carrying geographic information about a component as a GeoJSON object. An empty object is permitted and means no geographic information is recorded."
Base.@kwdef struct GeographicInfo
    geo_json::GeographicInfoGeoJson
    id::Int64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{GeographicInfo}, value) = _decode(GeographicInfo, value, true)
function _decode(::Type{GeographicInfo}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/GeographicInfo"), _openapi_raw, "decoding GeographicInfo"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "GeographicInfo")
    _openapi_field_geo_json = _decode(GeographicInfoGeoJson, _required(_openapi_object, "geo_json", "GeographicInfo"), _openapi_validate)
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "GeographicInfo"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("geo_json","id") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return GeographicInfo(; geo_json = _openapi_field_geo_json, id = _openapi_field_id, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::GeographicInfo)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.geo_json isa Absent || (_openapi_output["geo_json"] = _encode(_openapi_value.geo_json))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/GeographicInfo"), _openapi_output, "encoding GeographicInfo"; direction = :neutral)
end

function _form_fields(_openapi_value::GeographicInfo)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.geo_json isa Absent || push!(_openapi_output, "geo_json" => _openapi_value.geo_json)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
