"""
    AVRSimple

Parameters of a simple proportional AVR in the derivative of EMF i.e. an integrator controller on EMF

  - `id`: Unique integer identifier for this component
  - `kv`: Proportional Gain
  - `v_ref`: Reference Voltage Set-point
"""
Base.@kwdef struct AVRSimple <: APIModel
    id::Int64
    kv::Float64
    v_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{AVRSimple}, value) = _decode(AVRSimple, value, true)
function _decode(::Type{AVRSimple}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-ee4eb3773ab940b1b177.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding AVRSimple";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "AVRSimple")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "AVRSimple"), _openapi_validate)
    _openapi_field_kv =
        _decode(Float64, _required(_openapi_object, "Kv", "AVRSimple"), _openapi_validate)
    _openapi_field_v_ref =
        haskey(_openapi_object, "V_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["V_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("id", "Kv", "V_ref") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return AVRSimple(;
        id=_openapi_field_id,
        kv=_openapi_field_kv,
        v_ref=_openapi_field_v_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::AVRSimple)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.kv isa Absent || (_openapi_output["Kv"] = _encode(_openapi_value.kv))
    _openapi_value.v_ref isa Absent ||
        (_openapi_output["V_ref"] = _encode(_openapi_value.v_ref))
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
            resource="https://openapi.invalid/schema/external-ee4eb3773ab940b1b177.json",
            pointer="",
        ),
        _openapi_output,
        "encoding AVRSimple";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::AVRSimple)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.kv isa Absent || push!(_openapi_output, "Kv" => _openapi_value.kv)
    _openapi_value.v_ref isa Absent ||
        push!(_openapi_output, "V_ref" => _openapi_value.v_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
