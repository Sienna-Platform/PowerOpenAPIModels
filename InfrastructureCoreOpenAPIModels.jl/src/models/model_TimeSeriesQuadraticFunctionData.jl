"""
    TimeSeriesQuadraticFunctionData

Time-series-backed variant of `QuadraticFunctionData`. In place of inline coefficients it carries `association_id`, referencing a stored series that supplies them at each step; use it when the coefficients change over time.

  - `association_id`: Store-minted id of the time series association whose values supply this function data over time. Resolved against the accompanying time series store on read; minted by that store and meaningful only against it, never assigned by a document producer.
"""
Base.@kwdef struct TimeSeriesQuadraticFunctionData <: APIModel
    function_type::String = "TIME_SERIES_QUADRATIC"
    association_id::Int64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{TimeSeriesQuadraticFunctionData}, value) =
    _decode(TimeSeriesQuadraticFunctionData, value, true)
function _decode(
    ::Type{TimeSeriesQuadraticFunctionData},
    _openapi_raw,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-50d5243393bb9d77da58.json",
            pointer="/\$defs/TimeSeriesQuadraticFunctionData",
        ),
        _openapi_raw,
        "decoding TimeSeriesQuadraticFunctionData";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "TimeSeriesQuadraticFunctionData")
    _openapi_field_function_type = _decode(
        String,
        _required(_openapi_object, "function_type", "TimeSeriesQuadraticFunctionData"),
        false,
    )
    _openapi_field_association_id = _decode(
        Int64,
        _required(_openapi_object, "association_id", "TimeSeriesQuadraticFunctionData"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("function_type", "association_id") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return TimeSeriesQuadraticFunctionData(;
        function_type=_openapi_field_function_type,
        association_id=_openapi_field_association_id,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::TimeSeriesQuadraticFunctionData)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.function_type isa Absent || (
        _openapi_output["function_type"] =
            _encode_unvalidated(_openapi_value.function_type)
    )
    _openapi_value.association_id isa Absent || (
        _openapi_output["association_id"] =
            _encode_unvalidated(_openapi_value.association_id)
    )
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(
            ArgumentError(
                "additional property conflicts with declared field: " * _openapi_key,
            ),
        )
        _openapi_output[_openapi_key] = _encode_unvalidated(_openapi_item)
    end
    return _openapi_output
end
_encode(_openapi_value::TimeSeriesQuadraticFunctionData) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-50d5243393bb9d77da58.json",
        pointer="/\$defs/TimeSeriesQuadraticFunctionData",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding TimeSeriesQuadraticFunctionData";
    direction=:neutral,
)

function _form_fields(_openapi_value::TimeSeriesQuadraticFunctionData)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.function_type isa Absent ||
        push!(_openapi_output, "function_type" => _openapi_value.function_type)
    _openapi_value.association_id isa Absent ||
        push!(_openapi_output, "association_id" => _openapi_value.association_id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
