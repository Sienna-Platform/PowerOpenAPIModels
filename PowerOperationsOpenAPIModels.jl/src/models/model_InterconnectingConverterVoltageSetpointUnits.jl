@doc "    InterconnectingConverterVoltageSetpointUnits\n\nUnit basis for the DC/AC voltage setpoints."
struct InterconnectingConverterVoltageSetpointUnits
    value::String
    function InterconnectingConverterVoltageSetpointUnits(value::String)
        value in ("NATURAL_UNITS","COMPONENT_BASE") || throw(ArgumentError("invalid InterconnectingConverterVoltageSetpointUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{InterconnectingConverterVoltageSetpointUnits}, value) = _decode(InterconnectingConverterVoltageSetpointUnits, value, true)
function _decode(::Type{InterconnectingConverterVoltageSetpointUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/InterconnectingConverter/properties/voltage_setpoint_units"), value, "decoding InterconnectingConverterVoltageSetpointUnits"; direction = :neutral)
    return InterconnectingConverterVoltageSetpointUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::InterconnectingConverterVoltageSetpointUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/InterconnectingConverter/properties/voltage_setpoint_units"), output, "encoding InterconnectingConverterVoltageSetpointUnits"; direction = :neutral)
end
Base.string(value::InterconnectingConverterVoltageSetpointUnits) = string(value.value)
