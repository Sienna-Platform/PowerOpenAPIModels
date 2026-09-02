@doc "    TimeSeriesAssociation3OwnerCategory\n\nWhether the owner is a component or a supplemental attribute."
struct TimeSeriesAssociation3OwnerCategory
    value::String
    function TimeSeriesAssociation3OwnerCategory(value::String)
        value in ("Component","SupplementalAttribute") || throw(ArgumentError("invalid TimeSeriesAssociation3OwnerCategory value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TimeSeriesAssociation3OwnerCategory}, value) = _decode(TimeSeriesAssociation3OwnerCategory, value, true)
function _decode(::Type{TimeSeriesAssociation3OwnerCategory}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesAssociation/oneOf/2/properties/owner_category"), value, "decoding TimeSeriesAssociation3OwnerCategory"; direction = :neutral)
    return TimeSeriesAssociation3OwnerCategory(_decode(String, value, _openapi_validate))
end
function _encode(value::TimeSeriesAssociation3OwnerCategory)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesAssociation/oneOf/2/properties/owner_category"), output, "encoding TimeSeriesAssociation3OwnerCategory"; direction = :neutral)
end
Base.string(value::TimeSeriesAssociation3OwnerCategory) = string(value.value)
