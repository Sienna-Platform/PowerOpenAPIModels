"""
    ACBusType

Classification of an AC bus for power flow, following the MATPOWER bus-type convention. `PQ` marks a bus with no in-service generation that regulates voltage; it can still have a `voltage_setpoint` that remote devices hold, or that a droop or a reactive power limit stops them from reaching. `PV` marks a bus with in-service generation that regulates voltage: generators, storage, synchronous condensers or sources. Those devices hold the `voltage_setpoint` of the bus they regulate, this bus or their `remote_regulated_bus`; `REF` names the reference for the system voltage angle; `SLACK` balances the system active and reactive mismatch and sets the reference angle; `ISOLATED` marks a bus not connected to the network.
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
            resource="https://openapi.invalid/schema/external-51c57f44618e4da906cb.json",
            pointer="/\$defs/ACBusType",
        ),
        value,
        "decoding ACBusType";
        direction=:neutral,
    )
    return ACBusType(_decode_zoned(String, value, false))
end
function _encode_unvalidated(value::ACBusType)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::ACBusType) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-51c57f44618e4da906cb.json",
        pointer="/\$defs/ACBusType",
    ),
    _encode_unvalidated(value),
    "encoding ACBusType";
    direction=:neutral,
)
Base.string(value::ACBusType) = string(value.value)
