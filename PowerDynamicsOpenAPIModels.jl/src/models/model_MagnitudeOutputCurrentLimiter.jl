"""
    MagnitudeOutputCurrentLimiter

Parameters of Magnitude (Circular) Current Controller Limiter. Regulates only the magnitude of the inverter output current

  - `i_max`: Maximum limit on current controller input current
"""
Base.@kwdef struct MagnitudeOutputCurrentLimiter <: APIModel
    i_max::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{MagnitudeOutputCurrentLimiter}, value) =
    _decode(MagnitudeOutputCurrentLimiter, value, true)
function _decode(
    ::Type{MagnitudeOutputCurrentLimiter},
    _openapi_raw,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-49453262fa3680887f88.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding MagnitudeOutputCurrentLimiter";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "MagnitudeOutputCurrentLimiter")
    _openapi_field_i_max = _decode(
        Float64,
        _required(_openapi_object, "I_max", "MagnitudeOutputCurrentLimiter"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("I_max",) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return MagnitudeOutputCurrentLimiter(;
        i_max=_openapi_field_i_max,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::MagnitudeOutputCurrentLimiter)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.i_max isa Absent ||
        (_openapi_output["I_max"] = _encode(_openapi_value.i_max))
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
            resource="https://openapi.invalid/schema/external-49453262fa3680887f88.json",
            pointer="",
        ),
        _openapi_output,
        "encoding MagnitudeOutputCurrentLimiter";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::MagnitudeOutputCurrentLimiter)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.i_max isa Absent ||
        push!(_openapi_output, "I_max" => _openapi_value.i_max)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
