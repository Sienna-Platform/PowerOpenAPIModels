"""
    AVRFixed

Parameters of a AVR that returns a fixed voltage to the rotor winding

  - `id`: Unique integer identifier for this component
  - `vf`: Fixed voltage field applied to the rotor winding
  - `v_ref`: Reference Voltage Set-point
"""
Base.@kwdef struct AVRFixed <: APIModel
    id::Int64
    vf::Float64
    v_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{AVRFixed}, value) = _decode(AVRFixed, value, true)
function _decode(::Type{AVRFixed}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-ecaad8518d47ace1ec07.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding AVRFixed";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "AVRFixed")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "AVRFixed"), _openapi_validate)
    _openapi_field_vf =
        _decode(Float64, _required(_openapi_object, "Vf", "AVRFixed"), _openapi_validate)
    _openapi_field_v_ref =
        haskey(_openapi_object, "V_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["V_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("id", "Vf", "V_ref") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return AVRFixed(;
        id=_openapi_field_id,
        vf=_openapi_field_vf,
        v_ref=_openapi_field_v_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::AVRFixed)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.vf isa Absent || (_openapi_output["Vf"] = _encode(_openapi_value.vf))
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
            resource="https://openapi.invalid/schema/external-ecaad8518d47ace1ec07.json",
            pointer="",
        ),
        _openapi_output,
        "encoding AVRFixed";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::AVRFixed)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.vf isa Absent || push!(_openapi_output, "Vf" => _openapi_value.vf)
    _openapi_value.v_ref isa Absent ||
        push!(_openapi_output, "V_ref" => _openapi_value.v_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
