"""
    OwnerCategory

Whether a time series' owner is a component or a supplemental attribute. Required regardless of id, since the store's catalog contract supports independent id streams from other producers.
"""
struct OwnerCategory <: EnumAPIModel
    value::String
    function OwnerCategory(value::String)
        value in ("Component", "SupplementalAttribute") ||
            throw(ArgumentError("invalid OwnerCategory value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{OwnerCategory}, value) = _decode(OwnerCategory, value, true)
function _decode(::Type{OwnerCategory}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-463dad90dca1b0053108.json",
            pointer="/components/schemas/OwnerCategory",
        ),
        value,
        "decoding OwnerCategory";
        direction=:neutral,
    )
    return OwnerCategory(_decode(String, value, _openapi_validate))
end
function _encode(value::OwnerCategory)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-463dad90dca1b0053108.json",
            pointer="/components/schemas/OwnerCategory",
        ),
        output,
        "encoding OwnerCategory";
        direction=:neutral,
    )
end
Base.string(value::OwnerCategory) = string(value.value)
