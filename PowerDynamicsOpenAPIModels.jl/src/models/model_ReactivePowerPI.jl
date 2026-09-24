Base.@kwdef struct ReactivePowerPI <: APIModel
    kp_q::Float64
    ki_q::Float64
    omegaf::Float64
    v_ref::Union{Absent, Float64, Nothing} = ABSENT
    q_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ReactivePowerPI}, value) = _decode(ReactivePowerPI, value, true)
function _decode(::Type{ReactivePowerPI}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-a1ec0a2b1cc7f385d635.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding ReactivePowerPI";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ReactivePowerPI")
    _openapi_field_kp_q = _decode(
        Float64,
        _required(_openapi_object, "Kp_q", "ReactivePowerPI"),
        _openapi_validate,
    )
    _openapi_field_ki_q = _decode(
        Float64,
        _required(_openapi_object, "Ki_q", "ReactivePowerPI"),
        _openapi_validate,
    )
    _openapi_field_omegaf = _decode(
        Float64,
        _required(_openapi_object, "omegaf", "ReactivePowerPI"),
        _openapi_validate,
    )
    _openapi_field_v_ref =
        haskey(_openapi_object, "V_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["V_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_q_ref =
        haskey(_openapi_object, "Q_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["Q_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("Kp_q", "Ki_q", "omegaf", "V_ref", "Q_ref") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return ReactivePowerPI(;
        kp_q=_openapi_field_kp_q,
        ki_q=_openapi_field_ki_q,
        omegaf=_openapi_field_omegaf,
        v_ref=_openapi_field_v_ref,
        q_ref=_openapi_field_q_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::ReactivePowerPI)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.kp_q isa Absent ||
        (_openapi_output["Kp_q"] = _encode(_openapi_value.kp_q))
    _openapi_value.ki_q isa Absent ||
        (_openapi_output["Ki_q"] = _encode(_openapi_value.ki_q))
    _openapi_value.omegaf isa Absent ||
        (_openapi_output["omegaf"] = _encode(_openapi_value.omegaf))
    _openapi_value.v_ref isa Absent ||
        (_openapi_output["V_ref"] = _encode(_openapi_value.v_ref))
    _openapi_value.q_ref isa Absent ||
        (_openapi_output["Q_ref"] = _encode(_openapi_value.q_ref))
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
            resource="https://openapi.invalid/schema/external-a1ec0a2b1cc7f385d635.json",
            pointer="",
        ),
        _openapi_output,
        "encoding ReactivePowerPI";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::ReactivePowerPI)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.kp_q isa Absent || push!(_openapi_output, "Kp_q" => _openapi_value.kp_q)
    _openapi_value.ki_q isa Absent || push!(_openapi_output, "Ki_q" => _openapi_value.ki_q)
    _openapi_value.omegaf isa Absent ||
        push!(_openapi_output, "omegaf" => _openapi_value.omegaf)
    _openapi_value.v_ref isa Absent ||
        push!(_openapi_output, "V_ref" => _openapi_value.v_ref)
    _openapi_value.q_ref isa Absent ||
        push!(_openapi_output, "Q_ref" => _openapi_value.q_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
