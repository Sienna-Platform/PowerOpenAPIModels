"""
    AverageConverter

Parameters of an average converter model

  - `rated_voltage`: Rated voltage (V)
  - `rated_current`: Rated current (A)
"""
Base.@kwdef struct AverageConverter <: APIModel
    rated_voltage::Float64
    rated_current::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{AverageConverter}, value) = _decode(AverageConverter, value, true)
function _decode(::Type{AverageConverter}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-85b2ba8ac514cd37f2da.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding AverageConverter";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "AverageConverter")
    _openapi_field_rated_voltage = _decode(
        Float64,
        _required(_openapi_object, "rated_voltage", "AverageConverter"),
        false,
    )
    _openapi_field_rated_current = _decode(
        Float64,
        _required(_openapi_object, "rated_current", "AverageConverter"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("rated_voltage", "rated_current") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return AverageConverter(;
        rated_voltage=_openapi_field_rated_voltage,
        rated_current=_openapi_field_rated_current,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::AverageConverter)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.rated_voltage isa Absent || (
        _openapi_output["rated_voltage"] =
            _encode_unvalidated(_openapi_value.rated_voltage)
    )
    _openapi_value.rated_current isa Absent || (
        _openapi_output["rated_current"] =
            _encode_unvalidated(_openapi_value.rated_current)
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
_encode(_openapi_value::AverageConverter) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-85b2ba8ac514cd37f2da.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding AverageConverter";
    direction=:neutral,
)

function _form_fields(_openapi_value::AverageConverter)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.rated_voltage isa Absent ||
        push!(_openapi_output, "rated_voltage" => _openapi_value.rated_voltage)
    _openapi_value.rated_current isa Absent ||
        push!(_openapi_output, "rated_current" => _openapi_value.rated_current)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
