"""
    TransformerControlObjective

Control objective of a tap changer or phase shifter: FIXED (no adjustment), or regulation of voltage, reactive power, active power, asymmetric power, or a DC line. Each has a paired _DISABLED value; UNDEFINED means none stated.
"""
struct TransformerControlObjective <: EnumAPIModel
    value::String
    function TransformerControlObjective(value::String)
        value in (
            "UNDEFINED",
            "VOLTAGE_DISABLED",
            "REACTIVE_POWER_FLOW_DISABLED",
            "ACTIVE_POWER_FLOW_DISABLED",
            "CONTROL_OF_DC_LINE_DISABLED",
            "ASYMMETRIC_ACTIVE_POWER_FLOW_DISABLED",
            "FIXED",
            "VOLTAGE",
            "REACTIVE_POWER_FLOW",
            "ACTIVE_POWER_FLOW",
            "CONTROL_OF_DC_LINE",
            "ASYMMETRIC_ACTIVE_POWER_FLOW",
        ) ||
            throw(ArgumentError("invalid TransformerControlObjective value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TransformerControlObjective}, value) =
    _decode(TransformerControlObjective, value, true)
function _decode(::Type{TransformerControlObjective}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-93346ccf4b7969b6d994.json",
            pointer="/components/schemas/TransformerControlObjective",
        ),
        value,
        "decoding TransformerControlObjective";
        direction=:neutral,
    )
    return TransformerControlObjective(_decode(String, value, _openapi_validate))
end
function _encode(value::TransformerControlObjective)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-93346ccf4b7969b6d994.json",
            pointer="/components/schemas/TransformerControlObjective",
        ),
        output,
        "encoding TransformerControlObjective";
        direction=:neutral,
    )
end
Base.string(value::TransformerControlObjective) = string(value.value)
