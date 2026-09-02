@doc "    InterruptibleStandardLoadConformity\n\nIndicates whether the specified load is conforming or non-conforming."
struct InterruptibleStandardLoadConformity
    value::String
    function InterruptibleStandardLoadConformity(value::String)
        value in ("NON_CONFORMING","CONFORMING","UNDEFINED") || throw(ArgumentError("invalid InterruptibleStandardLoadConformity value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{InterruptibleStandardLoadConformity}, value) = _decode(InterruptibleStandardLoadConformity, value, true)
function _decode(::Type{InterruptibleStandardLoadConformity}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/InterruptibleStandardLoad/properties/conformity"), value, "decoding InterruptibleStandardLoadConformity"; direction = :neutral)
    return InterruptibleStandardLoadConformity(_decode(String, value, _openapi_validate))
end
function _encode(value::InterruptibleStandardLoadConformity)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/InterruptibleStandardLoad/properties/conformity"), output, "encoding InterruptibleStandardLoadConformity"; direction = :neutral)
end
Base.string(value::InterruptibleStandardLoadConformity) = string(value.value)
