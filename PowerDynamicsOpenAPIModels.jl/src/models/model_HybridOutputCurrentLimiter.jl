"""
    HybridOutputCurrentLimiter

Parameters of Hybrid Current Controller Limiter. Regulates the magnitude of the inverter output current, but with a closed loop feedback regulated by a virtual impedance which provides ant-windup. Described in: Novel Hybrid Current Limiter for Grid-Forming Inverter Control During Unbalanced Faults by Baeckland and Seo, 2023

  - `i_max`: Maximum limit on current controller input current
  - `rv`: Real part of the virtual impedance
  - `lv`: Imaginary part of the virtual impedance
"""
Base.@kwdef struct HybridOutputCurrentLimiter <: APIModel
    i_max::Float64
    rv::Float64
    lv::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{HybridOutputCurrentLimiter}, value) =
    _decode(HybridOutputCurrentLimiter, value, true)
function _decode(::Type{HybridOutputCurrentLimiter}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-b1b39e929db9810faf15.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding HybridOutputCurrentLimiter";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "HybridOutputCurrentLimiter")
    _openapi_field_i_max = _decode(
        Float64,
        _required(_openapi_object, "I_max", "HybridOutputCurrentLimiter"),
        _openapi_validate,
    )
    _openapi_field_rv = _decode(
        Float64,
        _required(_openapi_object, "rv", "HybridOutputCurrentLimiter"),
        _openapi_validate,
    )
    _openapi_field_lv = _decode(
        Float64,
        _required(_openapi_object, "lv", "HybridOutputCurrentLimiter"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("I_max", "rv", "lv") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return HybridOutputCurrentLimiter(;
        i_max=_openapi_field_i_max,
        rv=_openapi_field_rv,
        lv=_openapi_field_lv,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::HybridOutputCurrentLimiter)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.i_max isa Absent ||
        (_openapi_output["I_max"] = _encode(_openapi_value.i_max))
    _openapi_value.rv isa Absent || (_openapi_output["rv"] = _encode(_openapi_value.rv))
    _openapi_value.lv isa Absent || (_openapi_output["lv"] = _encode(_openapi_value.lv))
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
            resource="https://openapi.invalid/schema/external-b1b39e929db9810faf15.json",
            pointer="",
        ),
        _openapi_output,
        "encoding HybridOutputCurrentLimiter";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::HybridOutputCurrentLimiter)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.i_max isa Absent ||
        push!(_openapi_output, "I_max" => _openapi_value.i_max)
    _openapi_value.rv isa Absent || push!(_openapi_output, "rv" => _openapi_value.rv)
    _openapi_value.lv isa Absent || push!(_openapi_output, "lv" => _openapi_value.lv)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
