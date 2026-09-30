"""
    LoadConformity

WECC classification of how a load tracks voltage and frequency variation, used in dynamic studies to decide how it is modeled during a disturbance. `CONFORMING` responds predictably and follows standard load modeling practice; `NON_CONFORMING` does not, as with a constant power load or one behind a complex control system; `UNDEFINED` leaves the classification unstated.
"""
struct LoadConformity <: EnumAPIModel
    value::String
    function LoadConformity(value::String)
        value in ("NON_CONFORMING", "CONFORMING", "UNDEFINED") ||
            throw(ArgumentError("invalid LoadConformity value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{LoadConformity}, value) = _decode(LoadConformity, value, true)
function _decode(::Type{LoadConformity}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-98ed6538b1d3543b4530.json",
            pointer="/\$defs/LoadConformity",
        ),
        value,
        "decoding LoadConformity";
        direction=:neutral,
    )
    return LoadConformity(_decode(String, value, false))
end
function _encode_unvalidated(value::LoadConformity)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::LoadConformity) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-98ed6538b1d3543b4530.json",
        pointer="/\$defs/LoadConformity",
    ),
    _encode_unvalidated(value),
    "encoding LoadConformity";
    direction=:neutral,
)
Base.string(value::LoadConformity) = string(value.value)
