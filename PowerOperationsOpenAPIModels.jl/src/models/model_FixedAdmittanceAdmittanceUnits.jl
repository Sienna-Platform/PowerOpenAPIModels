@doc "    FixedAdmittanceAdmittanceUnits\n\nUnit basis for the shunt admittance Y. COMPONENT_MVAR is PSS/E RAW native (Mvar/MW at unity voltage)."
struct FixedAdmittanceAdmittanceUnits
    value::String
    function FixedAdmittanceAdmittanceUnits(value::String)
        value in ("NATURAL_UNITS","COMPONENT_MVAR") || throw(ArgumentError("invalid FixedAdmittanceAdmittanceUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{FixedAdmittanceAdmittanceUnits}, value) = _decode(FixedAdmittanceAdmittanceUnits, value, true)
function _decode(::Type{FixedAdmittanceAdmittanceUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/FixedAdmittance/properties/admittance_units"), value, "decoding FixedAdmittanceAdmittanceUnits"; direction = :neutral)
    return FixedAdmittanceAdmittanceUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::FixedAdmittanceAdmittanceUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/FixedAdmittance/properties/admittance_units"), output, "encoding FixedAdmittanceAdmittanceUnits"; direction = :neutral)
end
Base.string(value::FixedAdmittanceAdmittanceUnits) = string(value.value)
