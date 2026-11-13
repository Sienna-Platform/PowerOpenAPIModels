"""
    FrequencyRideThroughPnts

The four frequency points `(frt1, ..., frt4)` of a frequency ride-through characteristic.
"""
Base.@kwdef struct FrequencyRideThroughPnts <: APIModel
    frt1::Float64
    frt2::Float64
    frt3::Float64
    frt4::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{FrequencyRideThroughPnts}, value) =
    _decode(FrequencyRideThroughPnts, value, true)
function _decode(::Type{FrequencyRideThroughPnts}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-1c4b7abd3c66ae6d8393.json",
            pointer="/\$defs/FrequencyRideThroughPnts",
        ),
        _openapi_raw,
        "decoding FrequencyRideThroughPnts";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "FrequencyRideThroughPnts")
    _openapi_field_frt1 = _decode_zoned(
        Float64,
        _required(_openapi_object, "frt1", "FrequencyRideThroughPnts"),
        false,
    )
    _openapi_field_frt2 = _decode_zoned(
        Float64,
        _required(_openapi_object, "frt2", "FrequencyRideThroughPnts"),
        false,
    )
    _openapi_field_frt3 = _decode_zoned(
        Float64,
        _required(_openapi_object, "frt3", "FrequencyRideThroughPnts"),
        false,
    )
    _openapi_field_frt4 = _decode_zoned(
        Float64,
        _required(_openapi_object, "frt4", "FrequencyRideThroughPnts"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("frt1", "frt2", "frt3", "frt4") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return FrequencyRideThroughPnts(;
        frt1=_openapi_field_frt1,
        frt2=_openapi_field_frt2,
        frt3=_openapi_field_frt3,
        frt4=_openapi_field_frt4,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::FrequencyRideThroughPnts)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.frt1 isa Absent ||
        (_openapi_output["frt1"] = _encode_unvalidated(_openapi_value.frt1))
    _openapi_value.frt2 isa Absent ||
        (_openapi_output["frt2"] = _encode_unvalidated(_openapi_value.frt2))
    _openapi_value.frt3 isa Absent ||
        (_openapi_output["frt3"] = _encode_unvalidated(_openapi_value.frt3))
    _openapi_value.frt4 isa Absent ||
        (_openapi_output["frt4"] = _encode_unvalidated(_openapi_value.frt4))
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
_encode(_openapi_value::FrequencyRideThroughPnts) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-1c4b7abd3c66ae6d8393.json",
        pointer="/\$defs/FrequencyRideThroughPnts",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding FrequencyRideThroughPnts";
    direction=:neutral,
)

function _form_fields(_openapi_value::FrequencyRideThroughPnts)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.frt1 isa Absent || push!(_openapi_output, "frt1" => _openapi_value.frt1)
    _openapi_value.frt2 isa Absent || push!(_openapi_output, "frt2" => _openapi_value.frt2)
    _openapi_value.frt3 isa Absent || push!(_openapi_output, "frt3" => _openapi_value.frt3)
    _openapi_value.frt4 isa Absent || push!(_openapi_output, "frt4" => _openapi_value.frt4)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
