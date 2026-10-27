"""
    IntervalAlignment

Position of a timestamp in the period of length `resolution` that its value represents. At a one-hour resolution, the value at 01:00 covers 01:00 to 02:00 for `PERIOD_BEGINNING`, 00:30 to 01:30 for `PERIOD_MIDPOINT`, and 00:00 to 01:00 for `PERIOD_ENDING`. Descriptive: the store records it and does not realign a series.
"""
struct IntervalAlignment <: EnumAPIModel
    value::String
    function IntervalAlignment(value::String)
        value in ("PERIOD_BEGINNING", "PERIOD_MIDPOINT", "PERIOD_ENDING") ||
            throw(ArgumentError("invalid IntervalAlignment value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{IntervalAlignment}, value) = _decode(IntervalAlignment, value, true)
function _decode(::Type{IntervalAlignment}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-cfad214ee20f7aceaf00.json",
            pointer="/\$defs/IntervalAlignment",
        ),
        value,
        "decoding IntervalAlignment";
        direction=:neutral,
    )
    return IntervalAlignment(_decode(String, value, false))
end
function _encode_unvalidated(value::IntervalAlignment)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::IntervalAlignment) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-cfad214ee20f7aceaf00.json",
        pointer="/\$defs/IntervalAlignment",
    ),
    _encode_unvalidated(value),
    "encoding IntervalAlignment";
    direction=:neutral,
)
Base.string(value::IntervalAlignment) = string(value.value)
