Base.@kwdef struct VirtualInertia <: APIModel
    ta::Float64
    kd::Float64
    komega::Float64
    p_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{VirtualInertia}, value) = _decode(VirtualInertia, value, true)
function _decode(::Type{VirtualInertia}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-1c07cc56c57f877e86fc.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding VirtualInertia";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "VirtualInertia")
    _openapi_field_ta = _decode(
        Float64,
        _required(_openapi_object, "Ta", "VirtualInertia"),
        _openapi_validate,
    )
    _openapi_field_kd = _decode(
        Float64,
        _required(_openapi_object, "kd", "VirtualInertia"),
        _openapi_validate,
    )
    _openapi_field_komega = _decode(
        Float64,
        _required(_openapi_object, "komega", "VirtualInertia"),
        _openapi_validate,
    )
    _openapi_field_p_ref =
        haskey(_openapi_object, "P_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["P_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("Ta", "kd", "komega", "P_ref") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return VirtualInertia(;
        ta=_openapi_field_ta,
        kd=_openapi_field_kd,
        komega=_openapi_field_komega,
        p_ref=_openapi_field_p_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::VirtualInertia)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.ta isa Absent || (_openapi_output["Ta"] = _encode(_openapi_value.ta))
    _openapi_value.kd isa Absent || (_openapi_output["kd"] = _encode(_openapi_value.kd))
    _openapi_value.komega isa Absent ||
        (_openapi_output["komega"] = _encode(_openapi_value.komega))
    _openapi_value.p_ref isa Absent ||
        (_openapi_output["P_ref"] = _encode(_openapi_value.p_ref))
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
            resource="https://openapi.invalid/schema/external-1c07cc56c57f877e86fc.json",
            pointer="",
        ),
        _openapi_output,
        "encoding VirtualInertia";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::VirtualInertia)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.ta isa Absent || push!(_openapi_output, "Ta" => _openapi_value.ta)
    _openapi_value.kd isa Absent || push!(_openapi_output, "kd" => _openapi_value.kd)
    _openapi_value.komega isa Absent ||
        push!(_openapi_output, "komega" => _openapi_value.komega)
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
