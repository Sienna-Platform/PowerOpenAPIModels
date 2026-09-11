"""
    CurveMultiStep

Multi-step block indicator for a bid: 0 = SINGLE_STEP (default; each step clears independently), 1 = MULTI_STEP (awarded as one block across every step). Independent of curve style, which is the quantity structure.
"""
struct CurveMultiStep <: EnumAPIModel
    value::Int64
    function CurveMultiStep(value::Int64)
        value in (0, 1) ||
            throw(ArgumentError("invalid CurveMultiStep value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{CurveMultiStep}, value) = _decode(CurveMultiStep, value, true)
function _decode(::Type{CurveMultiStep}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-73b8f5d70ab200b425bf.json",
            pointer="/components/schemas/CurveMultiStep",
        ),
        value,
        "decoding CurveMultiStep";
        direction=:neutral,
    )
    return CurveMultiStep(_decode(Int64, value, _openapi_validate))
end
function _encode(value::CurveMultiStep)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-73b8f5d70ab200b425bf.json",
            pointer="/components/schemas/CurveMultiStep",
        ),
        output,
        "encoding CurveMultiStep";
        direction=:neutral,
    )
end
Base.string(value::CurveMultiStep) = string(value.value)
