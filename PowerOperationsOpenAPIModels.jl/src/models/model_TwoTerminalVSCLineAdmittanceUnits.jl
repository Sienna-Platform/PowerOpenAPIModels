@doc "    TwoTerminalVSCLineAdmittanceUnits\n\nUnit basis for the series conductance g."
struct TwoTerminalVSCLineAdmittanceUnits
    value::String
    function TwoTerminalVSCLineAdmittanceUnits(value::String)
        value in ("NATURAL_UNITS","COMPONENT_MVAR","COMPONENT_BASE") || throw(ArgumentError("invalid TwoTerminalVSCLineAdmittanceUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TwoTerminalVSCLineAdmittanceUnits}, value) = _decode(TwoTerminalVSCLineAdmittanceUnits, value, true)
function _decode(::Type{TwoTerminalVSCLineAdmittanceUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoTerminalVSCLine/properties/admittance_units"), value, "decoding TwoTerminalVSCLineAdmittanceUnits"; direction = :neutral)
    return TwoTerminalVSCLineAdmittanceUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::TwoTerminalVSCLineAdmittanceUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoTerminalVSCLine/properties/admittance_units"), output, "encoding TwoTerminalVSCLineAdmittanceUnits"; direction = :neutral)
end
Base.string(value::TwoTerminalVSCLineAdmittanceUnits) = string(value.value)
