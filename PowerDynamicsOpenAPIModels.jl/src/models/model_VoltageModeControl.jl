"""
    VoltageModeControl

  - `id`: Unique integer identifier for this component
  - `kpv`: voltage controller proportional gain
  - `kiv`: voltage controller integral gain
  - `kffv`: Binary variable to enable feed-forward gain of voltage
  - `rv`: virtual resistance
  - `lv`: virtual inductance
  - `kpc`: current controller proportional gain
  - `kic`: current controller integral gain
  - `kffi`: Binary variable to enable feed-forward gain of current
  - `active_damping_filter_frequency`: Active damping filter cutoff frequency, in natural units. Units: Hz.
  - `kad`: active damping gain
"""
Base.@kwdef struct VoltageModeControl <: APIModel
    id::Int64
    kpv::Float64
    kiv::Float64
    kffv::Float64
    rv::Float64
    lv::Float64
    kpc::Float64
    kic::Float64
    kffi::Float64
    active_damping_filter_frequency::Float64
    kad::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{VoltageModeControl}, value) = _decode(VoltageModeControl, value, true)
function _decode(::Type{VoltageModeControl}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-30e43177d2634062fb48.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding VoltageModeControl";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "VoltageModeControl")
    _openapi_field_id =
        _decode_zoned(Int64, _required(_openapi_object, "id", "VoltageModeControl"), false)
    _openapi_field_kpv = _decode_zoned(
        Float64,
        _required(_openapi_object, "kpv", "VoltageModeControl"),
        false,
    )
    _openapi_field_kiv = _decode_zoned(
        Float64,
        _required(_openapi_object, "kiv", "VoltageModeControl"),
        false,
    )
    _openapi_field_kffv = _decode_zoned(
        Float64,
        _required(_openapi_object, "kffv", "VoltageModeControl"),
        false,
    )
    _openapi_field_rv = _decode_zoned(
        Float64,
        _required(_openapi_object, "rv", "VoltageModeControl"),
        false,
    )
    _openapi_field_lv = _decode_zoned(
        Float64,
        _required(_openapi_object, "lv", "VoltageModeControl"),
        false,
    )
    _openapi_field_kpc = _decode_zoned(
        Float64,
        _required(_openapi_object, "kpc", "VoltageModeControl"),
        false,
    )
    _openapi_field_kic = _decode_zoned(
        Float64,
        _required(_openapi_object, "kic", "VoltageModeControl"),
        false,
    )
    _openapi_field_kffi = _decode_zoned(
        Float64,
        _required(_openapi_object, "kffi", "VoltageModeControl"),
        false,
    )
    _openapi_field_active_damping_filter_frequency = _decode_zoned(
        Float64,
        _required(_openapi_object, "active_damping_filter_frequency", "VoltageModeControl"),
        false,
    )
    _openapi_field_kad = _decode_zoned(
        Float64,
        _required(_openapi_object, "kad", "VoltageModeControl"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "kpv",
            "kiv",
            "kffv",
            "rv",
            "lv",
            "kpc",
            "kic",
            "kffi",
            "active_damping_filter_frequency",
            "kad",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return VoltageModeControl(;
        id=_openapi_field_id,
        kpv=_openapi_field_kpv,
        kiv=_openapi_field_kiv,
        kffv=_openapi_field_kffv,
        rv=_openapi_field_rv,
        lv=_openapi_field_lv,
        kpc=_openapi_field_kpc,
        kic=_openapi_field_kic,
        kffi=_openapi_field_kffi,
        active_damping_filter_frequency=_openapi_field_active_damping_filter_frequency,
        kad=_openapi_field_kad,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::VoltageModeControl)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.kpv isa Absent ||
        (_openapi_output["kpv"] = _encode_unvalidated(_openapi_value.kpv))
    _openapi_value.kiv isa Absent ||
        (_openapi_output["kiv"] = _encode_unvalidated(_openapi_value.kiv))
    _openapi_value.kffv isa Absent ||
        (_openapi_output["kffv"] = _encode_unvalidated(_openapi_value.kffv))
    _openapi_value.rv isa Absent ||
        (_openapi_output["rv"] = _encode_unvalidated(_openapi_value.rv))
    _openapi_value.lv isa Absent ||
        (_openapi_output["lv"] = _encode_unvalidated(_openapi_value.lv))
    _openapi_value.kpc isa Absent ||
        (_openapi_output["kpc"] = _encode_unvalidated(_openapi_value.kpc))
    _openapi_value.kic isa Absent ||
        (_openapi_output["kic"] = _encode_unvalidated(_openapi_value.kic))
    _openapi_value.kffi isa Absent ||
        (_openapi_output["kffi"] = _encode_unvalidated(_openapi_value.kffi))
    _openapi_value.active_damping_filter_frequency isa Absent || (
        _openapi_output["active_damping_filter_frequency"] =
            _encode_unvalidated(_openapi_value.active_damping_filter_frequency)
    )
    _openapi_value.kad isa Absent ||
        (_openapi_output["kad"] = _encode_unvalidated(_openapi_value.kad))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(
            ArgumentError(
                "additional property conflicts with declared field: " * _openapi_key,
            ),
        )
        _openapi_output[_openapi_key] = _encode_unvalidated(_openapi_item)
    end
    return _openapi_output
end
_encode(_openapi_value::VoltageModeControl) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-30e43177d2634062fb48.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding VoltageModeControl";
    direction=:neutral,
)

function _form_fields(_openapi_value::VoltageModeControl)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.kpv isa Absent || push!(_openapi_output, "kpv" => _openapi_value.kpv)
    _openapi_value.kiv isa Absent || push!(_openapi_output, "kiv" => _openapi_value.kiv)
    _openapi_value.kffv isa Absent || push!(_openapi_output, "kffv" => _openapi_value.kffv)
    _openapi_value.rv isa Absent || push!(_openapi_output, "rv" => _openapi_value.rv)
    _openapi_value.lv isa Absent || push!(_openapi_output, "lv" => _openapi_value.lv)
    _openapi_value.kpc isa Absent || push!(_openapi_output, "kpc" => _openapi_value.kpc)
    _openapi_value.kic isa Absent || push!(_openapi_output, "kic" => _openapi_value.kic)
    _openapi_value.kffi isa Absent || push!(_openapi_output, "kffi" => _openapi_value.kffi)
    _openapi_value.active_damping_filter_frequency isa Absent || push!(
        _openapi_output,
        "active_damping_filter_frequency" =>
            _openapi_value.active_damping_filter_frequency,
    )
    _openapi_value.kad isa Absent || push!(_openapi_output, "kad" => _openapi_value.kad)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
