@doc "    NonSequentialTimeSeriesOwnerCategory\n\nWhether the owner is a component or a supplemental attribute."
struct NonSequentialTimeSeriesOwnerCategory
    value::String
    function NonSequentialTimeSeriesOwnerCategory(value::String)
        value in ("Component","SupplementalAttribute") || throw(ArgumentError("invalid NonSequentialTimeSeriesOwnerCategory value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{NonSequentialTimeSeriesOwnerCategory}, value) = _decode(NonSequentialTimeSeriesOwnerCategory, value, true)
function _decode(::Type{NonSequentialTimeSeriesOwnerCategory}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/NonSequentialTimeSeries/properties/owner_category"), value, "decoding NonSequentialTimeSeriesOwnerCategory"; direction = :neutral)
    return NonSequentialTimeSeriesOwnerCategory(_decode(String, value, _openapi_validate))
end
function _encode(value::NonSequentialTimeSeriesOwnerCategory)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/NonSequentialTimeSeries/properties/owner_category"), output, "encoding NonSequentialTimeSeriesOwnerCategory"; direction = :neutral)
end
Base.string(value::NonSequentialTimeSeriesOwnerCategory) = string(value.value)
