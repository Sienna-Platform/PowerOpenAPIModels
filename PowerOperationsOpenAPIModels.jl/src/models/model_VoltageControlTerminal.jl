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
            resource="https://openapi.invalid/schema/external-423dce12cabfb2353873.json",
            pointer="/\$defs/VoltageControlTerminal",
        ),
        value,
        "decoding VoltageControlTerminal";
        direction=:neutral,
    )
    return VoltageControlTerminal(_decode(String, value, _openapi_validate))
end
function _encode(value::VoltageControlTerminal)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-423dce12cabfb2353873.json",
            pointer="/\$defs/VoltageControlTerminal",
        ),
        output,
        "encoding VoltageControlTerminal";
        direction=:neutral,
    )
end
Base.string(value::VoltageControlTerminal) = string(value.value)
