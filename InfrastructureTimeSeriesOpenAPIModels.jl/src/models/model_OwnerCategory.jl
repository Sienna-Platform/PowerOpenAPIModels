@doc "    OwnerCategory\n\nWhether a time series' owner is a component or a supplemental attribute. The producing data layer allocates both kinds of id from one stream, so an owner_id never names one of each; the category is required regardless, because the store's catalog contract still supports independent streams from other producers and remains the store's disambiguator. These are the display and serde spellings; the store's catalog holds them as the integer codes 0 and 1."
struct OwnerCategory
    value::String
    function OwnerCategory(value::String)
        value in ("Component","SupplementalAttribute") || throw(ArgumentError("invalid OwnerCategory value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{OwnerCategory}, value) = _decode(OwnerCategory, value, true)
function _decode(::Type{OwnerCategory}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-d907e2d1c7ab387eab6d.json", pointer = "/components/schemas/OwnerCategory"), value, "decoding OwnerCategory"; direction = :neutral)
    return OwnerCategory(_decode(String, value, _openapi_validate))
end
function _encode(value::OwnerCategory)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-d907e2d1c7ab387eab6d.json", pointer = "/components/schemas/OwnerCategory"), output, "encoding OwnerCategory"; direction = :neutral)
end
Base.string(value::OwnerCategory) = string(value.value)
