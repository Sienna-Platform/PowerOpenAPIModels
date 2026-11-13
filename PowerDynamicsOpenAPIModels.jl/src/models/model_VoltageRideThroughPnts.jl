"""
    VoltageRideThroughPnts

The five voltage points `(vrt1, ..., vrt5)` of a voltage ride-through characteristic.
"""
Base.@kwdef struct VoltageRideThroughPnts <: APIModel
    vrt1::Float64
    vrt2::Float64
    vrt3::Float64
    vrt4::Float64
    vrt5::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{VoltageRideThroughPnts}, value) =
    _decode(VoltageRideThroughPnts, value, true)
function _decode(::Type{VoltageRideThroughPnts}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-1c4b7abd3c66ae6d8393.json",
            pointer="/\$defs/VoltageRideThroughPnts",
        ),
        _openapi_raw,
        "decoding VoltageRideThroughPnts";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "VoltageRideThroughPnts")
    _openapi_field_vrt1 = _decode_zoned(
        Float64,
        _required(_openapi_object, "vrt1", "VoltageRideThroughPnts"),
        false,
    )
    _openapi_field_vrt2 = _decode_zoned(
        Float64,
        _required(_openapi_object, "vrt2", "VoltageRideThroughPnts"),
        false,
    )
    _openapi_field_vrt3 = _decode_zoned(
        Float64,
        _required(_openapi_object, "vrt3", "VoltageRideThroughPnts"),
        false,
    )
    _openapi_field_vrt4 = _decode_zoned(
        Float64,
        _required(_openapi_object, "vrt4", "VoltageRideThroughPnts"),
        false,
    )
    _openapi_field_vrt5 = _decode_zoned(
        Float64,
        _required(_openapi_object, "vrt5", "VoltageRideThroughPnts"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("vrt1", "vrt2", "vrt3", "vrt4", "vrt5") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return VoltageRideThroughPnts(;
        vrt1=_openapi_field_vrt1,
        vrt2=_openapi_field_vrt2,
        vrt3=_openapi_field_vrt3,
        vrt4=_openapi_field_vrt4,
        vrt5=_openapi_field_vrt5,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::VoltageRideThroughPnts)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.vrt1 isa Absent ||
        (_openapi_output["vrt1"] = _encode_unvalidated(_openapi_value.vrt1))
    _openapi_value.vrt2 isa Absent ||
        (_openapi_output["vrt2"] = _encode_unvalidated(_openapi_value.vrt2))
    _openapi_value.vrt3 isa Absent ||
        (_openapi_output["vrt3"] = _encode_unvalidated(_openapi_value.vrt3))
    _openapi_value.vrt4 isa Absent ||
        (_openapi_output["vrt4"] = _encode_unvalidated(_openapi_value.vrt4))
    _openapi_value.vrt5 isa Absent ||
        (_openapi_output["vrt5"] = _encode_unvalidated(_openapi_value.vrt5))
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
_encode(_openapi_value::VoltageRideThroughPnts) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-1c4b7abd3c66ae6d8393.json",
        pointer="/\$defs/VoltageRideThroughPnts",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding VoltageRideThroughPnts";
    direction=:neutral,
)

function _form_fields(_openapi_value::VoltageRideThroughPnts)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.vrt1 isa Absent || push!(_openapi_output, "vrt1" => _openapi_value.vrt1)
    _openapi_value.vrt2 isa Absent || push!(_openapi_output, "vrt2" => _openapi_value.vrt2)
    _openapi_value.vrt3 isa Absent || push!(_openapi_output, "vrt3" => _openapi_value.vrt3)
    _openapi_value.vrt4 isa Absent || push!(_openapi_output, "vrt4" => _openapi_value.vrt4)
    _openapi_value.vrt5 isa Absent || push!(_openapi_output, "vrt5" => _openapi_value.vrt5)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
