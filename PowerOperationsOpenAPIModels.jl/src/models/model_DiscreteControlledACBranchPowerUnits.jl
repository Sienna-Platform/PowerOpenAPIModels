@doc "    DiscreteControlledACBranchPowerUnits\n\nUnit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
struct DiscreteControlledACBranchPowerUnits
    value::String
    function DiscreteControlledACBranchPowerUnits(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid DiscreteControlledACBranchPowerUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{DiscreteControlledACBranchPowerUnits}, value) = _decode(DiscreteControlledACBranchPowerUnits, value, true)
function _decode(::Type{DiscreteControlledACBranchPowerUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/DiscreteControlledACBranch/properties/power_units"), value, "decoding DiscreteControlledACBranchPowerUnits"; direction = :neutral)
    return DiscreteControlledACBranchPowerUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::DiscreteControlledACBranchPowerUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/DiscreteControlledACBranch/properties/power_units"), output, "encoding DiscreteControlledACBranchPowerUnits"; direction = :neutral)
end
Base.string(value::DiscreteControlledACBranchPowerUnits) = string(value.value)
