"""
    LoadConformity

How a load tracks voltage and frequency variation in dynamic studies. CONFORMING responds predictably, following standard practice. NON_CONFORMING does not, e.g. a constant power load. UNDEFINED leaves it unstated.
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
            resource="https://openapi.invalid/schema/root-93346ccf4b7969b6d994.json",
            pointer="/components/schemas/LoadConformity",
        ),
        value,
        "decoding LoadConformity";
        direction=:neutral,
    )
    return LoadConformity(_decode(String, value, _openapi_validate))
end
function _encode(value::LoadConformity)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-93346ccf4b7969b6d994.json",
            pointer="/components/schemas/LoadConformity",
        ),
        output,
        "encoding LoadConformity";
        direction=:neutral,
    )
end
Base.string(value::LoadConformity) = string(value.value)
