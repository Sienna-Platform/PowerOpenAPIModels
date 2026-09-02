@doc "    SingleTimeSeriesOwnerCategory\n\nWhether the owner is a component or a supplemental attribute."
struct SingleTimeSeriesOwnerCategory
    value::String
    function SingleTimeSeriesOwnerCategory(value::String)
        value in ("Component","SupplementalAttribute") || throw(ArgumentError("invalid SingleTimeSeriesOwnerCategory value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{SingleTimeSeriesOwnerCategory}, value) = _decode(SingleTimeSeriesOwnerCategory, value, true)
function _decode(::Type{SingleTimeSeriesOwnerCategory}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/SingleTimeSeries/properties/owner_category"), value, "decoding SingleTimeSeriesOwnerCategory"; direction = :neutral)
    return SingleTimeSeriesOwnerCategory(_decode(String, value, _openapi_validate))
end
function _encode(value::SingleTimeSeriesOwnerCategory)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/SingleTimeSeries/properties/owner_category"), output, "encoding SingleTimeSeriesOwnerCategory"; direction = :neutral)
end
Base.string(value::SingleTimeSeriesOwnerCategory) = string(value.value)
