"""
    ZeroOrderBESS

Parameters for the DC-side with a Battery Energy Storage System from 'Grid-Coupled Dynamic Response of Battery-Driven Voltage Source Converters'

  - `rated_voltage`: Rated voltage (V)
  - `rated_current`: Rated current (A)
  - `battery_voltage`: Battery voltage
  - `battery_resistance`: Rated current (A)
  - `dc_dc_inductor`: DC/DC inductance
  - `dc_link_capacitance`: DC-link capacitance
  - `fs`: DC/DC converter switching frequency
  - `kpv`: Voltage controller proportional gain
  - `kiv`: Voltage controller integral gain
  - `kpi`: Current controller proportional gain
  - `kii`: Current controller integral gain
  - `vdc_ref`: Reference DC-voltage set-point
"""
Base.@kwdef struct ZeroOrderBESS <: APIModel
    rated_voltage::Float64
    rated_current::Float64
    battery_voltage::Float64
    battery_resistance::Float64
    dc_dc_inductor::Float64
    dc_link_capacitance::Float64
    fs::Float64
    kpv::Float64
    kiv::Float64
    kpi::Float64
    kii::Float64
    vdc_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ZeroOrderBESS}, value) = _decode(ZeroOrderBESS, value, true)
function _decode(::Type{ZeroOrderBESS}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-5aa6f599f5623e217983.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding ZeroOrderBESS";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ZeroOrderBESS")
    _openapi_field_rated_voltage = _decode(
        Float64,
        _required(_openapi_object, "rated_voltage", "ZeroOrderBESS"),
        _openapi_validate,
    )
    _openapi_field_rated_current = _decode(
        Float64,
        _required(_openapi_object, "rated_current", "ZeroOrderBESS"),
        _openapi_validate,
    )
    _openapi_field_battery_voltage = _decode(
        Float64,
        _required(_openapi_object, "battery_voltage", "ZeroOrderBESS"),
        _openapi_validate,
    )
    _openapi_field_battery_resistance = _decode(
        Float64,
        _required(_openapi_object, "battery_resistance", "ZeroOrderBESS"),
        _openapi_validate,
    )
    _openapi_field_dc_dc_inductor = _decode(
        Float64,
        _required(_openapi_object, "dc_dc_inductor", "ZeroOrderBESS"),
        _openapi_validate,
    )
    _openapi_field_dc_link_capacitance = _decode(
        Float64,
        _required(_openapi_object, "dc_link_capacitance", "ZeroOrderBESS"),
        _openapi_validate,
    )
    _openapi_field_fs = _decode(
        Float64,
        _required(_openapi_object, "fs", "ZeroOrderBESS"),
        _openapi_validate,
    )
    _openapi_field_kpv = _decode(
        Float64,
        _required(_openapi_object, "kpv", "ZeroOrderBESS"),
        _openapi_validate,
    )
    _openapi_field_kiv = _decode(
        Float64,
        _required(_openapi_object, "kiv", "ZeroOrderBESS"),
        _openapi_validate,
    )
    _openapi_field_kpi = _decode(
        Float64,
        _required(_openapi_object, "kpi", "ZeroOrderBESS"),
        _openapi_validate,
    )
    _openapi_field_kii = _decode(
        Float64,
        _required(_openapi_object, "kii", "ZeroOrderBESS"),
        _openapi_validate,
    )
    _openapi_field_vdc_ref =
        haskey(_openapi_object, "Vdc_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["Vdc_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "rated_voltage",
            "rated_current",
            "battery_voltage",
            "battery_resistance",
            "dc_dc_inductor",
            "dc_link_capacitance",
            "fs",
            "kpv",
            "kiv",
            "kpi",
            "kii",
            "Vdc_ref",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return ZeroOrderBESS(;
        rated_voltage=_openapi_field_rated_voltage,
        rated_current=_openapi_field_rated_current,
        battery_voltage=_openapi_field_battery_voltage,
        battery_resistance=_openapi_field_battery_resistance,
        dc_dc_inductor=_openapi_field_dc_dc_inductor,
        dc_link_capacitance=_openapi_field_dc_link_capacitance,
        fs=_openapi_field_fs,
        kpv=_openapi_field_kpv,
        kiv=_openapi_field_kiv,
        kpi=_openapi_field_kpi,
        kii=_openapi_field_kii,
        vdc_ref=_openapi_field_vdc_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::ZeroOrderBESS)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.rated_voltage isa Absent ||
        (_openapi_output["rated_voltage"] = _encode(_openapi_value.rated_voltage))
    _openapi_value.rated_current isa Absent ||
        (_openapi_output["rated_current"] = _encode(_openapi_value.rated_current))
    _openapi_value.battery_voltage isa Absent ||
        (_openapi_output["battery_voltage"] = _encode(_openapi_value.battery_voltage))
    _openapi_value.battery_resistance isa Absent ||
        (_openapi_output["battery_resistance"] = _encode(_openapi_value.battery_resistance))
    _openapi_value.dc_dc_inductor isa Absent ||
        (_openapi_output["dc_dc_inductor"] = _encode(_openapi_value.dc_dc_inductor))
    _openapi_value.dc_link_capacitance isa Absent || (
        _openapi_output["dc_link_capacitance"] =
            _encode(_openapi_value.dc_link_capacitance)
    )
    _openapi_value.fs isa Absent || (_openapi_output["fs"] = _encode(_openapi_value.fs))
    _openapi_value.kpv isa Absent || (_openapi_output["kpv"] = _encode(_openapi_value.kpv))
    _openapi_value.kiv isa Absent || (_openapi_output["kiv"] = _encode(_openapi_value.kiv))
    _openapi_value.kpi isa Absent || (_openapi_output["kpi"] = _encode(_openapi_value.kpi))
    _openapi_value.kii isa Absent || (_openapi_output["kii"] = _encode(_openapi_value.kii))
    _openapi_value.vdc_ref isa Absent ||
        (_openapi_output["Vdc_ref"] = _encode(_openapi_value.vdc_ref))
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
            resource="https://openapi.invalid/schema/external-5aa6f599f5623e217983.json",
            pointer="",
        ),
        _openapi_output,
        "encoding ZeroOrderBESS";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::ZeroOrderBESS)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.rated_voltage isa Absent ||
        push!(_openapi_output, "rated_voltage" => _openapi_value.rated_voltage)
    _openapi_value.rated_current isa Absent ||
        push!(_openapi_output, "rated_current" => _openapi_value.rated_current)
    _openapi_value.battery_voltage isa Absent ||
        push!(_openapi_output, "battery_voltage" => _openapi_value.battery_voltage)
    _openapi_value.battery_resistance isa Absent ||
        push!(_openapi_output, "battery_resistance" => _openapi_value.battery_resistance)
    _openapi_value.dc_dc_inductor isa Absent ||
        push!(_openapi_output, "dc_dc_inductor" => _openapi_value.dc_dc_inductor)
    _openapi_value.dc_link_capacitance isa Absent ||
        push!(_openapi_output, "dc_link_capacitance" => _openapi_value.dc_link_capacitance)
    _openapi_value.fs isa Absent || push!(_openapi_output, "fs" => _openapi_value.fs)
    _openapi_value.kpv isa Absent || push!(_openapi_output, "kpv" => _openapi_value.kpv)
    _openapi_value.kiv isa Absent || push!(_openapi_output, "kiv" => _openapi_value.kiv)
    _openapi_value.kpi isa Absent || push!(_openapi_output, "kpi" => _openapi_value.kpi)
    _openapi_value.kii isa Absent || push!(_openapi_output, "kii" => _openapi_value.kii)
    _openapi_value.vdc_ref isa Absent ||
        push!(_openapi_output, "Vdc_ref" => _openapi_value.vdc_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
