@doc "    TimeSeriesPiecewiseStepData\n\nTime-series-backed variant of `PiecewiseStepData`. In place of inline coordinate vectors it carries `association_id`, referencing a stored series that supplies them at each step; use it when the segments change over time.\n\n- `association_id`: Store-minted id of the time series association whose values supply this function data over time. Resolved against the accompanying time series store on read; minted by that store and meaningful only against it, never assigned by a document producer."
Base.@kwdef struct TimeSeriesPiecewiseStepData
    association_id::Int64
    function_type::String
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{TimeSeriesPiecewiseStepData}, value) = _decode(TimeSeriesPiecewiseStepData, value, true)
function _decode(::Type{TimeSeriesPiecewiseStepData}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/TimeSeriesPiecewiseStepData"), _openapi_raw, "decoding TimeSeriesPiecewiseStepData"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "TimeSeriesPiecewiseStepData")
    _openapi_field_association_id = _decode(Int64, _required(_openapi_object, "association_id", "TimeSeriesPiecewiseStepData"), _openapi_validate)
    _openapi_field_function_type = _decode(String, _required(_openapi_object, "function_type", "TimeSeriesPiecewiseStepData"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("association_id","function_type") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return TimeSeriesPiecewiseStepData(; association_id = _openapi_field_association_id, function_type = _openapi_field_function_type, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::TimeSeriesPiecewiseStepData)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.association_id isa Absent || (_openapi_output["association_id"] = _encode(_openapi_value.association_id))
    _openapi_value.function_type isa Absent || (_openapi_output["function_type"] = _encode(_openapi_value.function_type))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/TimeSeriesPiecewiseStepData"), _openapi_output, "encoding TimeSeriesPiecewiseStepData"; direction = :neutral)
end

function _form_fields(_openapi_value::TimeSeriesPiecewiseStepData)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.association_id isa Absent || push!(_openapi_output, "association_id" => _openapi_value.association_id)
    _openapi_value.function_type isa Absent || push!(_openapi_output, "function_type" => _openapi_value.function_type)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
