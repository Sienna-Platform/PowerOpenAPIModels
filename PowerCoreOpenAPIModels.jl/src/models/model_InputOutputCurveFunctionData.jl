struct InputOutputCurveFunctionData <: OneOfAPIModel
    value::Union{LinearFunctionData, PiecewiseLinearData, QuadraticFunctionData}
end
_decode(::Type{InputOutputCurveFunctionData}, value) =
    _decode(InputOutputCurveFunctionData, value, true)
function _decode(::Type{InputOutputCurveFunctionData}, value, _openapi_validate::Bool)
    object = _object(value, "InputOutputCurveFunctionData")
    tag = get(object, "function_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(
            DecodeError(
                "discriminator value must be a string for InputOutputCurveFunctionData",
            ),
        )
    selected = get(
        Dict(
            "LINEAR" => (
                LinearFunctionData,
                (
                    resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
                    pointer="/\$defs/LinearFunctionData",
                ),
            ),
            "PIECEWISE_LINEAR" => (
                PiecewiseLinearData,
                (
                    resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
                    pointer="/\$defs/PiecewiseLinearData",
                ),
            ),
            "QUADRATIC" => (
                QuadraticFunctionData,
                (
                    resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
                    pointer="/\$defs/QuadraticFunctionData",
                ),
            ),
        ),
        tag isa Absent ? "" : String(tag),
        nothing,
    )
    selected === nothing && throw(
        DecodeError(
            "unknown discriminator value $(repr(tag)) for InputOutputCurveFunctionData",
        ),
    )
    _openapi_validate && _validate_schema(
        _SPEC,
        selected[2],
        value,
        "decoding InputOutputCurveFunctionData";
        direction=:neutral,
    )
    return InputOutputCurveFunctionData(_decode(selected[1], value, false))
end
function _encode_unvalidated(value::InputOutputCurveFunctionData)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::InputOutputCurveFunctionData) = _encode(value.value)
