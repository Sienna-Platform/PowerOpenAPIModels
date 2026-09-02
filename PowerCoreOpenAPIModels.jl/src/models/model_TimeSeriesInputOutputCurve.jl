@doc "    TimeSeriesInputOutputCurve\n\nA time-series-backed input-output curve. The static counterpart is InputOutputCurve.\n\n- `function_data`: Only TIME_SERIES_LINEAR, TIME_SERIES_QUADRATIC, or TIME_SERIES_PIECEWISE_LINEAR is admissible here; the static variants and TIME_SERIES_PIECEWISE_STEP are invalid and rejected by the consuming constructor.\n- `input_at_zero`: Optional explicit input value at zero output. A number here, unlike the incremental and average-rate variants, where it is a time series reference."
Base.@kwdef struct TimeSeriesInputOutputCurve
    curve_type::String
    function_data::FunctionData
    input_at_zero::Union{Absent,Union{Float64,Nothing}} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{TimeSeriesInputOutputCurve}, value) = _decode(TimeSeriesInputOutputCurve, value, true)
function _decode(::Type{TimeSeriesInputOutputCurve}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/TimeSeriesInputOutputCurve"), _openapi_raw, "decoding TimeSeriesInputOutputCurve"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "TimeSeriesInputOutputCurve")
    _openapi_field_curve_type = _decode(String, _required(_openapi_object, "curve_type", "TimeSeriesInputOutputCurve"), _openapi_validate)
    _openapi_field_function_data = _decode(FunctionData, _required(_openapi_object, "function_data", "TimeSeriesInputOutputCurve"), _openapi_validate)
    _openapi_field_input_at_zero = haskey(_openapi_object, "input_at_zero") ? _decode(Union{Absent,Union{Float64,Nothing}}, _openapi_object["input_at_zero"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("curve_type","function_data","input_at_zero") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return TimeSeriesInputOutputCurve(; curve_type = _openapi_field_curve_type, function_data = _openapi_field_function_data, input_at_zero = _openapi_field_input_at_zero, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::TimeSeriesInputOutputCurve)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.curve_type isa Absent || (_openapi_output["curve_type"] = _encode(_openapi_value.curve_type))
    _openapi_value.function_data isa Absent || (_openapi_output["function_data"] = _encode(_openapi_value.function_data))
    _openapi_value.input_at_zero isa Absent || (_openapi_output["input_at_zero"] = _encode(_openapi_value.input_at_zero))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/TimeSeriesInputOutputCurve"), _openapi_output, "encoding TimeSeriesInputOutputCurve"; direction = :neutral)
end

function _form_fields(_openapi_value::TimeSeriesInputOutputCurve)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.curve_type isa Absent || push!(_openapi_output, "curve_type" => _openapi_value.curve_type)
    _openapi_value.function_data isa Absent || push!(_openapi_output, "function_data" => _openapi_value.function_data)
    _openapi_value.input_at_zero isa Absent || push!(_openapi_output, "input_at_zero" => _openapi_value.input_at_zero)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
