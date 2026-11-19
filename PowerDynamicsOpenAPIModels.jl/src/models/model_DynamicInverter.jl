"""
    DynamicInverter

Dynamic response model of a grid-connected inverter. It names its function blocks by id: a converter, an active and a reactive power control, an inner control, a DC source, a reference frame rotation (the frequency estimator), a filter, and an optional current limitation. It has no bus of its own: exactly one static injection device, with the same name, names it in its `dynamic_injector` property, and that device supplies the rest of the inverter's data.

  - `id`: Unique integer identifier for this component.
  - `name`: Name of the dynamic injection. Must equal the name of the static injection device that names it in `dynamic_injector`.
  - `frequency_ref`: Frequency reference set-point, in natural units. Usually equal to the system frequency. Units: Hz.
  - `converter`: ID of the Converter function block: the converter model.
  - `active_power_control`: ID of the ActivePowerControl function block: the outer active power control.
  - `reactive_power_control`: ID of the ReactivePowerControl function block: the outer reactive power control.
  - `inner_control`: ID of the InnerControl function block: the inner control model.
  - `dc_source`: ID of the DCSource function block: the DC source model.
  - `reference_frame_rotation`: ID of the ReferenceFrameRotation function block: the frequency estimator (PLL) model.
  - `filter`: ID of the Filter function block: the output filter model.
  - `current_limitation`: ID of the CurrentLimitation function block: the output current limiter model, or null when the inverter has no limiter.
  - `base_power`: Base power for the per-unit parameters of the referenced function blocks. Usually equal to the `base_power` of the static injection device that names this model. Units: MVA.
"""
Base.@kwdef struct DynamicInverter <: APIModel
    id::Int64
    name::String
    frequency_ref::Float64
    converter::Int64
    active_power_control::Int64
    reactive_power_control::Int64
    inner_control::Int64
    dc_source::Int64
    reference_frame_rotation::Int64
    filter::Int64
    current_limitation::Union{Absent, Union{Int64, Nothing}} = ABSENT
    base_power::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{DynamicInverter}, value) = _decode(DynamicInverter, value, true)
