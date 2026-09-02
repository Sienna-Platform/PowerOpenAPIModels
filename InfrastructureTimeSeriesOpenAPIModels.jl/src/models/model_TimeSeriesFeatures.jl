@doc "    TimeSeriesFeatures\n\nUser-defined key/value tags forming part of a series' identity. A map, matching the backing store's feature-map type (a BTreeMap whose sort order is load-bearing, because the hash of the feature map keys the catalog's uniqueness index). The excluded property names each already name a field of a time series or of the tuple that addresses one: consumers routinely spread a feature map into keyword arguments, where a feature called `name` or `resolution` would shadow the real field and silently change what a query means. The comparison is exact and case-sensitive — `resolution` is reserved, `Resolution` is not."
Base.@kwdef struct TimeSeriesFeatures
    additional_properties::Dict{String,TimeSeriesFeatureValue} = Dict{String,TimeSeriesFeatureValue}()
end
_decode(::Type{TimeSeriesFeatures}, value) = _decode(TimeSeriesFeatures, value, true)
function _decode(::Type{TimeSeriesFeatures}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesFeatures"), _openapi_raw, "decoding TimeSeriesFeatures"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "TimeSeriesFeatures")
    _openapi_additional_properties = Dict{String,TimeSeriesFeatureValue}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in () && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(TimeSeriesFeatureValue, _openapi_item, _openapi_validate)
    end
    return TimeSeriesFeatures(; additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::TimeSeriesFeatures)
    _openapi_output = JSON.Object{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesFeatures"), _openapi_output, "encoding TimeSeriesFeatures"; direction = :neutral)
end

function _form_fields(_openapi_value::TimeSeriesFeatures)
    _openapi_output = Pair{String,Any}[]
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
