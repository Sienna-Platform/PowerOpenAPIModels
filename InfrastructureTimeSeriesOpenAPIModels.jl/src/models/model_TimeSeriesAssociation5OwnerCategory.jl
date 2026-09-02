@doc "    TimeSeriesAssociation5OwnerCategory\n\nWhether the owner is a component or a supplemental attribute."
struct TimeSeriesAssociation5OwnerCategory
    value::String
    function TimeSeriesAssociation5OwnerCategory(value::String)
        value in ("Component","SupplementalAttribute") || throw(ArgumentError("invalid TimeSeriesAssociation5OwnerCategory value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TimeSeriesAssociation5OwnerCategory}, value) = _decode(TimeSeriesAssociation5OwnerCategory, value, true)
function _decode(::Type{TimeSeriesAssociation5OwnerCategory}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesAssociation/oneOf/4/properties/owner_category"), value, "decoding TimeSeriesAssociation5OwnerCategory"; direction = :neutral)
    return TimeSeriesAssociation5OwnerCategory(_decode(String, value, _openapi_validate))
end
function _encode(value::TimeSeriesAssociation5OwnerCategory)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesAssociation/oneOf/4/properties/owner_category"), output, "encoding TimeSeriesAssociation5OwnerCategory"; direction = :neutral)
end
Base.string(value::TimeSeriesAssociation5OwnerCategory) = string(value.value)
