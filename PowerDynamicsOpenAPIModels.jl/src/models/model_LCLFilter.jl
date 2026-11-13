"""
    LCLFilter

Parameters of a LCL filter outside the converter, the states are in the grid's reference frame

  - `id`: Unique integer identifier for this component
  - `lf`: Series inductance of converter filter. Units: pu.
  - `rf`: Series resistance of converter filter. Units: pu.
  - `cf`: Shunt capacitance of converter filter. Units: pu.
  - `lg`: Series inductance of converter filter to the grid. Units: pu.
  - `rg`: Series resistance of converter filter to the grid. Units: pu.
"""
Base.@kwdef struct LCLFilter <: APIModel
    id::Int64
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
            resource="https://openapi.invalid/schema/external-dcb3fe37c2577cdc1f2a.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding LCLFilter";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "LCLFilter")
    _openapi_field_id =
        _decode_zoned(Int64, _required(_openapi_object, "id", "LCLFilter"), false)
    _openapi_field_lf =
        _decode_zoned(Float64, _required(_openapi_object, "lf", "LCLFilter"), false)
    _openapi_field_rf =
        _decode_zoned(Float64, _required(_openapi_object, "rf", "LCLFilter"), false)
    _openapi_field_cf =
        _decode_zoned(Float64, _required(_openapi_object, "cf", "LCLFilter"), false)
    _openapi_field_lg =
        _decode_zoned(Float64, _required(_openapi_object, "lg", "LCLFilter"), false)
    _openapi_field_rg =
        _decode_zoned(Float64, _required(_openapi_object, "rg", "LCLFilter"), false)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("id", "lf", "rf", "cf", "lg", "rg") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return LCLFilter(;
        id=_openapi_field_id,
        lf=_openapi_field_lf,
        rf=_openapi_field_rf,
        cf=_openapi_field_cf,
        lg=_openapi_field_lg,
        rg=_openapi_field_rg,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::LCLFilter)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.lf isa Absent ||
        (_openapi_output["lf"] = _encode_unvalidated(_openapi_value.lf))
    _openapi_value.rf isa Absent ||
        (_openapi_output["rf"] = _encode_unvalidated(_openapi_value.rf))
    _openapi_value.cf isa Absent ||
        (_openapi_output["cf"] = _encode_unvalidated(_openapi_value.cf))
    _openapi_value.lg isa Absent ||
        (_openapi_output["lg"] = _encode_unvalidated(_openapi_value.lg))
    _openapi_value.rg isa Absent ||
        (_openapi_output["rg"] = _encode_unvalidated(_openapi_value.rg))
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
_encode(_openapi_value::LCLFilter) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-dcb3fe37c2577cdc1f2a.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding LCLFilter";
    direction=:neutral,
)

function _form_fields(_openapi_value::LCLFilter)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.lf isa Absent || push!(_openapi_output, "lf" => _openapi_value.lf)
    _openapi_value.rf isa Absent || push!(_openapi_output, "rf" => _openapi_value.rf)
    _openapi_value.cf isa Absent || push!(_openapi_output, "cf" => _openapi_value.cf)
    _openapi_value.lg isa Absent || push!(_openapi_output, "lg" => _openapi_value.lg)
    _openapi_value.rg isa Absent || push!(_openapi_output, "rg" => _openapi_value.rg)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
