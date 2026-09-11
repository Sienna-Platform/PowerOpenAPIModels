"""
    ACBusType

Classification of an AC bus for power flow. PQ fixes active/reactive injections, solving for voltage and angle. PV fixes power and voltage magnitude. REF names the angle reference. SLACK balances mismatch. ISOLATED marks a disconnected bus.
"""
struct ACBusType <: EnumAPIModel
    value::String
    function ACBusType(value::String)
        value in ("PQ", "PV", "REF", "ISOLATED", "SLACK") ||
            throw(ArgumentError("invalid ACBusType value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ACBusType}, value) = _decode(ACBusType, value, true)
function _decode(::Type{ACBusType}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-73b8f5d70ab200b425bf.json",
            pointer="/components/schemas/ACBusType",
        ),
        value,
        "decoding ACBusType";
        direction=:neutral,
    )
    return ACBusType(_decode(String, value, _openapi_validate))
end
function _encode(value::ACBusType)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-73b8f5d70ab200b425bf.json",
            pointer="/components/schemas/ACBusType",
        ),
        output,
        "encoding ACBusType";
        direction=:neutral,
    )
end
Base.string(value::ACBusType) = string(value.value)
