@doc "    TransformerCircuitControlObjective\n\nTap-changer / phase-shifter control objective (PSS/E COD). `UNDEFINED` means this circuit has no control block."
struct TransformerCircuitControlObjective
    value::String
    function TransformerCircuitControlObjective(value::String)
        value in ("UNDEFINED","VOLTAGE_DISABLED","REACTIVE_POWER_FLOW_DISABLED","ACTIVE_POWER_FLOW_DISABLED","CONTROL_OF_DC_LINE_DISABLED","ASYMMETRIC_ACTIVE_POWER_FLOW_DISABLED","FIXED","VOLTAGE","REACTIVE_POWER_FLOW","ACTIVE_POWER_FLOW","CONTROL_OF_DC_LINE","ASYMMETRIC_ACTIVE_POWER_FLOW") || throw(ArgumentError("invalid TransformerCircuitControlObjective value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TransformerCircuitControlObjective}, value) = _decode(TransformerCircuitControlObjective, value, true)
function _decode(::Type{TransformerCircuitControlObjective}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TransformerCircuit/properties/control_objective"), value, "decoding TransformerCircuitControlObjective"; direction = :neutral)
    return TransformerCircuitControlObjective(_decode(String, value, _openapi_validate))
end
function _encode(value::TransformerCircuitControlObjective)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TransformerCircuit/properties/control_objective"), output, "encoding TransformerCircuitControlObjective"; direction = :neutral)
end
Base.string(value::TransformerCircuitControlObjective) = string(value.value)
