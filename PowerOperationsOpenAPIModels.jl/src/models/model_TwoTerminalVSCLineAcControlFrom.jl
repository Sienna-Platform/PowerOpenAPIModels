@doc "    TwoTerminalVSCLineAcControlFrom\n\nAC-side control mode of the `from` converter."
struct TwoTerminalVSCLineAcControlFrom
    value::String
    function TwoTerminalVSCLineAcControlFrom(value::String)
        value in ("AC_REACTIVE_POWER","AC_VOLTAGE") || throw(ArgumentError("invalid TwoTerminalVSCLineAcControlFrom value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TwoTerminalVSCLineAcControlFrom}, value) = _decode(TwoTerminalVSCLineAcControlFrom, value, true)
function _decode(::Type{TwoTerminalVSCLineAcControlFrom}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoTerminalVSCLine/properties/ac_control_from"), value, "decoding TwoTerminalVSCLineAcControlFrom"; direction = :neutral)
    return TwoTerminalVSCLineAcControlFrom(_decode(String, value, _openapi_validate))
end
function _encode(value::TwoTerminalVSCLineAcControlFrom)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoTerminalVSCLine/properties/ac_control_from"), output, "encoding TwoTerminalVSCLineAcControlFrom"; direction = :neutral)
end
Base.string(value::TwoTerminalVSCLineAcControlFrom) = string(value.value)
