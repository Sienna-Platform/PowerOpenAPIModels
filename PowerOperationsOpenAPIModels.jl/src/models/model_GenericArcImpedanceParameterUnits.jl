@doc "    GenericArcImpedanceParameterUnits\n\nUnit basis for r and x. COMPONENT_BASE is per-unit on this component's base_power, which records the system base."
struct GenericArcImpedanceParameterUnits
    value::String
    function GenericArcImpedanceParameterUnits(value::String)
        value in ("NATURAL_UNITS","COMPONENT_BASE") || throw(ArgumentError("invalid GenericArcImpedanceParameterUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{GenericArcImpedanceParameterUnits}, value) = _decode(GenericArcImpedanceParameterUnits, value, true)
function _decode(::Type{GenericArcImpedanceParameterUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/GenericArcImpedance/properties/parameter_units"), value, "decoding GenericArcImpedanceParameterUnits"; direction = :neutral)
    return GenericArcImpedanceParameterUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::GenericArcImpedanceParameterUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/GenericArcImpedance/properties/parameter_units"), output, "encoding GenericArcImpedanceParameterUnits"; direction = :neutral)
end
Base.string(value::GenericArcImpedanceParameterUnits) = string(value.value)
