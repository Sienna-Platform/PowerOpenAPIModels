@doc "    DeterministicSingleTimeSeriesOwnerCategory\n\nWhether the owner is a component or a supplemental attribute."
struct DeterministicSingleTimeSeriesOwnerCategory
    value::String
    function DeterministicSingleTimeSeriesOwnerCategory(value::String)
        value in ("Component","SupplementalAttribute") || throw(ArgumentError("invalid DeterministicSingleTimeSeriesOwnerCategory value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{DeterministicSingleTimeSeriesOwnerCategory}, value) = _decode(DeterministicSingleTimeSeriesOwnerCategory, value, true)
function _decode(::Type{DeterministicSingleTimeSeriesOwnerCategory}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-d907e2d1c7ab387eab6d.json", pointer = "/components/schemas/DeterministicSingleTimeSeries/properties/owner_category"), value, "decoding DeterministicSingleTimeSeriesOwnerCategory"; direction = :neutral)
    return DeterministicSingleTimeSeriesOwnerCategory(_decode(String, value, _openapi_validate))
end
function _encode(value::DeterministicSingleTimeSeriesOwnerCategory)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-d907e2d1c7ab387eab6d.json", pointer = "/components/schemas/DeterministicSingleTimeSeries/properties/owner_category"), output, "encoding DeterministicSingleTimeSeriesOwnerCategory"; direction = :neutral)
end
Base.string(value::DeterministicSingleTimeSeriesOwnerCategory) = string(value.value)
