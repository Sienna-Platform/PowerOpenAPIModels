"""
    ImpedanceCorrectionData

Supplemental attribute carrying one row of an impedance correction table, linked to a transformer. Exactly one correction curve is present, selected by `transformer_control_mode`: `tap_ratio_correction_curve` spans off-nominal turns ratio and `phase_angle_correction_curve` spans phase-shift angle. `transformer_winding` names the winding the row applies to.

  - `tap_ratio_correction_curve`: Impedance correction factor as a function of off-nominal tap ratio (x axis in tap ratio, y axis a multiplier on the winding impedance). Present only when `transformer_control_mode` is `TAP_RATIO`. Units: 1.
  - `phase_angle_correction_curve`: Impedance correction factor as a function of phase-shift angle (x axis in radians, y axis a multiplier on the winding impedance). Present only when `transformer_control_mode` is `PHASE_SHIFT_ANGLE`. Units: rad.
"""
Base.@kwdef struct ImpedanceCorrectionData <: APIModel
    id::Int64
    table_number::Int64
    tap_ratio_correction_curve::Union{Absent, PiecewiseLinearData, Nothing} = ABSENT
    phase_angle_correction_curve::Union{Absent, PiecewiseLinearData, Nothing} = ABSENT
    transformer_winding::ImpedanceCorrectionDataTransformerWinding
    transformer_control_mode::ImpedanceCorrectionDataTransformerControlMode
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ImpedanceCorrectionData}, value) =
    _decode(ImpedanceCorrectionData, value, true)
function _decode(::Type{ImpedanceCorrectionData}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-e26ecdf21236a2bd007d.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding ImpedanceCorrectionData";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ImpedanceCorrectionData")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "ImpedanceCorrectionData"), false)
    _openapi_field_table_number = _decode(
        Int64,
        _required(_openapi_object, "table_number", "ImpedanceCorrectionData"),
        false,
    )
    _openapi_field_tap_ratio_correction_curve =
        haskey(_openapi_object, "tap_ratio_correction_curve") ?
        _decode(
            Union{Absent, PiecewiseLinearData, Nothing},
            _openapi_object["tap_ratio_correction_curve"],
            false,
        ) : ABSENT
    _openapi_field_phase_angle_correction_curve =
        haskey(_openapi_object, "phase_angle_correction_curve") ?
        _decode(
            Union{Absent, PiecewiseLinearData, Nothing},
            _openapi_object["phase_angle_correction_curve"],
            false,
        ) : ABSENT
    _openapi_field_transformer_winding = _decode(
        ImpedanceCorrectionDataTransformerWinding,
        _required(_openapi_object, "transformer_winding", "ImpedanceCorrectionData"),
        false,
    )
    _openapi_field_transformer_control_mode = _decode(
        ImpedanceCorrectionDataTransformerControlMode,
        _required(_openapi_object, "transformer_control_mode", "ImpedanceCorrectionData"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "table_number",
            "tap_ratio_correction_curve",
            "phase_angle_correction_curve",
            "transformer_winding",
            "transformer_control_mode",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return ImpedanceCorrectionData(;
        id=_openapi_field_id,
        table_number=_openapi_field_table_number,
        tap_ratio_correction_curve=_openapi_field_tap_ratio_correction_curve,
        phase_angle_correction_curve=_openapi_field_phase_angle_correction_curve,
        transformer_winding=_openapi_field_transformer_winding,
        transformer_control_mode=_openapi_field_transformer_control_mode,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::ImpedanceCorrectionData)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.table_number isa Absent ||
        (_openapi_output["table_number"] = _encode_unvalidated(_openapi_value.table_number))
    _openapi_value.tap_ratio_correction_curve isa Absent || (
        _openapi_output["tap_ratio_correction_curve"] =
            _encode_unvalidated(_openapi_value.tap_ratio_correction_curve)
    )
    _openapi_value.phase_angle_correction_curve isa Absent || (
        _openapi_output["phase_angle_correction_curve"] =
            _encode_unvalidated(_openapi_value.phase_angle_correction_curve)
    )
    _openapi_value.transformer_winding isa Absent || (
        _openapi_output["transformer_winding"] =
            _encode_unvalidated(_openapi_value.transformer_winding)
    )
    _openapi_value.transformer_control_mode isa Absent || (
        _openapi_output["transformer_control_mode"] =
            _encode_unvalidated(_openapi_value.transformer_control_mode)
    )
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
_encode(_openapi_value::ImpedanceCorrectionData) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-e26ecdf21236a2bd007d.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding ImpedanceCorrectionData";
    direction=:neutral,
)

function _form_fields(_openapi_value::ImpedanceCorrectionData)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.table_number isa Absent ||
        push!(_openapi_output, "table_number" => _openapi_value.table_number)
    _openapi_value.tap_ratio_correction_curve isa Absent || push!(
        _openapi_output,
        "tap_ratio_correction_curve" => _openapi_value.tap_ratio_correction_curve,
    )
    _openapi_value.phase_angle_correction_curve isa Absent || push!(
        _openapi_output,
        "phase_angle_correction_curve" => _openapi_value.phase_angle_correction_curve,
    )
    _openapi_value.transformer_winding isa Absent ||
        push!(_openapi_output, "transformer_winding" => _openapi_value.transformer_winding)
    _openapi_value.transformer_control_mode isa Absent || push!(
        _openapi_output,
        "transformer_control_mode" => _openapi_value.transformer_control_mode,
    )
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
