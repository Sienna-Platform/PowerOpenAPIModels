"""
    PiecewiseLinearData

Data for a piecewise linear function defined by (x, y) points and interpolated linearly between consecutive ones. The y values are absolute values at each x, not per-segment slopes; use `PiecewiseStepData` when the data gives per-segment rates. Points run in ascending x order, and two of them define one segment.
"""
Base.@kwdef struct PiecewiseLinearData <: APIModel
    function_type::String = "PIECEWISE_LINEAR"
    points::Vector{XYCoords}
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{PiecewiseLinearData}, value) = _decode(PiecewiseLinearData, value, true)
function _decode(::Type{PiecewiseLinearData}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-50d5243393bb9d77da58.json",
            pointer="/\$defs/PiecewiseLinearData",
        ),
        _openapi_raw,
        "decoding PiecewiseLinearData";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "PiecewiseLinearData")
    _openapi_field_function_type = _decode(
        String,
        _required(_openapi_object, "function_type", "PiecewiseLinearData"),
        false,
    )
    _openapi_field_points = _decode(
        Vector{XYCoords},
        _required(_openapi_object, "points", "PiecewiseLinearData"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("function_type", "points") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return PiecewiseLinearData(;
        function_type=_openapi_field_function_type,
        points=_openapi_field_points,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::PiecewiseLinearData)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.function_type isa Absent || (
        _openapi_output["function_type"] =
            _encode_unvalidated(_openapi_value.function_type)
    )
    _openapi_value.points isa Absent ||
        (_openapi_output["points"] = _encode_unvalidated(_openapi_value.points))
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
_encode(_openapi_value::PiecewiseLinearData) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-50d5243393bb9d77da58.json",
        pointer="/\$defs/PiecewiseLinearData",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding PiecewiseLinearData";
    direction=:neutral,
)

function _form_fields(_openapi_value::PiecewiseLinearData)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.function_type isa Absent ||
        push!(_openapi_output, "function_type" => _openapi_value.function_type)
    _openapi_value.points isa Absent ||
        push!(_openapi_output, "points" => _openapi_value.points)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
