"""
    InstantaneousOutputCurrentLimiter

Parameters of Instantaneous (Square) Current Controller Limiter. Regulates inverter output current on the d and q axis separately

  - `id_max`: Maximum limit on d-axis current controller input current
  - `iq_max`: Maximum limit on q-axis current controller input current
"""
Base.@kwdef struct InstantaneousOutputCurrentLimiter <: APIModel
    id_max::Float64
    iq_max::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{InstantaneousOutputCurrentLimiter}, value) =
    _decode(InstantaneousOutputCurrentLimiter, value, true)
function _decode(
    ::Type{InstantaneousOutputCurrentLimiter},
    _openapi_raw,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-83719096b02c875b91f1.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding InstantaneousOutputCurrentLimiter";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "InstantaneousOutputCurrentLimiter")
    _openapi_field_id_max = _decode(
        Float64,
        _required(_openapi_object, "Id_max", "InstantaneousOutputCurrentLimiter"),
        _openapi_validate,
    )
    _openapi_field_iq_max = _decode(
        Float64,
        _required(_openapi_object, "Iq_max", "InstantaneousOutputCurrentLimiter"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("Id_max", "Iq_max") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return InstantaneousOutputCurrentLimiter(;
        id_max=_openapi_field_id_max,
        iq_max=_openapi_field_iq_max,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::InstantaneousOutputCurrentLimiter)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id_max isa Absent ||
        (_openapi_output["Id_max"] = _encode(_openapi_value.id_max))
    _openapi_value.iq_max isa Absent ||
        (_openapi_output["Iq_max"] = _encode(_openapi_value.iq_max))
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
            resource="https://openapi.invalid/schema/external-83719096b02c875b91f1.json",
            pointer="",
        ),
        _openapi_output,
        "encoding InstantaneousOutputCurrentLimiter";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::InstantaneousOutputCurrentLimiter)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id_max isa Absent ||
        push!(_openapi_output, "Id_max" => _openapi_value.id_max)
    _openapi_value.iq_max isa Absent ||
        push!(_openapi_output, "Iq_max" => _openapi_value.iq_max)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
