"""
    OperationalStates

The running on/off lifecycle of an in-service committable unit, mutually exclusive. OFFLINE: shut down and not synchronized. ONLINE: synchronized and able to produce. STARTUP: in its start-up sequence. SHUTDOWN: in its shut-down sequence. Availability is not one of these values: a unit on outage is `available = false`; an OFFLINE unit with `available = true` is in service and eligible for re-commitment and off-line ancillary services.
"""
struct OperationalStates <: EnumAPIModel
    value::String
    function OperationalStates(value::String)
        value in ("OFFLINE", "ONLINE", "STARTUP", "SHUTDOWN") ||
            throw(ArgumentError("invalid OperationalStates value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{OperationalStates}, value) = _decode(OperationalStates, value, true)
function _decode(::Type{OperationalStates}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-98ed6538b1d3543b4530.json",
            pointer="/\$defs/OperationalStates",
        ),
        value,
        "decoding OperationalStates";
        direction=:neutral,
    )
    return OperationalStates(_decode(String, value, false))
end
function _encode_unvalidated(value::OperationalStates)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::OperationalStates) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-98ed6538b1d3543b4530.json",
        pointer="/\$defs/OperationalStates",
    ),
    _encode_unvalidated(value),
    "encoding OperationalStates";
    direction=:neutral,
)
Base.string(value::OperationalStates) = string(value.value)
