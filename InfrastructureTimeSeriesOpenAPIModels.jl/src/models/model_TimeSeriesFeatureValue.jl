"""
    TimeSeriesFeatureValue

One feature value. Four kinds, matching the backing store's feature-value type: int, float, bool, str. `anyOf` rather than `oneOf` is required, not stylistic: JSON Schema's `integer` is a subset of `number`, so an integer instance matches both branches and `oneOf` — which demands exactly one match — would reject every integer feature. A float feature is compared and hashed by its bit pattern rather than by IEEE comparison, so 0.0 and -0.0 are two different series; NaN and negative zero are rejected on write because the catalog cannot store either faithfully.
"""
struct TimeSeriesFeatureValue <: OneOfAPIModel
    value::Union{Bool, Float64, Int64, String}
end
_decode(::Type{TimeSeriesFeatureValue}, value) =
    _decode(TimeSeriesFeatureValue, value, true)
function _decode(::Type{TimeSeriesFeatureValue}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-003bf0ce6510b65f9b25.json",
            pointer="/\$defs/TimeSeriesFeatureValue",
        ),
        value,
        "decoding TimeSeriesFeatureValue";
        direction=:neutral,
    )
    matches = Any[]
    if _schema_valid(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-003bf0ce6510b65f9b25.json",
            pointer="/\$defs/TimeSeriesFeatureValue/anyOf/0",
        ),
        value;
        direction=:neutral,
    )
        try
            push!(matches, _decode(Int64, value, false))
        catch error
            error isa DecodeError || rethrow()
        end
    end
    if _schema_valid(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-003bf0ce6510b65f9b25.json",
            pointer="/\$defs/TimeSeriesFeatureValue/anyOf/1",
        ),
        value;
        direction=:neutral,
    )
        try
            push!(matches, _decode(Float64, value, false))
        catch error
            error isa DecodeError || rethrow()
        end
    end
    if _schema_valid(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-003bf0ce6510b65f9b25.json",
            pointer="/\$defs/TimeSeriesFeatureValue/anyOf/2",
        ),
        value;
        direction=:neutral,
    )
        try
            push!(matches, _decode(Bool, value, false))
        catch error
            error isa DecodeError || rethrow()
        end
    end
    if _schema_valid(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-003bf0ce6510b65f9b25.json",
            pointer="/\$defs/TimeSeriesFeatureValue/anyOf/3",
        ),
        value;
        direction=:neutral,
    )
        try
            push!(matches, _decode(String, value, false))
        catch error
            error isa DecodeError || rethrow()
        end
    end
    isempty(matches) &&
        throw(DecodeError("anyOf value did not select a variant of TimeSeriesFeatureValue"))
    return TimeSeriesFeatureValue(first(matches))
end
function _encode_unvalidated(value::TimeSeriesFeatureValue)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::TimeSeriesFeatureValue) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-003bf0ce6510b65f9b25.json",
        pointer="/\$defs/TimeSeriesFeatureValue",
    ),
    _encode_unvalidated(value),
    "encoding TimeSeriesFeatureValue";
    direction=:neutral,
)
