@doc "    TimeSeriesAssociation1OwnerCategory\n\nWhether the owner is a component or a supplemental attribute."
struct TimeSeriesAssociation1OwnerCategory
    value::String
    function TimeSeriesAssociation1OwnerCategory(value::String)
        value in ("Component","SupplementalAttribute") || throw(ArgumentError("invalid TimeSeriesAssociation1OwnerCategory value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TimeSeriesAssociation1OwnerCategory}, value) = _decode(TimeSeriesAssociation1OwnerCategory, value, true)
function _decode(::Type{TimeSeriesAssociation1OwnerCategory}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesAssociation/oneOf/0/properties/owner_category"), value, "decoding TimeSeriesAssociation1OwnerCategory"; direction = :neutral)
    return TimeSeriesAssociation1OwnerCategory(_decode(String, value, _openapi_validate))
end
function _encode(value::TimeSeriesAssociation1OwnerCategory)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesAssociation/oneOf/0/properties/owner_category"), output, "encoding TimeSeriesAssociation1OwnerCategory"; direction = :neutral)
end
Base.string(value::TimeSeriesAssociation1OwnerCategory) = string(value.value)
