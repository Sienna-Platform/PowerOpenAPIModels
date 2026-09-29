"""
    TGTypeII

Parameters of a turbine governor type II

  - `id`: Unique integer identifier for this component
  - `r`: Droop parameter
  - `t1`: Transient gain time constant
  - `t2`: Power fraction time constant
  - `tau_limits`: A pair of values bounding a quantity from below (`min`) and from above (`max`).
  - `p_ref`: Reference power set-point
"""
Base.@kwdef struct TGTypeII <: APIModel
    id::Int64
    r::Float64
    t1::Float64
    t2::Float64
    tau_limits::MinMax
    p_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{TGTypeII}, value) = _decode(TGTypeII, value, true)
function _decode(::Type{TGTypeII}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-45a127ed352d1409fccb.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding TGTypeII";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "TGTypeII")
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "TGTypeII"), false)
    _openapi_field_r = _decode(Float64, _required(_openapi_object, "R", "TGTypeII"), false)
    _openapi_field_t1 =
        _decode(Float64, _required(_openapi_object, "T1", "TGTypeII"), false)
    _openapi_field_t2 =
        _decode(Float64, _required(_openapi_object, "T2", "TGTypeII"), false)
    _openapi_field_tau_limits =
        _decode(MinMax, _required(_openapi_object, "tau_limits", "TGTypeII"), false)
    _openapi_field_p_ref =
        haskey(_openapi_object, "P_ref") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["P_ref"], false) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("id", "R", "T1", "T2", "tau_limits", "P_ref") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return TGTypeII(;
        id=_openapi_field_id,
        r=_openapi_field_r,
        t1=_openapi_field_t1,
        t2=_openapi_field_t2,
        tau_limits=_openapi_field_tau_limits,
        p_ref=_openapi_field_p_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::TGTypeII)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.r isa Absent ||
        (_openapi_output["R"] = _encode_unvalidated(_openapi_value.r))
    _openapi_value.t1 isa Absent ||
        (_openapi_output["T1"] = _encode_unvalidated(_openapi_value.t1))
    _openapi_value.t2 isa Absent ||
        (_openapi_output["T2"] = _encode_unvalidated(_openapi_value.t2))
    _openapi_value.tau_limits isa Absent ||
        (_openapi_output["tau_limits"] = _encode_unvalidated(_openapi_value.tau_limits))
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
_encode(_openapi_value::TGTypeII) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-45a127ed352d1409fccb.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding TGTypeII";
    direction=:neutral,
)

function _form_fields(_openapi_value::TGTypeII)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.r isa Absent || push!(_openapi_output, "R" => _openapi_value.r)
    _openapi_value.t1 isa Absent || push!(_openapi_output, "T1" => _openapi_value.t1)
    _openapi_value.t2 isa Absent || push!(_openapi_output, "T2" => _openapi_value.t2)
    _openapi_value.tau_limits isa Absent ||
        push!(_openapi_output, "tau_limits" => _openapi_value.tau_limits)
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
