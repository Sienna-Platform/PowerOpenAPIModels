Base.@kwdef struct VoltageModeControl <: APIModel
    kpv::Float64
    kiv::Float64
    kffv::Float64
    rv::Float64
    lv::Float64
    kpc::Float64
    kic::Float64
    kffi::Float64
    omegaad::Float64
    kad::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{VoltageModeControl}, value) = _decode(VoltageModeControl, value, true)
function _decode(::Type{VoltageModeControl}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-4d609e37c07e8038e1c9.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding VoltageModeControl";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "VoltageModeControl")
    _openapi_field_kpv = _decode(
        Float64,
        _required(_openapi_object, "kpv", "VoltageModeControl"),
        _openapi_validate,
    )
    _openapi_field_kiv = _decode(
        Float64,
        _required(_openapi_object, "kiv", "VoltageModeControl"),
        _openapi_validate,
    )
    _openapi_field_kffv = _decode(
        Float64,
        _required(_openapi_object, "kffv", "VoltageModeControl"),
        _openapi_validate,
    )
    _openapi_field_rv = _decode(
        Float64,
        _required(_openapi_object, "rv", "VoltageModeControl"),
        _openapi_validate,
    )
    _openapi_field_lv = _decode(
        Float64,
        _required(_openapi_object, "lv", "VoltageModeControl"),
        _openapi_validate,
    )
    _openapi_field_kpc = _decode(
        Float64,
        _required(_openapi_object, "kpc", "VoltageModeControl"),
        _openapi_validate,
    )
    _openapi_field_kic = _decode(
        Float64,
        _required(_openapi_object, "kic", "VoltageModeControl"),
        _openapi_validate,
    )
    _openapi_field_kffi = _decode(
        Float64,
        _required(_openapi_object, "kffi", "VoltageModeControl"),
        _openapi_validate,
    )
    _openapi_field_omegaad = _decode(
        Float64,
        _required(_openapi_object, "omegaad", "VoltageModeControl"),
        _openapi_validate,
    )
    _openapi_field_kad = _decode(
        Float64,
        _required(_openapi_object, "kad", "VoltageModeControl"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in
        ("kpv", "kiv", "kffv", "rv", "lv", "kpc", "kic", "kffi", "omegaad", "kad") &&
            continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return VoltageModeControl(;
        kpv=_openapi_field_kpv,
        kiv=_openapi_field_kiv,
        kffv=_openapi_field_kffv,
        rv=_openapi_field_rv,
        lv=_openapi_field_lv,
        kpc=_openapi_field_kpc,
        kic=_openapi_field_kic,
        kffi=_openapi_field_kffi,
        omegaad=_openapi_field_omegaad,
        kad=_openapi_field_kad,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::VoltageModeControl)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.kpv isa Absent || (_openapi_output["kpv"] = _encode(_openapi_value.kpv))
    _openapi_value.kiv isa Absent || (_openapi_output["kiv"] = _encode(_openapi_value.kiv))
    _openapi_value.kffv isa Absent ||
        (_openapi_output["kffv"] = _encode(_openapi_value.kffv))
    _openapi_value.rv isa Absent || (_openapi_output["rv"] = _encode(_openapi_value.rv))
    _openapi_value.lv isa Absent || (_openapi_output["lv"] = _encode(_openapi_value.lv))
    _openapi_value.kpc isa Absent || (_openapi_output["kpc"] = _encode(_openapi_value.kpc))
    _openapi_value.kic isa Absent || (_openapi_output["kic"] = _encode(_openapi_value.kic))
    _openapi_value.kffi isa Absent ||
        (_openapi_output["kffi"] = _encode(_openapi_value.kffi))
    _openapi_value.omegaad isa Absent ||
        (_openapi_output["omegaad"] = _encode(_openapi_value.omegaad))
    _openapi_value.kad isa Absent || (_openapi_output["kad"] = _encode(_openapi_value.kad))
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
            resource="https://openapi.invalid/schema/external-4d609e37c07e8038e1c9.json",
            pointer="",
        ),
        _openapi_output,
        "encoding VoltageModeControl";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::VoltageModeControl)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.kpv isa Absent || push!(_openapi_output, "kpv" => _openapi_value.kpv)
    _openapi_value.kiv isa Absent || push!(_openapi_output, "kiv" => _openapi_value.kiv)
    _openapi_value.kffv isa Absent || push!(_openapi_output, "kffv" => _openapi_value.kffv)
    _openapi_value.rv isa Absent || push!(_openapi_output, "rv" => _openapi_value.rv)
    _openapi_value.lv isa Absent || push!(_openapi_output, "lv" => _openapi_value.lv)
    _openapi_value.kpc isa Absent || push!(_openapi_output, "kpc" => _openapi_value.kpc)
    _openapi_value.kic isa Absent || push!(_openapi_output, "kic" => _openapi_value.kic)
    _openapi_value.kffi isa Absent || push!(_openapi_output, "kffi" => _openapi_value.kffi)
    _openapi_value.omegaad isa Absent ||
        push!(_openapi_output, "omegaad" => _openapi_value.omegaad)
    _openapi_value.kad isa Absent || push!(_openapi_output, "kad" => _openapi_value.kad)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
