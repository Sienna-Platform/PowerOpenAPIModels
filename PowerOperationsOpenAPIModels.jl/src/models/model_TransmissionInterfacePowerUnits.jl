@doc "    TransmissionInterfacePowerUnits\n\nUnit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
struct TransmissionInterfacePowerUnits
    value::String
    function TransmissionInterfacePowerUnits(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid TransmissionInterfacePowerUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TransmissionInterfacePowerUnits}, value) = _decode(TransmissionInterfacePowerUnits, value, true)
function _decode(::Type{TransmissionInterfacePowerUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TransmissionInterface/properties/power_units"), value, "decoding TransmissionInterfacePowerUnits"; direction = :neutral)
    return TransmissionInterfacePowerUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::TransmissionInterfacePowerUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TransmissionInterface/properties/power_units"), output, "encoding TransmissionInterfacePowerUnits"; direction = :neutral)
end
Base.string(value::TransmissionInterfacePowerUnits) = string(value.value)
