"""
    ACBusType

Classification of an AC bus for power flow, following the MATPOWER bus-type convention. `PQ` fixes the active and reactive injections and solves for voltage magnitude and angle; `PV` fixes active power and voltage magnitude and solves for reactive power and angle; `REF` names the reference for the system voltage angle; `SLACK` balances the system active and reactive mismatch and sets the reference angle; `ISOLATED` marks a bus not connected to the network.
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
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/ACBusType",
        ),
        value,
        "decoding ACBusType";
        direction=:neutral,
    )
    return ACBusType(_decode(String, value, false))
end
function _encode_unvalidated(value::ACBusType)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::ACBusType) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
        pointer="/\$defs/ACBusType",
    ),
    _encode_unvalidated(value),
    "encoding ACBusType";
    direction=:neutral,
)
Base.string(value::ACBusType) = string(value.value)
