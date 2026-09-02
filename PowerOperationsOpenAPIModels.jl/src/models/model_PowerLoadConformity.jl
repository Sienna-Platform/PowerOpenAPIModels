@doc "    PowerLoadConformity\n\nIndicates whether the specified load is conforming or non-conforming."
struct PowerLoadConformity
    value::String
    function PowerLoadConformity(value::String)
        value in ("NON_CONFORMING","CONFORMING","UNDEFINED") || throw(ArgumentError("invalid PowerLoadConformity value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{PowerLoadConformity}, value) = _decode(PowerLoadConformity, value, true)
function _decode(::Type{PowerLoadConformity}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/PowerLoad/properties/conformity"), value, "decoding PowerLoadConformity"; direction = :neutral)
    return PowerLoadConformity(_decode(String, value, _openapi_validate))
end
function _encode(value::PowerLoadConformity)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/PowerLoad/properties/conformity"), output, "encoding PowerLoadConformity"; direction = :neutral)
end
Base.string(value::PowerLoadConformity) = string(value.value)
