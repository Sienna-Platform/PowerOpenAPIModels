"""
    TGSimple

Parameters of a Simple one-state Turbine Governor

  - `id`: Unique integer identifier for this component
  - `d_t`: Inverse droop parameter
  - `tm`: Turbine governor low-pass time constant
  - `p_ref`: Reference power set-point
"""
Base.@kwdef struct TGSimple <: APIModel
    id::Int64
    d_t::Float64
    tm::Float64
    p_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{TGSimple}, value) = _decode(TGSimple, value, true)
function _decode(::Type{TGSimple}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0b6bf984324c22c1ca98.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding TGSimple";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "TGSimple")
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "TGSimple"), false)
    _openapi_field_d_t =
        _decode(Float64, _required(_openapi_object, "d_t", "TGSimple"), false)
    _openapi_field_tm =
        _decode(Float64, _required(_openapi_object, "Tm", "TGSimple"), false)
    _openapi_field_p_ref =
        haskey(_openapi_object, "P_ref") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["P_ref"], false) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("id", "d_t", "Tm", "P_ref") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return TGSimple(;
        id=_openapi_field_id,
        d_t=_openapi_field_d_t,
        tm=_openapi_field_tm,
        p_ref=_openapi_field_p_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::TGSimple)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.d_t isa Absent ||
        (_openapi_output["d_t"] = _encode_unvalidated(_openapi_value.d_t))
    _openapi_value.tm isa Absent ||
        (_openapi_output["Tm"] = _encode_unvalidated(_openapi_value.tm))
    _openapi_value.p_ref isa Absent ||
        (_openapi_output["P_ref"] = _encode_unvalidated(_openapi_value.p_ref))
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
_encode(_openapi_value::TGSimple) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-0b6bf984324c22c1ca98.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding TGSimple";
    direction=:neutral,
)

function _form_fields(_openapi_value::TGSimple)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.d_t isa Absent || push!(_openapi_output, "d_t" => _openapi_value.d_t)
    _openapi_value.tm isa Absent || push!(_openapi_output, "Tm" => _openapi_value.tm)
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
