"""
    SaturationOutputCurrentLimiter

Parameters of Saturation Current Controller Limiter. Regulates the magnitude of the inverter output current, and applies a closed loop feedback regulated by a static gain which provides ant-windup

  - `i_max`: Maximum limit on current controller input current
  - `kw`: Defined feedback gain
"""
Base.@kwdef struct SaturationOutputCurrentLimiter <: APIModel
    i_max::Float64
    kw::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{SaturationOutputCurrentLimiter}, value) =
    _decode(SaturationOutputCurrentLimiter, value, true)
function _decode(
    ::Type{SaturationOutputCurrentLimiter},
    _openapi_raw,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-cbd81ef2d0681a699f07.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding SaturationOutputCurrentLimiter";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "SaturationOutputCurrentLimiter")
    _openapi_field_i_max = _decode(
        Float64,
        _required(_openapi_object, "I_max", "SaturationOutputCurrentLimiter"),
        _openapi_validate,
    )
    _openapi_field_kw = _decode(
        Float64,
        _required(_openapi_object, "kw", "SaturationOutputCurrentLimiter"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("I_max", "kw") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return SaturationOutputCurrentLimiter(;
        i_max=_openapi_field_i_max,
        kw=_openapi_field_kw,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::SaturationOutputCurrentLimiter)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.i_max isa Absent ||
        (_openapi_output["I_max"] = _encode(_openapi_value.i_max))
    _openapi_value.kw isa Absent || (_openapi_output["kw"] = _encode(_openapi_value.kw))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(
            ArgumentError(
                "additional property conflicts with declared field: " * _openapi_key,
            ),
        )
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-cbd81ef2d0681a699f07.json",
            pointer="",
        ),
        _openapi_output,
        "encoding SaturationOutputCurrentLimiter";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::SaturationOutputCurrentLimiter)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.i_max isa Absent ||
        push!(_openapi_output, "I_max" => _openapi_value.i_max)
    _openapi_value.kw isa Absent || push!(_openapi_output, "kw" => _openapi_value.kw)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
