"""
    VoltageRideThroughTimePnts

The three time points `(tvrt1, tvrt2, tvrt3)` of a voltage ride-through characteristic.
"""
Base.@kwdef struct VoltageRideThroughTimePnts <: APIModel
    tvrt1::Float64
    tvrt2::Float64
    tvrt3::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{VoltageRideThroughTimePnts}, value) =
    _decode(VoltageRideThroughTimePnts, value, true)
function _decode(::Type{VoltageRideThroughTimePnts}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-1c4b7abd3c66ae6d8393.json",
            pointer="/\$defs/VoltageRideThroughTimePnts",
        ),
        _openapi_raw,
        "decoding VoltageRideThroughTimePnts";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "VoltageRideThroughTimePnts")
    _openapi_field_tvrt1 = _decode_zoned(
        Float64,
        _required(_openapi_object, "tvrt1", "VoltageRideThroughTimePnts"),
        false,
    )
    _openapi_field_tvrt2 = _decode_zoned(
        Float64,
        _required(_openapi_object, "tvrt2", "VoltageRideThroughTimePnts"),
        false,
    )
    _openapi_field_tvrt3 = _decode_zoned(
        Float64,
        _required(_openapi_object, "tvrt3", "VoltageRideThroughTimePnts"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("tvrt1", "tvrt2", "tvrt3") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return VoltageRideThroughTimePnts(;
        tvrt1=_openapi_field_tvrt1,
        tvrt2=_openapi_field_tvrt2,
        tvrt3=_openapi_field_tvrt3,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::VoltageRideThroughTimePnts)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.tvrt1 isa Absent ||
        (_openapi_output["tvrt1"] = _encode_unvalidated(_openapi_value.tvrt1))
    _openapi_value.tvrt2 isa Absent ||
        (_openapi_output["tvrt2"] = _encode_unvalidated(_openapi_value.tvrt2))
    _openapi_value.tvrt3 isa Absent ||
        (_openapi_output["tvrt3"] = _encode_unvalidated(_openapi_value.tvrt3))
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
_encode(_openapi_value::VoltageRideThroughTimePnts) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-1c4b7abd3c66ae6d8393.json",
        pointer="/\$defs/VoltageRideThroughTimePnts",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding VoltageRideThroughTimePnts";
    direction=:neutral,
)

function _form_fields(_openapi_value::VoltageRideThroughTimePnts)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.tvrt1 isa Absent ||
        push!(_openapi_output, "tvrt1" => _openapi_value.tvrt1)
    _openapi_value.tvrt2 isa Absent ||
        push!(_openapi_output, "tvrt2" => _openapi_value.tvrt2)
    _openapi_value.tvrt3 isa Absent ||
        push!(_openapi_output, "tvrt3" => _openapi_value.tvrt3)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
