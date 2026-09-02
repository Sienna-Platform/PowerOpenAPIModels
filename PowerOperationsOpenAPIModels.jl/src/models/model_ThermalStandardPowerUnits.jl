@doc "    ThermalStandardPowerUnits\n\nUnit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
struct ThermalStandardPowerUnits
    value::String
    function ThermalStandardPowerUnits(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid ThermalStandardPowerUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ThermalStandardPowerUnits}, value) = _decode(ThermalStandardPowerUnits, value, true)
function _decode(::Type{ThermalStandardPowerUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ThermalStandard/properties/power_units"), value, "decoding ThermalStandardPowerUnits"; direction = :neutral)
    return ThermalStandardPowerUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::ThermalStandardPowerUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ThermalStandard/properties/power_units"), output, "encoding ThermalStandardPowerUnits"; direction = :neutral)
end
Base.string(value::ThermalStandardPowerUnits) = string(value.value)
