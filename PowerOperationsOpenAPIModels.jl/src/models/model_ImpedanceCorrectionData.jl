@doc "    ImpedanceCorrectionData\n\nSupplemental attribute carrying one row of an impedance correction table, linked to a transformer. The correction curve defines intervals over tap ratio or angle shift, and the accompanying fields name which winding the row applies to and whether the controlled quantity is an off-nominal turns ratio or a phase angle shift.\n\n- `impedance_correction_curve`: Data for a piecewise linear function defined by (x, y) points and interpolated linearly between consecutive ones. The y values are absolute values at each x, not per-segment slopes; use `PiecewiseStepData` when the data gives per-segment rates. Points run in ascending x order, and two of them define one segment."
Base.@kwdef struct ImpedanceCorrectionData
    id::Int64
    impedance_correction_curve::PiecewiseLinearData
    table_number::Int64
    transformer_control_mode::ImpedanceCorrectionDataTransformerControlMode
    transformer_winding::ImpedanceCorrectionDataTransformerWinding
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{ImpedanceCorrectionData}, value) = _decode(ImpedanceCorrectionData, value, true)
function _decode(::Type{ImpedanceCorrectionData}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ImpedanceCorrectionData"), _openapi_raw, "decoding ImpedanceCorrectionData"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "ImpedanceCorrectionData")
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "ImpedanceCorrectionData"), _openapi_validate)
    _openapi_field_impedance_correction_curve = _decode(PiecewiseLinearData, _required(_openapi_object, "impedance_correction_curve", "ImpedanceCorrectionData"), _openapi_validate)
    _openapi_field_table_number = _decode(Int64, _required(_openapi_object, "table_number", "ImpedanceCorrectionData"), _openapi_validate)
    _openapi_field_transformer_control_mode = _decode(ImpedanceCorrectionDataTransformerControlMode, _required(_openapi_object, "transformer_control_mode", "ImpedanceCorrectionData"), _openapi_validate)
    _openapi_field_transformer_winding = _decode(ImpedanceCorrectionDataTransformerWinding, _required(_openapi_object, "transformer_winding", "ImpedanceCorrectionData"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("id","impedance_correction_curve","table_number","transformer_control_mode","transformer_winding") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return ImpedanceCorrectionData(; id = _openapi_field_id, impedance_correction_curve = _openapi_field_impedance_correction_curve, table_number = _openapi_field_table_number, transformer_control_mode = _openapi_field_transformer_control_mode, transformer_winding = _openapi_field_transformer_winding, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::ImpedanceCorrectionData)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.impedance_correction_curve isa Absent || (_openapi_output["impedance_correction_curve"] = _encode(_openapi_value.impedance_correction_curve))
    _openapi_value.table_number isa Absent || (_openapi_output["table_number"] = _encode(_openapi_value.table_number))
    _openapi_value.transformer_control_mode isa Absent || (_openapi_output["transformer_control_mode"] = _encode(_openapi_value.transformer_control_mode))
    _openapi_value.transformer_winding isa Absent || (_openapi_output["transformer_winding"] = _encode(_openapi_value.transformer_winding))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ImpedanceCorrectionData"), _openapi_output, "encoding ImpedanceCorrectionData"; direction = :neutral)
end

function _form_fields(_openapi_value::ImpedanceCorrectionData)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.impedance_correction_curve isa Absent || push!(_openapi_output, "impedance_correction_curve" => _openapi_value.impedance_correction_curve)
    _openapi_value.table_number isa Absent || push!(_openapi_output, "table_number" => _openapi_value.table_number)
    _openapi_value.transformer_control_mode isa Absent || push!(_openapi_output, "transformer_control_mode" => _openapi_value.transformer_control_mode)
    _openapi_value.transformer_winding isa Absent || push!(_openapi_output, "transformer_winding" => _openapi_value.transformer_winding)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
