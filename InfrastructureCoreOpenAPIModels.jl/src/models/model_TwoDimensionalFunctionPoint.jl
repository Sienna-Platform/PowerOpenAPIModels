"""
    TwoDimensionalFunctionPoint

A single point, given as its `x` and `y` coordinates.

  - `x`: Units: the wrapped function's input unit.
  - `y`: Units: the wrapped function's output unit.
"""
Base.@kwdef struct TwoDimensionalFunctionPoint <: APIModel
    x::Float64
    y::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{TwoDimensionalFunctionPoint}, value) =
    _decode(TwoDimensionalFunctionPoint, value, true)
function _decode(::Type{TwoDimensionalFunctionPoint}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-7de623570ee8edd1de00.json",
            pointer="/\$defs/TwoDimensionalFunctionPoint",
        ),
        _openapi_raw,
        "decoding TwoDimensionalFunctionPoint";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "TwoDimensionalFunctionPoint")
    _openapi_field_x = _decode(
        Float64,
        _required(_openapi_object, "x", "TwoDimensionalFunctionPoint"),
        false,
    )
    _openapi_field_y = _decode(
        Float64,
        _required(_openapi_object, "y", "TwoDimensionalFunctionPoint"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("x", "y") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return TwoDimensionalFunctionPoint(;
        x=_openapi_field_x,
        y=_openapi_field_y,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::TwoDimensionalFunctionPoint)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.x isa Absent ||
        (_openapi_output["x"] = _encode_unvalidated(_openapi_value.x))
    _openapi_value.y isa Absent ||
        (_openapi_output["y"] = _encode_unvalidated(_openapi_value.y))
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
_encode(_openapi_value::TwoDimensionalFunctionPoint) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-7de623570ee8edd1de00.json",
        pointer="/\$defs/TwoDimensionalFunctionPoint",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding TwoDimensionalFunctionPoint";
    direction=:neutral,
)

function _form_fields(_openapi_value::TwoDimensionalFunctionPoint)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.x isa Absent || push!(_openapi_output, "x" => _openapi_value.x)
    _openapi_value.y isa Absent || push!(_openapi_output, "y" => _openapi_value.y)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
