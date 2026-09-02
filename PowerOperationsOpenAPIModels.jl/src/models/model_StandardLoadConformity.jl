@doc "    StandardLoadConformity\n\nIndicates whether the specified load is conforming or non-conforming."
struct StandardLoadConformity
    value::String
    function StandardLoadConformity(value::String)
        value in ("NON_CONFORMING","CONFORMING","UNDEFINED") || throw(ArgumentError("invalid StandardLoadConformity value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{StandardLoadConformity}, value) = _decode(StandardLoadConformity, value, true)
function _decode(::Type{StandardLoadConformity}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/StandardLoad/properties/conformity"), value, "decoding StandardLoadConformity"; direction = :neutral)
    return StandardLoadConformity(_decode(String, value, _openapi_validate))
end
function _encode(value::StandardLoadConformity)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/StandardLoad/properties/conformity"), output, "encoding StandardLoadConformity"; direction = :neutral)
end
Base.string(value::StandardLoadConformity) = string(value.value)
