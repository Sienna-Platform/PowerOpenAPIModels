"""
    LCLFilter

Parameters of a LCL filter outside the converter, the states are in the grid's reference frame

  - `lf`: Series inductance of converter filter
  - `rf`: Series resistance of converter filter
  - `cf`: Shunt capacitance of converter filter
  - `lg`: Series inductance of converter filter to the grid
  - `rg`: Series resistance of converter filter to the grid
"""
Base.@kwdef struct LCLFilter <: APIModel
    lf::Float64
    rf::Float64
    cf::Float64
    lg::Float64
    rg::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{LCLFilter}, value) = _decode(LCLFilter, value, true)
function _decode(::Type{LCLFilter}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0fa4e01aa3835b75a88c.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding LCLFilter";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "LCLFilter")
    _openapi_field_lf =
        _decode(Float64, _required(_openapi_object, "lf", "LCLFilter"), _openapi_validate)
    _openapi_field_rf =
        _decode(Float64, _required(_openapi_object, "rf", "LCLFilter"), _openapi_validate)
    _openapi_field_cf =
        _decode(Float64, _required(_openapi_object, "cf", "LCLFilter"), _openapi_validate)
    _openapi_field_lg =
        _decode(Float64, _required(_openapi_object, "lg", "LCLFilter"), _openapi_validate)
    _openapi_field_rg =
        _decode(Float64, _required(_openapi_object, "rg", "LCLFilter"), _openapi_validate)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("lf", "rf", "cf", "lg", "rg") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return LCLFilter(;
        lf=_openapi_field_lf,
        rf=_openapi_field_rf,
        cf=_openapi_field_cf,
        lg=_openapi_field_lg,
        rg=_openapi_field_rg,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::LCLFilter)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.lf isa Absent || (_openapi_output["lf"] = _encode(_openapi_value.lf))
    _openapi_value.rf isa Absent || (_openapi_output["rf"] = _encode(_openapi_value.rf))
    _openapi_value.cf isa Absent || (_openapi_output["cf"] = _encode(_openapi_value.cf))
    _openapi_value.lg isa Absent || (_openapi_output["lg"] = _encode(_openapi_value.lg))
    _openapi_value.rg isa Absent || (_openapi_output["rg"] = _encode(_openapi_value.rg))
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
            resource="https://openapi.invalid/schema/external-0fa4e01aa3835b75a88c.json",
            pointer="",
        ),
        _openapi_output,
        "encoding LCLFilter";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::LCLFilter)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.lf isa Absent || push!(_openapi_output, "lf" => _openapi_value.lf)
    _openapi_value.rf isa Absent || push!(_openapi_output, "rf" => _openapi_value.rf)
    _openapi_value.cf isa Absent || push!(_openapi_output, "cf" => _openapi_value.cf)
    _openapi_value.lg isa Absent || push!(_openapi_output, "lg" => _openapi_value.lg)
    _openapi_value.rg isa Absent || push!(_openapi_output, "rg" => _openapi_value.rg)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
