@doc "    TModelHVDCLineParameterUnits\n\nUnit basis for this line's impedance field (r)."
struct TModelHVDCLineParameterUnits
    value::String
    function TModelHVDCLineParameterUnits(value::String)
        value in ("NATURAL_UNITS","COMPONENT_BASE") || throw(ArgumentError("invalid TModelHVDCLineParameterUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TModelHVDCLineParameterUnits}, value) = _decode(TModelHVDCLineParameterUnits, value, true)
function _decode(::Type{TModelHVDCLineParameterUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TModelHVDCLine/properties/parameter_units"), value, "decoding TModelHVDCLineParameterUnits"; direction = :neutral)
    return TModelHVDCLineParameterUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::TModelHVDCLineParameterUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TModelHVDCLine/properties/parameter_units"), output, "encoding TModelHVDCLineParameterUnits"; direction = :neutral)
end
Base.string(value::TModelHVDCLineParameterUnits) = string(value.value)
