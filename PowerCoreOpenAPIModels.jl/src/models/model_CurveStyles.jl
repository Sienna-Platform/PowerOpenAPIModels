"""
    CurveStyles

Curve-clearing style for a bid: 0 = VARIABLE (default; continuous quantity with one or more segments); 1 = FIXED (all-or-nothing block with a single segment). FIXED is mutually exclusive with incremental_slope/decremental_slope and requires a single-segment offer curve.
"""
struct CurveStyles <: EnumAPIModel
    value::Int64
    function CurveStyles(value::Int64)
        value in (0, 1) || throw(ArgumentError("invalid CurveStyles value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{CurveStyles}, value) = _decode(CurveStyles, value, true)
function _decode(::Type{CurveStyles}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-e54f7e61a810bf45cca9.json",
            pointer="/\$defs/CurveStyles",
        ),
        value,
        "decoding CurveStyles";
        direction=:neutral,
    )
    return CurveStyles(_decode(Int64, value, _openapi_validate))
end
function _encode(value::CurveStyles)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-e54f7e61a810bf45cca9.json",
            pointer="/\$defs/CurveStyles",
        ),
        output,
        "encoding CurveStyles";
        direction=:neutral,
    )
end
Base.string(value::CurveStyles) = string(value.value)
