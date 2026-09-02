@doc "    FACTSControlDeviceVoltageSetpointUnits\n\nUnit basis for voltage_setpoint. COMPONENT_BASE (pu on the bus base voltage) is PSS/E RAW native (VSET)."
struct FACTSControlDeviceVoltageSetpointUnits
    value::String
    function FACTSControlDeviceVoltageSetpointUnits(value::String)
        value in ("NATURAL_UNITS","COMPONENT_BASE") || throw(ArgumentError("invalid FACTSControlDeviceVoltageSetpointUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{FACTSControlDeviceVoltageSetpointUnits}, value) = _decode(FACTSControlDeviceVoltageSetpointUnits, value, true)
function _decode(::Type{FACTSControlDeviceVoltageSetpointUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/FACTSControlDevice/properties/voltage_setpoint_units"), value, "decoding FACTSControlDeviceVoltageSetpointUnits"; direction = :neutral)
    return FACTSControlDeviceVoltageSetpointUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::FACTSControlDeviceVoltageSetpointUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/FACTSControlDevice/properties/voltage_setpoint_units"), output, "encoding FACTSControlDeviceVoltageSetpointUnits"; direction = :neutral)
end
Base.string(value::FACTSControlDeviceVoltageSetpointUnits) = string(value.value)
