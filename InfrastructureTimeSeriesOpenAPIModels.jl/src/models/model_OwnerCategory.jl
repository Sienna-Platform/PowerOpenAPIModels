"""
    OwnerCategory

Whether a time series' owner is a component or a supplemental attribute. The producing data layer allocates both kinds of id from one stream, so an owner_id never names one of each; the category is required regardless, because the store's catalog contract still supports independent streams from other producers and remains the store's disambiguator. These are the display and serde spellings; the store's catalog holds them as the integer codes 0 and 1.
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
            resource="https://openapi.invalid/schema/external-003bf0ce6510b65f9b25.json",
            pointer="/\$defs/OwnerCategory",
        ),
        value,
        "decoding OwnerCategory";
        direction=:neutral,
    )
    return OwnerCategory(_decode(String, value, false))
end
function _encode_unvalidated(value::OwnerCategory)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::OwnerCategory) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-003bf0ce6510b65f9b25.json",
        pointer="/\$defs/OwnerCategory",
    ),
    _encode_unvalidated(value),
    "encoding OwnerCategory";
    direction=:neutral,
)
Base.string(value::OwnerCategory) = string(value.value)
