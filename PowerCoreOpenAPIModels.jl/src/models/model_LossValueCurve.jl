"""
    LossValueCurve

Shape of a loss curve, selected by curve_type. INPUT_OUTPUT gives total loss at each flow level. INCREMENTAL gives the marginal loss rate. Individual loss fields may accept a narrower set of shapes than this union.
"""
struct LossValueCurve <: OneOfAPIModel
    value::Union{IncrementalCurve, InputOutputCurve}
end
_decode(::Type{LossValueCurve}, value) = _decode(LossValueCurve, value, true)
function _decode(::Type{LossValueCurve}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-73b8f5d70ab200b425bf.json",
            pointer="/components/schemas/LossValueCurve",
        ),
        value,
        "decoding LossValueCurve";
        direction=:neutral,
    )
    object = _object(value, "LossValueCurve")
    tag = get(object, "curve_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(DecodeError("discriminator value must be a string for LossValueCurve"))
    selected = get(
        Dict(
            "INCREMENTAL" => (
                IncrementalCurve,
                (
                    resource="https://openapi.invalid/schema/root-73b8f5d70ab200b425bf.json",
                    pointer="/components/schemas/IncrementalCurve",
                ),
            ),
            "INPUT_OUTPUT" => (
                InputOutputCurve,
                (
                    resource="https://openapi.invalid/schema/root-73b8f5d70ab200b425bf.json",
                    pointer="/components/schemas/InputOutputCurve",
                ),
            ),
            "IncrementalCurve" => (
                IncrementalCurve,
                (
                    resource="https://openapi.invalid/schema/root-73b8f5d70ab200b425bf.json",
                    pointer="/components/schemas/IncrementalCurve",
                ),
            ),
            "InputOutputCurve" => (
                InputOutputCurve,
                (
                    resource="https://openapi.invalid/schema/root-73b8f5d70ab200b425bf.json",
                    pointer="/components/schemas/InputOutputCurve",
                ),
            ),
        ),
        tag isa Absent ? "" : String(tag),
        nothing,
    )
    selected === nothing &&
        throw(DecodeError("unknown discriminator value $(repr(tag)) for LossValueCurve"))
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for LossValueCurve",
            ),
        )
    return LossValueCurve(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::LossValueCurve)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-73b8f5d70ab200b425bf.json",
            pointer="/components/schemas/LossValueCurve",
        ),
        output,
        "encoding LossValueCurve";
        direction=:neutral,
    )
end
