@doc "    TimeSeriesIncrementalCurve\n\nA time-series-backed incremental curve. The static counterpart is IncrementalCurve.\n\n- `function_data`: Only TIME_SERIES_LINEAR or TIME_SERIES_PIECEWISE_STEP is admissible here; all other FunctionData variants, static or time-series-backed, are rejected by the consuming constructor.\n- `initial_input_association_id`: Store-minted id of the time series supplying the initial input value, or null.\n- `input_at_zero_association_id`: Store-minted id of the time series supplying the input at zero output, or null."
Base.@kwdef struct TimeSeriesIncrementalCurve
    curve_type::String
    function_data::FunctionData
    initial_input_association_id::Union{Absent,Union{Int64,Nothing}} = ABSENT
    input_at_zero_association_id::Union{Absent,Union{Int64,Nothing}} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{TimeSeriesIncrementalCurve}, value) = _decode(TimeSeriesIncrementalCurve, value, true)
function _decode(::Type{TimeSeriesIncrementalCurve}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/TimeSeriesIncrementalCurve"), _openapi_raw, "decoding TimeSeriesIncrementalCurve"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "TimeSeriesIncrementalCurve")
    _openapi_field_curve_type = _decode(String, _required(_openapi_object, "curve_type", "TimeSeriesIncrementalCurve"), _openapi_validate)
    _openapi_field_function_data = _decode(FunctionData, _required(_openapi_object, "function_data", "TimeSeriesIncrementalCurve"), _openapi_validate)
    _openapi_field_initial_input_association_id = haskey(_openapi_object, "initial_input_association_id") ? _decode(Union{Absent,Union{Int64,Nothing}}, _openapi_object["initial_input_association_id"], _openapi_validate) : ABSENT
    _openapi_field_input_at_zero_association_id = haskey(_openapi_object, "input_at_zero_association_id") ? _decode(Union{Absent,Union{Int64,Nothing}}, _openapi_object["input_at_zero_association_id"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("curve_type","function_data","initial_input_association_id","input_at_zero_association_id") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return TimeSeriesIncrementalCurve(; curve_type = _openapi_field_curve_type, function_data = _openapi_field_function_data, initial_input_association_id = _openapi_field_initial_input_association_id, input_at_zero_association_id = _openapi_field_input_at_zero_association_id, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::TimeSeriesIncrementalCurve)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.curve_type isa Absent || (_openapi_output["curve_type"] = _encode(_openapi_value.curve_type))
    _openapi_value.function_data isa Absent || (_openapi_output["function_data"] = _encode(_openapi_value.function_data))
    _openapi_value.initial_input_association_id isa Absent || (_openapi_output["initial_input_association_id"] = _encode(_openapi_value.initial_input_association_id))
    _openapi_value.input_at_zero_association_id isa Absent || (_openapi_output["input_at_zero_association_id"] = _encode(_openapi_value.input_at_zero_association_id))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/TimeSeriesIncrementalCurve"), _openapi_output, "encoding TimeSeriesIncrementalCurve"; direction = :neutral)
end

function _form_fields(_openapi_value::TimeSeriesIncrementalCurve)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.curve_type isa Absent || push!(_openapi_output, "curve_type" => _openapi_value.curve_type)
    _openapi_value.function_data isa Absent || push!(_openapi_output, "function_data" => _openapi_value.function_data)
    _openapi_value.initial_input_association_id isa Absent || push!(_openapi_output, "initial_input_association_id" => _openapi_value.initial_input_association_id)
    _openapi_value.input_at_zero_association_id isa Absent || push!(_openapi_output, "input_at_zero_association_id" => _openapi_value.input_at_zero_association_id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
