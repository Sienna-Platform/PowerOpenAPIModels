@doc "    TwoTerminalVSCLineDcControlTo\n\nDC-side control mode of the `to` converter."
struct TwoTerminalVSCLineDcControlTo
    value::String
    function TwoTerminalVSCLineDcControlTo(value::String)
        value in ("DC_POWER","DC_VOLTAGE","DC_VOLTAGE_DROOP") || throw(ArgumentError("invalid TwoTerminalVSCLineDcControlTo value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TwoTerminalVSCLineDcControlTo}, value) = _decode(TwoTerminalVSCLineDcControlTo, value, true)
function _decode(::Type{TwoTerminalVSCLineDcControlTo}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoTerminalVSCLine/properties/dc_control_to"), value, "decoding TwoTerminalVSCLineDcControlTo"; direction = :neutral)
    return TwoTerminalVSCLineDcControlTo(_decode(String, value, _openapi_validate))
end
function _encode(value::TwoTerminalVSCLineDcControlTo)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoTerminalVSCLine/properties/dc_control_to"), output, "encoding TwoTerminalVSCLineDcControlTo"; direction = :neutral)
end
Base.string(value::TwoTerminalVSCLineDcControlTo) = string(value.value)
