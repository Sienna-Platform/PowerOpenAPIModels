"""
    AverageRateCurve

A curve whose y values are the average rate `f(x)/x` at production level `x` — total cost or fuel divided by output, the form heat rate tables use when they report MBTU/MWh against MW. `initial_input` records the total input at the minimum production point and is what makes conversion to an `InputOutputCurve` possible. Use `IncrementalCurve` when the data gives marginal rather than average rates.

  - `initial_input`: Units: the curve's y-axis unit.
  - `input_at_zero`: Units: the curve's y-axis unit.
"""
Base.@kwdef struct AverageRateCurve <: APIModel
    curve_type::String = "AVERAGE_RATE"
    function_data::AverageRateCurveFunctionData
    initial_input::Union{Absent, Float64, Nothing} = ABSENT
    input_at_zero::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{AverageRateCurve}, value) = _decode(AverageRateCurve, value, true)
function _decode(::Type{AverageRateCurve}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/AverageRateCurve",
        ),
        _openapi_raw,
        "decoding AverageRateCurve";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "AverageRateCurve")
    _openapi_field_curve_type =
        _decode(String, _required(_openapi_object, "curve_type", "AverageRateCurve"), false)
    _openapi_field_function_data = _decode(
        AverageRateCurveFunctionData,
        _required(_openapi_object, "function_data", "AverageRateCurve"),
        false,
    )
    _openapi_field_initial_input =
        haskey(_openapi_object, "initial_input") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["initial_input"], false) :
        ABSENT
    _openapi_field_input_at_zero =
        haskey(_openapi_object, "input_at_zero") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["input_at_zero"], false) :
        ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in
        ("curve_type", "function_data", "initial_input", "input_at_zero") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return AverageRateCurve(;
        curve_type=_openapi_field_curve_type,
        function_data=_openapi_field_function_data,
        initial_input=_openapi_field_initial_input,
        input_at_zero=_openapi_field_input_at_zero,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::AverageRateCurve)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.curve_type isa Absent ||
        (_openapi_output["curve_type"] = _encode_unvalidated(_openapi_value.curve_type))
    _openapi_value.function_data isa Absent || (
        _openapi_output["function_data"] =
            _encode_unvalidated(_openapi_value.function_data)
    )
    _openapi_value.initial_input isa Absent || (
        _openapi_output["initial_input"] =
            _encode_unvalidated(_openapi_value.initial_input)
    )
    _openapi_value.input_at_zero isa Absent || (
        _openapi_output["input_at_zero"] =
            _encode_unvalidated(_openapi_value.input_at_zero)
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
_encode(_openapi_value::AverageRateCurve) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
        pointer="/\$defs/AverageRateCurve",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding AverageRateCurve";
    direction=:neutral,
)

function _form_fields(_openapi_value::AverageRateCurve)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.curve_type isa Absent ||
        push!(_openapi_output, "curve_type" => _openapi_value.curve_type)
    _openapi_value.function_data isa Absent ||
        push!(_openapi_output, "function_data" => _openapi_value.function_data)
    _openapi_value.initial_input isa Absent ||
        push!(_openapi_output, "initial_input" => _openapi_value.initial_input)
    _openapi_value.input_at_zero isa Absent ||
        push!(_openapi_output, "input_at_zero" => _openapi_value.input_at_zero)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
