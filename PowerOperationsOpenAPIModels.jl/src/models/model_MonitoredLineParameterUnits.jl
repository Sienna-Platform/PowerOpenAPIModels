@doc "    MonitoredLineParameterUnits\n\nUnit basis for this line's impedance and shunt admittance fields (r, x, b, g)."
struct MonitoredLineParameterUnits
    value::String
    function MonitoredLineParameterUnits(value::String)
        value in ("NATURAL_UNITS","COMPONENT_BASE") || throw(ArgumentError("invalid MonitoredLineParameterUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{MonitoredLineParameterUnits}, value) = _decode(MonitoredLineParameterUnits, value, true)
function _decode(::Type{MonitoredLineParameterUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/MonitoredLine/properties/parameter_units"), value, "decoding MonitoredLineParameterUnits"; direction = :neutral)
    return MonitoredLineParameterUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::MonitoredLineParameterUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/MonitoredLine/properties/parameter_units"), output, "encoding MonitoredLineParameterUnits"; direction = :neutral)
end
Base.string(value::MonitoredLineParameterUnits) = string(value.value)
