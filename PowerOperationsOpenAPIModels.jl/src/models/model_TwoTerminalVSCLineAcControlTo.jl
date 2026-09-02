@doc "    TwoTerminalVSCLineAcControlTo\n\nAC-side control mode of the `to` converter."
struct TwoTerminalVSCLineAcControlTo
    value::String
    function TwoTerminalVSCLineAcControlTo(value::String)
        value in ("AC_REACTIVE_POWER","AC_VOLTAGE") || throw(ArgumentError("invalid TwoTerminalVSCLineAcControlTo value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TwoTerminalVSCLineAcControlTo}, value) = _decode(TwoTerminalVSCLineAcControlTo, value, true)
function _decode(::Type{TwoTerminalVSCLineAcControlTo}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoTerminalVSCLine/properties/ac_control_to"), value, "decoding TwoTerminalVSCLineAcControlTo"; direction = :neutral)
    return TwoTerminalVSCLineAcControlTo(_decode(String, value, _openapi_validate))
end
function _encode(value::TwoTerminalVSCLineAcControlTo)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoTerminalVSCLine/properties/ac_control_to"), output, "encoding TwoTerminalVSCLineAcControlTo"; direction = :neutral)
end
Base.string(value::TwoTerminalVSCLineAcControlTo) = string(value.value)
