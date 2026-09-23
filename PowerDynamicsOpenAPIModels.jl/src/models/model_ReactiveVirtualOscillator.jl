Base.@kwdef struct ReactiveVirtualOscillator <: APIModel
    k2::Float64
    v_ref::Union{Absent, Float64, Nothing} = ABSENT
    q_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ReactiveVirtualOscillator}, value) =
    _decode(ReactiveVirtualOscillator, value, true)
function _decode(::Type{ReactiveVirtualOscillator}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-5877dd058c6c0eff18ea.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding ReactiveVirtualOscillator";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ReactiveVirtualOscillator")
    _openapi_field_k2 = _decode(
        Float64,
        _required(_openapi_object, "k2", "ReactiveVirtualOscillator"),
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
        String(_openapi_key) in ("k2", "V_ref", "Q_ref") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return ReactiveVirtualOscillator(;
        k2=_openapi_field_k2,
        v_ref=_openapi_field_v_ref,
        q_ref=_openapi_field_q_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::ReactiveVirtualOscillator)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.k2 isa Absent || (_openapi_output["k2"] = _encode(_openapi_value.k2))
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
            resource="https://openapi.invalid/schema/external-5877dd058c6c0eff18ea.json",
            pointer="",
        ),
        _openapi_output,
        "encoding ReactiveVirtualOscillator";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::ReactiveVirtualOscillator)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.k2 isa Absent || push!(_openapi_output, "k2" => _openapi_value.k2)
    _openapi_value.v_ref isa Absent ||
        push!(_openapi_output, "V_ref" => _openapi_value.v_ref)
    _openapi_value.q_ref isa Absent ||
        push!(_openapi_output, "Q_ref" => _openapi_value.q_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
