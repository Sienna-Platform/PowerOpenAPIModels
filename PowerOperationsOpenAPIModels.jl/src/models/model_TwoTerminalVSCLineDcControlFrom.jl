@doc "    TwoTerminalVSCLineDcControlFrom\n\nDC-side control mode of the `from` converter."
struct TwoTerminalVSCLineDcControlFrom
    value::String
    function TwoTerminalVSCLineDcControlFrom(value::String)
        value in ("DC_POWER","DC_VOLTAGE","DC_VOLTAGE_DROOP") || throw(ArgumentError("invalid TwoTerminalVSCLineDcControlFrom value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TwoTerminalVSCLineDcControlFrom}, value) = _decode(TwoTerminalVSCLineDcControlFrom, value, true)
function _decode(::Type{TwoTerminalVSCLineDcControlFrom}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TwoTerminalVSCLine/properties/dc_control_from"), value, "decoding TwoTerminalVSCLineDcControlFrom"; direction = :neutral)
    return TwoTerminalVSCLineDcControlFrom(_decode(String, value, _openapi_validate))
end
function _encode(value::TwoTerminalVSCLineDcControlFrom)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TwoTerminalVSCLine/properties/dc_control_from"), output, "encoding TwoTerminalVSCLineDcControlFrom"; direction = :neutral)
end
Base.string(value::TwoTerminalVSCLineDcControlFrom) = string(value.value)
