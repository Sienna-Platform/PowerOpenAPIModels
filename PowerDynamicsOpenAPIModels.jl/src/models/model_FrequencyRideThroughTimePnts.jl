"""
    FrequencyRideThroughTimePnts

The two time points `(tfrt1, tfrt2)` of a frequency ride-through characteristic.
"""
Base.@kwdef struct FrequencyRideThroughTimePnts <: APIModel
    tfrt1::Float64
    tfrt2::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{FrequencyRideThroughTimePnts}, value) =
    _decode(FrequencyRideThroughTimePnts, value, true)
function _decode(
    ::Type{FrequencyRideThroughTimePnts},
    _openapi_raw,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-1c4b7abd3c66ae6d8393.json",
            pointer="/\$defs/FrequencyRideThroughTimePnts",
        ),
        _openapi_raw,
        "decoding FrequencyRideThroughTimePnts";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "FrequencyRideThroughTimePnts")
    _openapi_field_tfrt1 = _decode_zoned(
        Float64,
        _required(_openapi_object, "tfrt1", "FrequencyRideThroughTimePnts"),
        false,
    )
    _openapi_field_tfrt2 = _decode_zoned(
        Float64,
        _required(_openapi_object, "tfrt2", "FrequencyRideThroughTimePnts"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("tfrt1", "tfrt2") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return FrequencyRideThroughTimePnts(;
        tfrt1=_openapi_field_tfrt1,
        tfrt2=_openapi_field_tfrt2,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::FrequencyRideThroughTimePnts)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.tfrt1 isa Absent ||
        (_openapi_output["tfrt1"] = _encode_unvalidated(_openapi_value.tfrt1))
    _openapi_value.tfrt2 isa Absent ||
        (_openapi_output["tfrt2"] = _encode_unvalidated(_openapi_value.tfrt2))
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
_encode(_openapi_value::FrequencyRideThroughTimePnts) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-1c4b7abd3c66ae6d8393.json",
        pointer="/\$defs/FrequencyRideThroughTimePnts",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding FrequencyRideThroughTimePnts";
    direction=:neutral,
)

function _form_fields(_openapi_value::FrequencyRideThroughTimePnts)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.tfrt1 isa Absent ||
        push!(_openapi_output, "tfrt1" => _openapi_value.tfrt1)
    _openapi_value.tfrt2 isa Absent ||
        push!(_openapi_output, "tfrt2" => _openapi_value.tfrt2)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
