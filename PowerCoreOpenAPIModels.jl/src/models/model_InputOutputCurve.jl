"""
    InputOutputCurve

A curve whose y values are the total input `f(x)` at production level `x` — currency per hour against MW in a cost curve, fuel per hour against MW in a fuel curve. The y axis is an absolute quantity, not a rate; use `IncrementalCurve` for marginal-rate data.

  - `input_at_zero`: Units: the curve's y-axis unit.
"""
Base.@kwdef struct InputOutputCurve <: APIModel
    curve_type::String = "INPUT_OUTPUT"
    function_data::InputOutputCurveFunctionData
    input_at_zero::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{InputOutputCurve}, value) = _decode(InputOutputCurve, value, true)
function _decode(::Type{InputOutputCurve}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/InputOutputCurve",
        ),
        _openapi_raw,
        "decoding InputOutputCurve";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "InputOutputCurve")
    _openapi_field_curve_type =
        _decode(String, _required(_openapi_object, "curve_type", "InputOutputCurve"), false)
    _openapi_field_function_data = _decode(
        InputOutputCurveFunctionData,
        _required(_openapi_object, "function_data", "InputOutputCurve"),
        false,
    )
    _openapi_field_input_at_zero =
        haskey(_openapi_object, "input_at_zero") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["input_at_zero"], false) :
        ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("curve_type", "function_data", "input_at_zero") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return InputOutputCurve(;
        curve_type=_openapi_field_curve_type,
        function_data=_openapi_field_function_data,
        input_at_zero=_openapi_field_input_at_zero,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::InputOutputCurve)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.curve_type isa Absent ||
        (_openapi_output["curve_type"] = _encode_unvalidated(_openapi_value.curve_type))
    _openapi_value.function_data isa Absent || (
        _openapi_output["function_data"] =
            _encode_unvalidated(_openapi_value.function_data)
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
_encode(_openapi_value::InputOutputCurve) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
        pointer="/\$defs/InputOutputCurve",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding InputOutputCurve";
    direction=:neutral,
)

function _form_fields(_openapi_value::InputOutputCurve)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.curve_type isa Absent ||
        push!(_openapi_output, "curve_type" => _openapi_value.curve_type)
    _openapi_value.function_data isa Absent ||
        push!(_openapi_output, "function_data" => _openapi_value.function_data)
    _openapi_value.input_at_zero isa Absent ||
        push!(_openapi_output, "input_at_zero" => _openapi_value.input_at_zero)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
