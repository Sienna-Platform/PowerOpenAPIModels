"""
    CurveMultiStep

Multi-step block indicator for a bid: 0 = SINGLE_STEP (default; each step of the bid clears independently); 1 = MULTI_STEP (the bid must be awarded as one block across every step it covers). Counted in model steps so it applies at any resolution. Independent of curve style: curve style is the quantity structure, this is the time structure, and they compose.
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
            resource="https://openapi.invalid/schema/external-e54f7e61a810bf45cca9.json",
            pointer="/\$defs/CurveMultiStep",
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
            resource="https://openapi.invalid/schema/external-e54f7e61a810bf45cca9.json",
            pointer="/\$defs/CurveMultiStep",
        ),
        output,
        "encoding CurveMultiStep";
        direction=:neutral,
    )
end
Base.string(value::CurveMultiStep) = string(value.value)
