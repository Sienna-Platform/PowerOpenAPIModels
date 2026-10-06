"""
    VoltageControlTerminal

Which converter of a two-terminal line a voltage control membership refers to. UNDEFINED: the member is a single-bus device, so no converter is named. FROM: the converter at the arc's `from` bus. TO: the converter at the arc's `to` bus.
"""
struct VoltageControlTerminal <: EnumAPIModel
    value::String
    function VoltageControlTerminal(value::String)
        value in ("UNDEFINED", "FROM", "TO") ||
            throw(ArgumentError("invalid VoltageControlTerminal value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{VoltageControlTerminal}, value) =
    _decode(VoltageControlTerminal, value, true)
function _decode(::Type{VoltageControlTerminal}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-a25835039c119634c922.json",
            pointer="/\$defs/VoltageControlTerminal",
        ),
        value,
        "decoding VoltageControlTerminal";
        direction=:neutral,
    )
    return VoltageControlTerminal(_decode(String, value, false))
end
function _encode_unvalidated(value::VoltageControlTerminal)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::VoltageControlTerminal) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-a25835039c119634c922.json",
        pointer="/\$defs/VoltageControlTerminal",
    ),
    _encode_unvalidated(value),
    "encoding VoltageControlTerminal";
    direction=:neutral,
)
Base.string(value::VoltageControlTerminal) = string(value.value)
