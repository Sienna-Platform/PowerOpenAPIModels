"""
    PriorityOutputCurrentLimiter

Parameters of Priority-Based Current Controller Limiter. Regulates the magnitude of the inverter output current and prioritizes a specific angle for the resultant current signal

  - `i_max`: Maximum limit on current controller input current
  - `phi_i`: Pre-defined angle (measured against the d-axis) for Iref once limit Imax is hit
"""
Base.@kwdef struct PriorityOutputCurrentLimiter <: APIModel
    i_max::Float64
    phi_i::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{PriorityOutputCurrentLimiter}, value) =
    _decode(PriorityOutputCurrentLimiter, value, true)
function _decode(
    ::Type{PriorityOutputCurrentLimiter},
    _openapi_raw,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-314f76dd32be8f535561.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding PriorityOutputCurrentLimiter";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "PriorityOutputCurrentLimiter")
    _openapi_field_i_max = _decode(
        Float64,
        _required(_openapi_object, "I_max", "PriorityOutputCurrentLimiter"),
        _openapi_validate,
    )
    _openapi_field_phi_i = _decode(
        Float64,
        _required(_openapi_object, "phi_I", "PriorityOutputCurrentLimiter"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("I_max", "phi_I") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return PriorityOutputCurrentLimiter(;
        i_max=_openapi_field_i_max,
        phi_i=_openapi_field_phi_i,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::PriorityOutputCurrentLimiter)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.i_max isa Absent ||
        (_openapi_output["I_max"] = _encode(_openapi_value.i_max))
    _openapi_value.phi_i isa Absent ||
        (_openapi_output["phi_I"] = _encode(_openapi_value.phi_i))
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
            resource="https://openapi.invalid/schema/external-314f76dd32be8f535561.json",
            pointer="",
        ),
        _openapi_output,
        "encoding PriorityOutputCurrentLimiter";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::PriorityOutputCurrentLimiter)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.i_max isa Absent ||
        push!(_openapi_output, "I_max" => _openapi_value.i_max)
    _openapi_value.phi_i isa Absent ||
        push!(_openapi_output, "phi_I" => _openapi_value.phi_i)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
