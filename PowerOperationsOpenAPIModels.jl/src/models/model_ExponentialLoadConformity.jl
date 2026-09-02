@doc "    ExponentialLoadConformity\n\nIndicates whether the specified load is conforming or non-conforming."
struct ExponentialLoadConformity
    value::String
    function ExponentialLoadConformity(value::String)
        value in ("NON_CONFORMING","CONFORMING","UNDEFINED") || throw(ArgumentError("invalid ExponentialLoadConformity value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ExponentialLoadConformity}, value) = _decode(ExponentialLoadConformity, value, true)
function _decode(::Type{ExponentialLoadConformity}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ExponentialLoad/properties/conformity"), value, "decoding ExponentialLoadConformity"; direction = :neutral)
    return ExponentialLoadConformity(_decode(String, value, _openapi_validate))
end
function _encode(value::ExponentialLoadConformity)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ExponentialLoad/properties/conformity"), output, "encoding ExponentialLoadConformity"; direction = :neutral)
end
Base.string(value::ExponentialLoadConformity) = string(value.value)
