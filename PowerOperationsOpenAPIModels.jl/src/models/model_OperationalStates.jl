@doc "    OperationalStates\n\nThe running on/off lifecycle of an in-service committable unit, mutually exclusive. OFFLINE: shut down and not synchronized. STARTUP: in its start-up sequence. ONLINE: synchronized and able to produce. SHUTDOWN: in its shut-down sequence. Availability is not one of these values: a unit on outage is `available = false`; an OFFLINE unit with `available = true` is in service and eligible for re-commitment and off-line ancillary services."
struct OperationalStates
    value::String
    function OperationalStates(value::String)
        value in ("OFFLINE","STARTUP","ONLINE","SHUTDOWN") || throw(ArgumentError("invalid OperationalStates value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{OperationalStates}, value) = _decode(OperationalStates, value, true)
function _decode(::Type{OperationalStates}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/OperationalStates"), value, "decoding OperationalStates"; direction = :neutral)
    return OperationalStates(_decode(String, value, _openapi_validate))
end
function _encode(value::OperationalStates)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/OperationalStates"), output, "encoding OperationalStates"; direction = :neutral)
end
Base.string(value::OperationalStates) = string(value.value)
