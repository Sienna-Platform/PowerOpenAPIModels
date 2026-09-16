Base.@kwdef struct ReactivePowerDroop <: APIModel
    kq::Float64
    omegaf::Float64
    v_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ReactivePowerDroop}, value) = _decode(ReactivePowerDroop, value, true)
function _decode(::Type{ReactivePowerDroop}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-ecb01eac823a8bb25214.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding ReactivePowerDroop";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ReactivePowerDroop")
    _openapi_field_kq = _decode(
        Float64,
        _required(_openapi_object, "kq", "ReactivePowerDroop"),
        _openapi_validate,
    )
    _openapi_field_omegaf = _decode(
        Float64,
        _required(_openapi_object, "omegaf", "ReactivePowerDroop"),
        _openapi_validate,
    )
    _openapi_field_v_ref =
        haskey(_openapi_object, "V_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["V_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("kq", "omegaf", "V_ref") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return ReactivePowerDroop(;
        kq=_openapi_field_kq,
        omegaf=_openapi_field_omegaf,
        v_ref=_openapi_field_v_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::ReactivePowerDroop)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.kq isa Absent || (_openapi_output["kq"] = _encode(_openapi_value.kq))
    _openapi_value.omegaf isa Absent ||
        (_openapi_output["omegaf"] = _encode(_openapi_value.omegaf))
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
            resource="https://openapi.invalid/schema/external-ecb01eac823a8bb25214.json",
            pointer="",
        ),
        _openapi_output,
        "encoding ReactivePowerDroop";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::ReactivePowerDroop)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.kq isa Absent || push!(_openapi_output, "kq" => _openapi_value.kq)
    _openapi_value.omegaf isa Absent ||
        push!(_openapi_output, "omegaf" => _openapi_value.omegaf)
    _openapi_value.v_ref isa Absent ||
        push!(_openapi_output, "V_ref" => _openapi_value.v_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
