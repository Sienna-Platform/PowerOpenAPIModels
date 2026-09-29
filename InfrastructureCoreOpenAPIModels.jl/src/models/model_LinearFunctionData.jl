"""
    LinearFunctionData

Data for a linear function `f(x) = proportional_term * x + constant_term`.

  - `constant_term`: Units: the wrapped function's output unit.
  - `proportional_term`: Units: the wrapped function's output unit per unit of its input.
"""
Base.@kwdef struct LinearFunctionData <: APIModel
    constant_term::Float64
    function_type::String = "LINEAR"
    proportional_term::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{LinearFunctionData}, value) = _decode(LinearFunctionData, value, true)
function _decode(::Type{LinearFunctionData}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-50d5243393bb9d77da58.json",
            pointer="/\$defs/LinearFunctionData",
        ),
        _openapi_raw,
        "decoding LinearFunctionData";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "LinearFunctionData")
    _openapi_field_constant_term = _decode(
        Float64,
        _required(_openapi_object, "constant_term", "LinearFunctionData"),
        false,
    )
    _openapi_field_function_type = _decode(
        String,
        _required(_openapi_object, "function_type", "LinearFunctionData"),
        false,
    )
    _openapi_field_proportional_term = _decode(
        Float64,
        _required(_openapi_object, "proportional_term", "LinearFunctionData"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("constant_term", "function_type", "proportional_term") &&
            continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return LinearFunctionData(;
        constant_term=_openapi_field_constant_term,
        function_type=_openapi_field_function_type,
        proportional_term=_openapi_field_proportional_term,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::LinearFunctionData)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.constant_term isa Absent || (
        _openapi_output["constant_term"] =
            _encode_unvalidated(_openapi_value.constant_term)
    )
    _openapi_value.function_type isa Absent || (
        _openapi_output["function_type"] =
            _encode_unvalidated(_openapi_value.function_type)
    )
    _openapi_value.proportional_term isa Absent || (
        _openapi_output["proportional_term"] =
            _encode_unvalidated(_openapi_value.proportional_term)
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
_encode(_openapi_value::LinearFunctionData) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-50d5243393bb9d77da58.json",
        pointer="/\$defs/LinearFunctionData",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding LinearFunctionData";
    direction=:neutral,
)

function _form_fields(_openapi_value::LinearFunctionData)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.constant_term isa Absent ||
        push!(_openapi_output, "constant_term" => _openapi_value.constant_term)
    _openapi_value.function_type isa Absent ||
        push!(_openapi_output, "function_type" => _openapi_value.function_type)
    _openapi_value.proportional_term isa Absent ||
        push!(_openapi_output, "proportional_term" => _openapi_value.proportional_term)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