function _decode(::Type{DynamicInverter}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-21e5de67a8b4b8bf58da.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding DynamicInverter";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "DynamicInverter")
    _openapi_field_id =
        _decode_zoned(Int64, _required(_openapi_object, "id", "DynamicInverter"), false)
    _openapi_field_name =
        _decode_zoned(String, _required(_openapi_object, "name", "DynamicInverter"), false)
    _openapi_field_frequency_ref = _decode_zoned(
        Float64,
        _required(_openapi_object, "frequency_ref", "DynamicInverter"),
        false,
    )
    _openapi_field_converter = _decode_zoned(
        Int64,
        _required(_openapi_object, "converter", "DynamicInverter"),
        false,
    )
    _openapi_field_active_power_control = _decode_zoned(
        Int64,
        _required(_openapi_object, "active_power_control", "DynamicInverter"),
        false,
    )
    _openapi_field_reactive_power_control = _decode_zoned(
        Int64,
        _required(_openapi_object, "reactive_power_control", "DynamicInverter"),
        false,
    )
    _openapi_field_inner_control = _decode_zoned(
        Int64,
        _required(_openapi_object, "inner_control", "DynamicInverter"),
        false,
    )
    _openapi_field_dc_source = _decode_zoned(
        Int64,
        _required(_openapi_object, "dc_source", "DynamicInverter"),
        false,
    )
    _openapi_field_reference_frame_rotation = _decode_zoned(
        Int64,
        _required(_openapi_object, "reference_frame_rotation", "DynamicInverter"),
        false,
    )
    _openapi_field_filter =
        _decode_zoned(Int64, _required(_openapi_object, "filter", "DynamicInverter"), false)
    _openapi_field_current_limitation =
        haskey(_openapi_object, "current_limitation") ?
        _decode_zoned(
            Union{Absent, Union{Int64, Nothing}},
            _openapi_object["current_limitation"],
            false,
        ) : ABSENT
    _openapi_field_base_power = _decode_zoned(
        Float64,
        _required(_openapi_object, "base_power", "DynamicInverter"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "frequency_ref",
            "converter",
            "active_power_control",
            "reactive_power_control",
            "inner_control",
            "dc_source",
            "reference_frame_rotation",
            "filter",
            "current_limitation",
            "base_power",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return DynamicInverter(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        frequency_ref=_openapi_field_frequency_ref,
        converter=_openapi_field_converter,
        active_power_control=_openapi_field_active_power_control,
        reactive_power_control=_openapi_field_reactive_power_control,
        inner_control=_openapi_field_inner_control,
        dc_source=_openapi_field_dc_source,
        reference_frame_rotation=_openapi_field_reference_frame_rotation,
        filter=_openapi_field_filter,
        current_limitation=_openapi_field_current_limitation,
        base_power=_openapi_field_base_power,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::DynamicInverter)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode_unvalidated(_openapi_value.name))
    _openapi_value.frequency_ref isa Absent || (
        _openapi_output["frequency_ref"] =
            _encode_unvalidated(_openapi_value.frequency_ref)
    )
    _openapi_value.converter isa Absent ||
        (_openapi_output["converter"] = _encode_unvalidated(_openapi_value.converter))
    _openapi_value.active_power_control isa Absent || (
        _openapi_output["active_power_control"] =
            _encode_unvalidated(_openapi_value.active_power_control)
    )
    _openapi_value.reactive_power_control isa Absent || (
        _openapi_output["reactive_power_control"] =
            _encode_unvalidated(_openapi_value.reactive_power_control)
    )
    _openapi_value.inner_control isa Absent || (
        _openapi_output["inner_control"] =
            _encode_unvalidated(_openapi_value.inner_control)
    )
    _openapi_value.dc_source isa Absent ||
        (_openapi_output["dc_source"] = _encode_unvalidated(_openapi_value.dc_source))
    _openapi_value.reference_frame_rotation isa Absent || (
        _openapi_output["reference_frame_rotation"] =
            _encode_unvalidated(_openapi_value.reference_frame_rotation)
    )
    _openapi_value.filter isa Absent ||
        (_openapi_output["filter"] = _encode_unvalidated(_openapi_value.filter))
    _openapi_value.current_limitation isa Absent || (
        _openapi_output["current_limitation"] =
            _encode_unvalidated(_openapi_value.current_limitation)
    )
    _openapi_value.base_power isa Absent ||
        (_openapi_output["base_power"] = _encode_unvalidated(_openapi_value.base_power))
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
_encode(_openapi_value::DynamicInverter) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-21e5de67a8b4b8bf58da.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding DynamicInverter";
    direction=:neutral,
)

function _form_fields(_openapi_value::DynamicInverter)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.frequency_ref isa Absent ||
        push!(_openapi_output, "frequency_ref" => _openapi_value.frequency_ref)
    _openapi_value.converter isa Absent ||
        push!(_openapi_output, "converter" => _openapi_value.converter)
    _openapi_value.active_power_control isa Absent || push!(
        _openapi_output,
        "active_power_control" => _openapi_value.active_power_control,
    )
    _openapi_value.reactive_power_control isa Absent || push!(
        _openapi_output,
        "reactive_power_control" => _openapi_value.reactive_power_control,
    )
    _openapi_value.inner_control isa Absent ||
        push!(_openapi_output, "inner_control" => _openapi_value.inner_control)
    _openapi_value.dc_source isa Absent ||
        push!(_openapi_output, "dc_source" => _openapi_value.dc_source)
    _openapi_value.reference_frame_rotation isa Absent || push!(
        _openapi_output,
        "reference_frame_rotation" => _openapi_value.reference_frame_rotation,
    )
    _openapi_value.filter isa Absent ||
        push!(_openapi_output, "filter" => _openapi_value.filter)
    _openapi_value.current_limitation isa Absent ||
        push!(_openapi_output, "current_limitation" => _openapi_value.current_limitation)
    _openapi_value.base_power isa Absent ||
        push!(_openapi_output, "base_power" => _openapi_value.base_power)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
