@doc "    InterruptiblePowerLoadConformity\n\nIndicates whether the specified load is conforming or non-conforming."
struct InterruptiblePowerLoadConformity
    value::String
    function InterruptiblePowerLoadConformity(value::String)
        value in ("NON_CONFORMING","CONFORMING","UNDEFINED") || throw(ArgumentError("invalid InterruptiblePowerLoadConformity value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{InterruptiblePowerLoadConformity}, value) = _decode(InterruptiblePowerLoadConformity, value, true)
function _decode(::Type{InterruptiblePowerLoadConformity}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/InterruptiblePowerLoad/properties/conformity"), value, "decoding InterruptiblePowerLoadConformity"; direction = :neutral)
    return InterruptiblePowerLoadConformity(_decode(String, value, _openapi_validate))
end
function _encode(value::InterruptiblePowerLoadConformity)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/InterruptiblePowerLoad/properties/conformity"), output, "encoding InterruptiblePowerLoadConformity"; direction = :neutral)
end
Base.string(value::InterruptiblePowerLoadConformity) = string(value.value)
