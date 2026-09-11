"""
    TGSimple

Parameters of a Simple one-state Turbine Governor

  - `p_ref`: Reference power set-point
  - `tm`: Turbine governor low-pass time constant
  - `d_t`: Inverse droop parameter
  - `id`: Unique integer identifier for this component
"""
Base.@kwdef struct TGSimple <: APIModel
    p_ref::Union{Absent, Float64, Nothing} = ABSENT
    tm::Float64
    d_t::Float64
    id::Int64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{TGSimple}, value) = _decode(TGSimple, value, true)
function _decode(::Type{TGSimple}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-d5d2d2b15ebff194ab18.json",
            pointer="/components/schemas/TGSimple",
        ),
        _openapi_raw,
        "decoding TGSimple";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "TGSimple")
    _openapi_field_p_ref =
        haskey(_openapi_object, "P_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["P_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_tm =
        _decode(Float64, _required(_openapi_object, "Tm", "TGSimple"), _openapi_validate)
    _openapi_field_d_t =
        _decode(Float64, _required(_openapi_object, "d_t", "TGSimple"), _openapi_validate)
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "TGSimple"), _openapi_validate)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("P_ref", "Tm", "d_t", "id") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return TGSimple(;
        p_ref=_openapi_field_p_ref,
        tm=_openapi_field_tm,
        d_t=_openapi_field_d_t,
        id=_openapi_field_id,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::TGSimple)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.p_ref isa Absent ||
        (_openapi_output["P_ref"] = _encode(_openapi_value.p_ref))
    _openapi_value.tm isa Absent || (_openapi_output["Tm"] = _encode(_openapi_value.tm))
    _openapi_value.d_t isa Absent || (_openapi_output["d_t"] = _encode(_openapi_value.d_t))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
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
            resource="https://openapi.invalid/schema/root-d5d2d2b15ebff194ab18.json",
            pointer="/components/schemas/TGSimple",
        ),
        _openapi_output,
        "encoding TGSimple";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::TGSimple)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    _openapi_value.tm isa Absent || push!(_openapi_output, "Tm" => _openapi_value.tm)
    _openapi_value.d_t isa Absent || push!(_openapi_output, "d_t" => _openapi_value.d_t)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
