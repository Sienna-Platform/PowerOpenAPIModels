@doc "    SwitchedAdmittanceAdmittanceUnits\n\nUnit basis for the shunt admittance Y. COMPONENT_MVAR is PSS/E RAW native (Mvar/MW at unity voltage)."
struct SwitchedAdmittanceAdmittanceUnits
    value::String
    function SwitchedAdmittanceAdmittanceUnits(value::String)
        value in ("NATURAL_UNITS","COMPONENT_MVAR") || throw(ArgumentError("invalid SwitchedAdmittanceAdmittanceUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{SwitchedAdmittanceAdmittanceUnits}, value) = _decode(SwitchedAdmittanceAdmittanceUnits, value, true)
function _decode(::Type{SwitchedAdmittanceAdmittanceUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/SwitchedAdmittance/properties/admittance_units"), value, "decoding SwitchedAdmittanceAdmittanceUnits"; direction = :neutral)
    return SwitchedAdmittanceAdmittanceUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::SwitchedAdmittanceAdmittanceUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/SwitchedAdmittance/properties/admittance_units"), output, "encoding SwitchedAdmittanceAdmittanceUnits"; direction = :neutral)
end
Base.string(value::SwitchedAdmittanceAdmittanceUnits) = string(value.value)
