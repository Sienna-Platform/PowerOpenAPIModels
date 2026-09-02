@doc "    ThreeWindingTransformerAdmittanceUnits\n\nUnit basis for the magnetizing_shunt admittance."
struct ThreeWindingTransformerAdmittanceUnits
    value::String
    function ThreeWindingTransformerAdmittanceUnits(value::String)
        value in ("NATURAL_UNITS","COMPONENT_MVAR","COMPONENT_BASE") || throw(ArgumentError("invalid ThreeWindingTransformerAdmittanceUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ThreeWindingTransformerAdmittanceUnits}, value) = _decode(ThreeWindingTransformerAdmittanceUnits, value, true)
function _decode(::Type{ThreeWindingTransformerAdmittanceUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ThreeWindingTransformer/properties/admittance_units"), value, "decoding ThreeWindingTransformerAdmittanceUnits"; direction = :neutral)
    return ThreeWindingTransformerAdmittanceUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::ThreeWindingTransformerAdmittanceUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ThreeWindingTransformer/properties/admittance_units"), output, "encoding ThreeWindingTransformerAdmittanceUnits"; direction = :neutral)
end
Base.string(value::ThreeWindingTransformerAdmittanceUnits) = string(value.value)
