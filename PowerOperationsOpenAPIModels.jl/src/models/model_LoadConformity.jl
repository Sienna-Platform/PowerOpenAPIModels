@doc "    LoadConformity\n\nWECC classification of how a load tracks voltage and frequency variation, used in dynamic studies to decide how it is modeled during a disturbance. `CONFORMING` responds predictably and follows standard load modeling practice; `NON_CONFORMING` does not, as with a constant power load or one behind a complex control system; `UNDEFINED` leaves the classification unstated."
struct LoadConformity
    value::String
    function LoadConformity(value::String)
        value in ("NON_CONFORMING","CONFORMING","UNDEFINED") || throw(ArgumentError("invalid LoadConformity value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{LoadConformity}, value) = _decode(LoadConformity, value, true)
function _decode(::Type{LoadConformity}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/LoadConformity"), value, "decoding LoadConformity"; direction = :neutral)
    return LoadConformity(_decode(String, value, _openapi_validate))
end
function _encode(value::LoadConformity)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/LoadConformity"), output, "encoding LoadConformity"; direction = :neutral)
end
Base.string(value::LoadConformity) = string(value.value)
