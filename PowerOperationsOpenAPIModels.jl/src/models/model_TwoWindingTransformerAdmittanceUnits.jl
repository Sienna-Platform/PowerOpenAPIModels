@doc "    TwoWindingTransformerAdmittanceUnits\n\nUnit basis for the magnetizing_shunt admittance."
struct TwoWindingTransformerAdmittanceUnits
    value::String
    function TwoWindingTransformerAdmittanceUnits(value::String)
        value in ("NATURAL_UNITS","COMPONENT_MVAR","COMPONENT_BASE") || throw(ArgumentError("invalid TwoWindingTransformerAdmittanceUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TwoWindingTransformerAdmittanceUnits}, value) = _decode(TwoWindingTransformerAdmittanceUnits, value, true)
function _decode(::Type{TwoWindingTransformerAdmittanceUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoWindingTransformer/properties/admittance_units"), value, "decoding TwoWindingTransformerAdmittanceUnits"; direction = :neutral)
    return TwoWindingTransformerAdmittanceUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::TwoWindingTransformerAdmittanceUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoWindingTransformer/properties/admittance_units"), output, "encoding TwoWindingTransformerAdmittanceUnits"; direction = :neutral)
end
Base.string(value::TwoWindingTransformerAdmittanceUnits) = string(value.value)
