@doc "    TimeSeriesAssociation2OwnerCategory\n\nWhether the owner is a component or a supplemental attribute."
struct TimeSeriesAssociation2OwnerCategory
    value::String
    function TimeSeriesAssociation2OwnerCategory(value::String)
        value in ("Component","SupplementalAttribute") || throw(ArgumentError("invalid TimeSeriesAssociation2OwnerCategory value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{TimeSeriesAssociation2OwnerCategory}, value) = _decode(TimeSeriesAssociation2OwnerCategory, value, true)
function _decode(::Type{TimeSeriesAssociation2OwnerCategory}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesAssociation/oneOf/1/properties/owner_category"), value, "decoding TimeSeriesAssociation2OwnerCategory"; direction = :neutral)
    return TimeSeriesAssociation2OwnerCategory(_decode(String, value, _openapi_validate))
end
function _encode(value::TimeSeriesAssociation2OwnerCategory)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesAssociation/oneOf/1/properties/owner_category"), output, "encoding TimeSeriesAssociation2OwnerCategory"; direction = :neutral)
end
Base.string(value::TimeSeriesAssociation2OwnerCategory) = string(value.value)
