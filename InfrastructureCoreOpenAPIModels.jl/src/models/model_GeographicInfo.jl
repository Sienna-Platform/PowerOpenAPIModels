"""
    GeographicInfo

Supplemental attribute carrying geographic information about a component as a GeoJSON object. An empty object is permitted and means no geographic information is recorded.
"""
Base.@kwdef struct GeographicInfo <: APIModel
    id::Int64
    geo_json::GeographicInfoGeoJson
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{GeographicInfo}, value) = _decode(GeographicInfo, value, true)
function _decode(::Type{GeographicInfo}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-2aabf02bccc955bf88de.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding GeographicInfo";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "GeographicInfo")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "GeographicInfo"), false)
    _openapi_field_geo_json = _decode(
        GeographicInfoGeoJson,
        _required(_openapi_object, "geo_json", "GeographicInfo"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("id", "geo_json") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return GeographicInfo(;
        id=_openapi_field_id,
        geo_json=_openapi_field_geo_json,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::GeographicInfo)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.geo_json isa Absent ||
        (_openapi_output["geo_json"] = _encode_unvalidated(_openapi_value.geo_json))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(
            ArgumentError(
                "additional property conflicts with declared field: " * _openapi_key,
            ),
        )
        _openapi_output[_openapi_key] = _encode_unvalidated(_openapi_item)
    end
    return _openapi_output
end
_encode(_openapi_value::GeographicInfo) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-2aabf02bccc955bf88de.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding GeographicInfo";
    direction=:neutral,
)

function _form_fields(_openapi_value::GeographicInfo)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.geo_json isa Absent ||
        push!(_openapi_output, "geo_json" => _openapi_value.geo_json)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
