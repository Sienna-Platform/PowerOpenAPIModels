"""
    LCFilter

Parameters of a LCL filter outside the converter

  - `lf`: Filter inductance
  - `rf`: Filter resistance
  - `cf`: Filter capacitance
"""
Base.@kwdef struct LCFilter <: APIModel
    lf::Float64
    rf::Float64
    cf::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{LCFilter}, value) = _decode(LCFilter, value, true)
function _decode(::Type{LCFilter}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-845d14ba2ee4f1b551b7.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding LCFilter";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "LCFilter")
    _openapi_field_lf =
        _decode(Float64, _required(_openapi_object, "lf", "LCFilter"), false)
    _openapi_field_rf =
        _decode(Float64, _required(_openapi_object, "rf", "LCFilter"), false)
    _openapi_field_cf =
        _decode(Float64, _required(_openapi_object, "cf", "LCFilter"), false)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("lf", "rf", "cf") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return LCFilter(;
        lf=_openapi_field_lf,
        rf=_openapi_field_rf,
        cf=_openapi_field_cf,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::LCFilter)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.lf isa Absent ||
        (_openapi_output["lf"] = _encode_unvalidated(_openapi_value.lf))
    _openapi_value.rf isa Absent ||
        (_openapi_output["rf"] = _encode_unvalidated(_openapi_value.rf))
    _openapi_value.cf isa Absent ||
        (_openapi_output["cf"] = _encode_unvalidated(_openapi_value.cf))
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
_encode(_openapi_value::LCFilter) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-845d14ba2ee4f1b551b7.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding LCFilter";
    direction=:neutral,
)

function _form_fields(_openapi_value::LCFilter)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.lf isa Absent || push!(_openapi_output, "lf" => _openapi_value.lf)
    _openapi_value.rf isa Absent || push!(_openapi_output, "rf" => _openapi_value.rf)
    _openapi_value.cf isa Absent || push!(_openapi_output, "cf" => _openapi_value.cf)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
