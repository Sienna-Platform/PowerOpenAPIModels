"""
    FixedDCSource

Parameters of a Fixed DC Source that returns a fixed DC voltage

  - `voltage`: Voltage (V)
"""
Base.@kwdef struct FixedDCSource <: APIModel
    voltage::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{FixedDCSource}, value) = _decode(FixedDCSource, value, true)
function _decode(::Type{FixedDCSource}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-fe0fc857259c86c3c845.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding FixedDCSource";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "FixedDCSource")
    _openapi_field_voltage = _decode(
        Float64,
        _required(_openapi_object, "voltage", "FixedDCSource"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("voltage",) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return FixedDCSource(;
        voltage=_openapi_field_voltage,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::FixedDCSource)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.voltage isa Absent ||
        (_openapi_output["voltage"] = _encode(_openapi_value.voltage))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(
            ArgumentError(
                "additional property conflicts with declared field: " * _openapi_key,
            ),
        )
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-fe0fc857259c86c3c845.json",
            pointer="",
        ),
        _openapi_output,
        "encoding FixedDCSource";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::FixedDCSource)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.voltage isa Absent ||
        push!(_openapi_output, "voltage" => _openapi_value.voltage)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
