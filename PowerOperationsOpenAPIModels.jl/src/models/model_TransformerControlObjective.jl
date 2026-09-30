"""
    TransformerControlObjective

Control objective of a transformer tap changer or phase shifter: a fixed tap position with no automatic adjustment (`FIXED`), or regulation of voltage magnitude at the controlled bus, reactive power flow, active power flow, asymmetric active power flow, or a DC line. Each regulating objective has a paired `_DISABLED` value naming the same control block while it is out of service, and `UNDEFINED` means no control objective is stated.
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
            resource="https://openapi.invalid/schema/external-98ed6538b1d3543b4530.json",
            pointer="/\$defs/TransformerControlObjective",
        ),
        value,
        "decoding TransformerControlObjective";
        direction=:neutral,
    )
    return TransformerControlObjective(_decode(String, value, false))
end
function _encode_unvalidated(value::TransformerControlObjective)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::TransformerControlObjective) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-98ed6538b1d3543b4530.json",
        pointer="/\$defs/TransformerControlObjective",
    ),
    _encode_unvalidated(value),
    "encoding TransformerControlObjective";
    direction=:neutral,
)
Base.string(value::TransformerControlObjective) = string(value.value)
