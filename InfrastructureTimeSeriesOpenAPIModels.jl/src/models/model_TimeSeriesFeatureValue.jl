@doc "    TimeSeriesFeatureValue\n\nOne feature value. Four kinds, matching the backing store's feature-value type: int, float, bool, str. `anyOf` rather than `oneOf` is required, not stylistic: JSON Schema's `integer` is a subset of `number`, so an integer instance matches both branches and `oneOf` — which demands exactly one match — would reject every integer feature. A float feature is compared and hashed by its bit pattern rather than by IEEE comparison, so 0.0 and -0.0 are two different series; NaN and negative zero are rejected on write because the catalog cannot store either faithfully."
struct TimeSeriesFeatureValue
    value::Union{Bool,Float64,Int64,String}
end
_decode(::Type{TimeSeriesFeatureValue}, value) = _decode(TimeSeriesFeatureValue, value, true)
function _decode(::Type{TimeSeriesFeatureValue}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesFeatureValue"), value, "decoding TimeSeriesFeatureValue"; direction = :neutral)
    matches = Any[]
    if !_openapi_validate || _schema_valid(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesFeatureValue/anyOf/0"), value; direction = :neutral)
        try
            push!(matches, _decode(Int64, value, _openapi_validate))
        catch error
            error isa DecodeError || rethrow()
        end
    end
    if !_openapi_validate || _schema_valid(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesFeatureValue/anyOf/1"), value; direction = :neutral)
        try
            push!(matches, _decode(Float64, value, _openapi_validate))
        catch error
            error isa DecodeError || rethrow()
        end
    end
    if !_openapi_validate || _schema_valid(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesFeatureValue/anyOf/2"), value; direction = :neutral)
        try
            push!(matches, _decode(Bool, value, _openapi_validate))
        catch error
            error isa DecodeError || rethrow()
        end
    end
    if !_openapi_validate || _schema_valid(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesFeatureValue/anyOf/3"), value; direction = :neutral)
        try
            push!(matches, _decode(String, value, _openapi_validate))
        catch error
            error isa DecodeError || rethrow()
        end
    end
    isempty(matches) && throw(DecodeError("anyOf value did not select a variant of TimeSeriesFeatureValue"))
    return TimeSeriesFeatureValue(first(matches))
end
function _encode(value::TimeSeriesFeatureValue)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesFeatureValue"), output, "encoding TimeSeriesFeatureValue"; direction = :neutral)
end
