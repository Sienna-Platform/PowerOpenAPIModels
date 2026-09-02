@doc "    IncrementalCurve\n\nA curve whose y values are the marginal rate `f'(x)` at production level `x` — the native form for market bid stacks and incremental heat rate data. `initial_input` records the total input at the minimum production point, anchoring the absolute level and enabling conversion to an `InputOutputCurve`. Use `InputOutputCurve` when the data gives total cost at each output level."
Base.@kwdef struct IncrementalCurve
    curve_type::String
    function_data::IncrementalCurveFunctionData
    initial_input::Union{Absent,Float64,Nothing} = ABSENT
    input_at_zero::Union{Absent,Float64,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{IncrementalCurve}, value) = _decode(IncrementalCurve, value, true)
function _decode(::Type{IncrementalCurve}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/IncrementalCurve"), _openapi_raw, "decoding IncrementalCurve"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "IncrementalCurve")
    _openapi_field_curve_type = _decode(String, _required(_openapi_object, "curve_type", "IncrementalCurve"), _openapi_validate)
    _openapi_field_function_data = _decode(IncrementalCurveFunctionData, _required(_openapi_object, "function_data", "IncrementalCurve"), _openapi_validate)
    _openapi_field_initial_input = haskey(_openapi_object, "initial_input") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["initial_input"], _openapi_validate) : ABSENT
    _openapi_field_input_at_zero = haskey(_openapi_object, "input_at_zero") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["input_at_zero"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("curve_type","function_data","initial_input","input_at_zero") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return IncrementalCurve(; curve_type = _openapi_field_curve_type, function_data = _openapi_field_function_data, initial_input = _openapi_field_initial_input, input_at_zero = _openapi_field_input_at_zero, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::IncrementalCurve)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.curve_type isa Absent || (_openapi_output["curve_type"] = _encode(_openapi_value.curve_type))
    _openapi_value.function_data isa Absent || (_openapi_output["function_data"] = _encode(_openapi_value.function_data))
    _openapi_value.initial_input isa Absent || (_openapi_output["initial_input"] = _encode(_openapi_value.initial_input))
    _openapi_value.input_at_zero isa Absent || (_openapi_output["input_at_zero"] = _encode(_openapi_value.input_at_zero))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/IncrementalCurve"), _openapi_output, "encoding IncrementalCurve"; direction = :neutral)
end

function _form_fields(_openapi_value::IncrementalCurve)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.curve_type isa Absent || push!(_openapi_output, "curve_type" => _openapi_value.curve_type)
    _openapi_value.function_data isa Absent || push!(_openapi_output, "function_data" => _openapi_value.function_data)
    _openapi_value.initial_input isa Absent || push!(_openapi_output, "initial_input" => _openapi_value.initial_input)
    _openapi_value.input_at_zero isa Absent || push!(_openapi_output, "input_at_zero" => _openapi_value.input_at_zero)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
