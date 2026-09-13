struct InputOutputCurveFunctionData <: OneOfAPIModel
    value::Union{LinearFunctionData, PiecewiseLinearData, QuadraticFunctionData}
end
_decode(::Type{InputOutputCurveFunctionData}, value) =
    _decode(InputOutputCurveFunctionData, value, true)
function _decode(::Type{InputOutputCurveFunctionData}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/InputOutputCurve/properties/function_data",
        ),
        value,
        "decoding InputOutputCurveFunctionData";
        direction=:neutral,
    )
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
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for InputOutputCurveFunctionData",
            ),
        )
    return InputOutputCurveFunctionData(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::InputOutputCurveFunctionData)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/InputOutputCurve/properties/function_data",
        ),
        output,
        "encoding InputOutputCurveFunctionData";
        direction=:neutral,
    )
end
