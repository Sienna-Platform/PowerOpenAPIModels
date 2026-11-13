"""
    RLFilter

Parameters of RL series filter in algebraic representation

  - `id`: Unique integer identifier for this component
  - `rf`: Series resistance in p.u. of converter filter to the grid. Units: pu.
  - `lf`: Series inductance in p.u. of converter filter to the grid. Units: pu.
"""
Base.@kwdef struct RLFilter <: APIModel
    id::Int64
    rf::Float64
    lf::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{RLFilter}, value) = _decode(RLFilter, value, true)
function _decode(::Type{RLFilter}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0dd051a8fba0aafc913a.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding RLFilter";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "RLFilter")
    _openapi_field_id =
        _decode_zoned(Int64, _required(_openapi_object, "id", "RLFilter"), false)
    _openapi_field_rf =
        _decode_zoned(Float64, _required(_openapi_object, "rf", "RLFilter"), false)
    _openapi_field_lf =
        _decode_zoned(Float64, _required(_openapi_object, "lf", "RLFilter"), false)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("id", "rf", "lf") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return RLFilter(;
        id=_openapi_field_id,
        rf=_openapi_field_rf,
        lf=_openapi_field_lf,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::RLFilter)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.rf isa Absent ||
        (_openapi_output["rf"] = _encode_unvalidated(_openapi_value.rf))
    _openapi_value.lf isa Absent ||
        (_openapi_output["lf"] = _encode_unvalidated(_openapi_value.lf))
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
_encode(_openapi_value::RLFilter) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-0dd051a8fba0aafc913a.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding RLFilter";
    direction=:neutral,
)

function _form_fields(_openapi_value::RLFilter)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.rf isa Absent || push!(_openapi_output, "rf" => _openapi_value.rf)
    _openapi_value.lf isa Absent || push!(_openapi_output, "lf" => _openapi_value.lf)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
