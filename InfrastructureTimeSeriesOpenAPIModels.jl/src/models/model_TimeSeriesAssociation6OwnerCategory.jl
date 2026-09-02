@doc "    TimeSeriesAssociation6OwnerCategory\n\nWhether the owner is a component or a supplemental attribute."
struct TimeSeriesAssociation6OwnerCategory
    value::String
    function TimeSeriesAssociation6OwnerCategory(value::String)
        value in ("Component","SupplementalAttribute") || throw(ArgumentError("invalid TimeSeriesAssociation6OwnerCategory value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TimeSeriesAssociation6OwnerCategory}, value) = _decode(TimeSeriesAssociation6OwnerCategory, value, true)
function _decode(::Type{TimeSeriesAssociation6OwnerCategory}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesAssociation/oneOf/5/properties/owner_category"), value, "decoding TimeSeriesAssociation6OwnerCategory"; direction = :neutral)
    return TimeSeriesAssociation6OwnerCategory(_decode(String, value, _openapi_validate))
end
function _encode(value::TimeSeriesAssociation6OwnerCategory)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesAssociation/oneOf/5/properties/owner_category"), output, "encoding TimeSeriesAssociation6OwnerCategory"; direction = :neutral)
end
Base.string(value::TimeSeriesAssociation6OwnerCategory) = string(value.value)
