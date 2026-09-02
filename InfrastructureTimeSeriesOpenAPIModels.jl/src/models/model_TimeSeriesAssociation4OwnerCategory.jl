@doc "    TimeSeriesAssociation4OwnerCategory\n\nWhether the owner is a component or a supplemental attribute."
struct TimeSeriesAssociation4OwnerCategory
    value::String
    function TimeSeriesAssociation4OwnerCategory(value::String)
        value in ("Component","SupplementalAttribute") || throw(ArgumentError("invalid TimeSeriesAssociation4OwnerCategory value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TimeSeriesAssociation4OwnerCategory}, value) = _decode(TimeSeriesAssociation4OwnerCategory, value, true)
function _decode(::Type{TimeSeriesAssociation4OwnerCategory}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesAssociation/oneOf/3/properties/owner_category"), value, "decoding TimeSeriesAssociation4OwnerCategory"; direction = :neutral)
    return TimeSeriesAssociation4OwnerCategory(_decode(String, value, _openapi_validate))
end
function _encode(value::TimeSeriesAssociation4OwnerCategory)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesAssociation/oneOf/3/properties/owner_category"), output, "encoding TimeSeriesAssociation4OwnerCategory"; direction = :neutral)
end
Base.string(value::TimeSeriesAssociation4OwnerCategory) = string(value.value)
