@doc "    SourceParameterUnits\n\nUnit basis for this source's impedance fields (R_th, X_th)."
struct SourceParameterUnits
    value::String
    function SourceParameterUnits(value::String)
        value in ("NATURAL_UNITS","COMPONENT_BASE") || throw(ArgumentError("invalid SourceParameterUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{SourceParameterUnits}, value) = _decode(SourceParameterUnits, value, true)
function _decode(::Type{SourceParameterUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/Source/properties/parameter_units"), value, "decoding SourceParameterUnits"; direction = :neutral)
    return SourceParameterUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::SourceParameterUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/Source/properties/parameter_units"), output, "encoding SourceParameterUnits"; direction = :neutral)
end
Base.string(value::SourceParameterUnits) = string(value.value)
