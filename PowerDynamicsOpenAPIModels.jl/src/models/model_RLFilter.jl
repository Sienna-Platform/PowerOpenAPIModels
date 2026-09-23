"""
    RLFilter

Parameters of RL series filter in algebraic representation

  - `rf`: Series resistance in p.u. of converter filter to the grid
  - `lf`: Series inductance in p.u. of converter filter to the grid
"""
Base.@kwdef struct RLFilter <: APIModel
    rf::Float64
    lf::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{RLFilter}, value) = _decode(RLFilter, value, true)
function _decode(::Type{RLFilter}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-bb23878097772a3fcbf8.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding RLFilter";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "RLFilter")
    _openapi_field_rf =
        _decode(Float64, _required(_openapi_object, "rf", "RLFilter"), _openapi_validate)
    _openapi_field_lf =
        _decode(Float64, _required(_openapi_object, "lf", "RLFilter"), _openapi_validate)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("rf", "lf") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return RLFilter(;
        rf=_openapi_field_rf,
        lf=_openapi_field_lf,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::RLFilter)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.rf isa Absent || (_openapi_output["rf"] = _encode(_openapi_value.rf))
    _openapi_value.lf isa Absent || (_openapi_output["lf"] = _encode(_openapi_value.lf))
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
            resource="https://openapi.invalid/schema/external-bb23878097772a3fcbf8.json",
            pointer="",
        ),
        _openapi_output,
        "encoding RLFilter";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::RLFilter)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.rf isa Absent || push!(_openapi_output, "rf" => _openapi_value.rf)
    _openapi_value.lf isa Absent || push!(_openapi_output, "lf" => _openapi_value.lf)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
