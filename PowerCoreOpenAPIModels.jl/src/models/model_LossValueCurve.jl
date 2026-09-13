"""
    LossValueCurve

The shape of a loss curve, selected by `curve_type`. `INPUT_OUTPUT` gives the total loss at each flow level -- a constant loss plus a proportional loss rate, in MW of loss per MW of flow. `INCREMENTAL` gives the marginal loss rate instead, the form a piecewise model uses to give different proportional losses on different flow segments. Individual loss fields accept narrower sets of shapes than this union admits; the consuming data layer enforces that, not this schema.
"""
struct LossValueCurve <: OneOfAPIModel
    value::Union{IncrementalCurve, InputOutputCurve}
end
_decode(::Type{LossValueCurve}, value) = _decode(LossValueCurve, value, true)
function _decode(::Type{LossValueCurve}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/LossValueCurve",
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
                    resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
                    pointer="/\$defs/IncrementalCurve",
                ),
            ),
            "INPUT_OUTPUT" => (
                InputOutputCurve,
                (
                    resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
                    pointer="/\$defs/InputOutputCurve",
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
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/LossValueCurve",
        ),
        output,
        "encoding LossValueCurve";
        direction=:neutral,
    )
end
