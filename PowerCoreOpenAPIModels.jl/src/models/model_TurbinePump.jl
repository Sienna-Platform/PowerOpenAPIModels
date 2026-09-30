"""
    TurbinePump

A pair of values, one for the turbine (generating) mode and one for the pump (charging) mode of a pumped hydro unit.
"""
Base.@kwdef struct TurbinePump <: APIModel
    turbine::Float64
    pump::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{TurbinePump}, value) = _decode(TurbinePump, value, true)
function _decode(::Type{TurbinePump}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/TurbinePump",
        ),
        _openapi_raw,
        "decoding TurbinePump";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "TurbinePump")
    _openapi_field_turbine =
        _decode(Float64, _required(_openapi_object, "turbine", "TurbinePump"), false)
    _openapi_field_pump =
        _decode(Float64, _required(_openapi_object, "pump", "TurbinePump"), false)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("turbine", "pump") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return TurbinePump(;
        turbine=_openapi_field_turbine,
        pump=_openapi_field_pump,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::TurbinePump)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.turbine isa Absent ||
        (_openapi_output["turbine"] = _encode_unvalidated(_openapi_value.turbine))
    _openapi_value.pump isa Absent ||
        (_openapi_output["pump"] = _encode_unvalidated(_openapi_value.pump))
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
_encode(_openapi_value::TurbinePump) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
        pointer="/\$defs/TurbinePump",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding TurbinePump";
    direction=:neutral,
)

function _form_fields(_openapi_value::TurbinePump)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.turbine isa Absent ||
        push!(_openapi_output, "turbine" => _openapi_value.turbine)
    _openapi_value.pump isa Absent || push!(_openapi_output, "pump" => _openapi_value.pump)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
