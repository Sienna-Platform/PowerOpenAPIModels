@doc "    TimeSeriesAssociation6Features\n\nUser-defined key/value tags that are part of the series' identity: two series differing only by a feature are distinct series. Feature names that collide with a field of a series or of the tuple addressing one are rejected."
Base.@kwdef struct TimeSeriesAssociation6Features
    additional_properties::Dict{String,TimeSeriesFeatureValue} = Dict{String,TimeSeriesFeatureValue}()
end
_decode(::Type{TimeSeriesAssociation6Features}, value) = _decode(TimeSeriesAssociation6Features, value, true)
function _decode(::Type{TimeSeriesAssociation6Features}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesAssociation/oneOf/5/properties/features"), _openapi_raw, "decoding TimeSeriesAssociation6Features"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "TimeSeriesAssociation6Features")
    _openapi_additional_properties = Dict{String,TimeSeriesFeatureValue}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in () && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(TimeSeriesFeatureValue, _openapi_item, _openapi_validate)
    end
    return TimeSeriesAssociation6Features(; additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::TimeSeriesAssociation6Features)
    _openapi_output = JSON.Object{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/TimeSeriesAssociation/oneOf/5/properties/features"), _openapi_output, "encoding TimeSeriesAssociation6Features"; direction = :neutral)
end

function _form_fields(_openapi_value::TimeSeriesAssociation6Features)
    _openapi_output = Pair{String,Any}[]
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
