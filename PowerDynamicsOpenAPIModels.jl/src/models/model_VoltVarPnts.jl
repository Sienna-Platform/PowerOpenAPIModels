"""
    VoltVarPnts

The four voltage points `(V1, V2, V3, V4)` of a volt-var curve.
"""
Base.@kwdef struct VoltVarPnts <: APIModel
    v1::Float64
    v2::Float64
    v3::Float64
    v4::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{VoltVarPnts}, value) = _decode(VoltVarPnts, value, true)
function _decode(::Type{VoltVarPnts}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-1c4b7abd3c66ae6d8393.json",
            pointer="/\$defs/VoltVarPnts",
        ),
        _openapi_raw,
        "decoding VoltVarPnts";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "VoltVarPnts")
    _openapi_field_v1 =
        _decode_zoned(Float64, _required(_openapi_object, "V1", "VoltVarPnts"), false)
    _openapi_field_v2 =
        _decode_zoned(Float64, _required(_openapi_object, "V2", "VoltVarPnts"), false)
    _openapi_field_v3 =
        _decode_zoned(Float64, _required(_openapi_object, "V3", "VoltVarPnts"), false)
    _openapi_field_v4 =
        _decode_zoned(Float64, _required(_openapi_object, "V4", "VoltVarPnts"), false)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("V1", "V2", "V3", "V4") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return VoltVarPnts(;
        v1=_openapi_field_v1,
        v2=_openapi_field_v2,
        v3=_openapi_field_v3,
        v4=_openapi_field_v4,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::VoltVarPnts)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.v1 isa Absent ||
        (_openapi_output["V1"] = _encode_unvalidated(_openapi_value.v1))
    _openapi_value.v2 isa Absent ||
        (_openapi_output["V2"] = _encode_unvalidated(_openapi_value.v2))
    _openapi_value.v3 isa Absent ||
        (_openapi_output["V3"] = _encode_unvalidated(_openapi_value.v3))
    _openapi_value.v4 isa Absent ||
        (_openapi_output["V4"] = _encode_unvalidated(_openapi_value.v4))
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
_encode(_openapi_value::VoltVarPnts) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-1c4b7abd3c66ae6d8393.json",
        pointer="/\$defs/VoltVarPnts",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding VoltVarPnts";
    direction=:neutral,
)

function _form_fields(_openapi_value::VoltVarPnts)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.v1 isa Absent || push!(_openapi_output, "V1" => _openapi_value.v1)
    _openapi_value.v2 isa Absent || push!(_openapi_output, "V2" => _openapi_value.v2)
    _openapi_value.v3 isa Absent || push!(_openapi_output, "V3" => _openapi_value.v3)
    _openapi_value.v4 isa Absent || push!(_openapi_output, "V4" => _openapi_value.v4)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
