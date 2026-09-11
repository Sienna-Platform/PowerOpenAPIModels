"""
    OperationalStates

The on/off lifecycle of an in-service committable unit. OFFLINE: shut down. ONLINE: synchronized and producing. STARTUP/SHUTDOWN: mid-transition. Distinct from availability: an outaged unit has available = false regardless of state.
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
            resource="https://openapi.invalid/schema/root-93346ccf4b7969b6d994.json",
            pointer="/components/schemas/OperationalStates",
        ),
        value,
        "decoding OperationalStates";
        direction=:neutral,
    )
    return OperationalStates(_decode(String, value, _openapi_validate))
end
function _encode(value::OperationalStates)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-93346ccf4b7969b6d994.json",
            pointer="/components/schemas/OperationalStates",
        ),
        output,
        "encoding OperationalStates";
        direction=:neutral,
    )
end
Base.string(value::OperationalStates) = string(value.value)
