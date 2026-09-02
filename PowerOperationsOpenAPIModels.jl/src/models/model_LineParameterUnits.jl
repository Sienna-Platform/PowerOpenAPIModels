@doc "    LineParameterUnits\n\nUnit basis for this line's impedance and shunt admittance fields (r, x, b, g)."
struct LineParameterUnits
    value::String
    function LineParameterUnits(value::String)
        value in ("NATURAL_UNITS","COMPONENT_BASE") || throw(ArgumentError("invalid LineParameterUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{LineParameterUnits}, value) = _decode(LineParameterUnits, value, true)
function _decode(::Type{LineParameterUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/Line/properties/parameter_units"), value, "decoding LineParameterUnits"; direction = :neutral)
    return LineParameterUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::LineParameterUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/Line/properties/parameter_units"), output, "encoding LineParameterUnits"; direction = :neutral)
end
Base.string(value::LineParameterUnits) = string(value.value)
