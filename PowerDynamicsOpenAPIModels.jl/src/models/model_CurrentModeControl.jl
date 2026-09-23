Base.@kwdef struct CurrentModeControl <: APIModel
    kpc::Float64
    kic::Float64
    kffv::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{CurrentModeControl}, value) = _decode(CurrentModeControl, value, true)
function _decode(::Type{CurrentModeControl}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-d4faa7f1838b2a281d42.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding CurrentModeControl";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "CurrentModeControl")
    _openapi_field_kpc = _decode(
        Float64,
        _required(_openapi_object, "kpc", "CurrentModeControl"),
        _openapi_validate,
    )
    _openapi_field_kic = _decode(
        Float64,
        _required(_openapi_object, "kic", "CurrentModeControl"),
        _openapi_validate,
    )
    _openapi_field_kffv = _decode(
        Float64,
        _required(_openapi_object, "kffv", "CurrentModeControl"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("kpc", "kic", "kffv") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return CurrentModeControl(;
        kpc=_openapi_field_kpc,
        kic=_openapi_field_kic,
        kffv=_openapi_field_kffv,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::CurrentModeControl)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.kpc isa Absent || (_openapi_output["kpc"] = _encode(_openapi_value.kpc))
    _openapi_value.kic isa Absent || (_openapi_output["kic"] = _encode(_openapi_value.kic))
    _openapi_value.kffv isa Absent ||
        (_openapi_output["kffv"] = _encode(_openapi_value.kffv))
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
            resource="https://openapi.invalid/schema/external-d4faa7f1838b2a281d42.json",
            pointer="",
        ),
        _openapi_output,
        "encoding CurrentModeControl";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::CurrentModeControl)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.kpc isa Absent || push!(_openapi_output, "kpc" => _openapi_value.kpc)
    _openapi_value.kic isa Absent || push!(_openapi_output, "kic" => _openapi_value.kic)
    _openapi_value.kffv isa Absent || push!(_openapi_output, "kffv" => _openapi_value.kffv)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
