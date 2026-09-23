"""
    TGTypeI

Parameters of a turbine governor type I

  - `id`: Unique integer identifier for this component
  - `r`: Droop parameter
  - `ts`: Governor time constant
  - `tc`: Servo time constant
  - `t3`: Transient gain time constant
  - `t4`: Power fraction time constant
  - `t5`: Reheat time constant
  - `valve_position_limits`: A pair of values bounding a quantity from below (`min`) and from above (`max`).
  - `p_ref`: Reference power set-point
"""
Base.@kwdef struct TGTypeI <: APIModel
    id::Int64
    r::Float64
    ts::Float64
    tc::Float64
    t3::Float64
    t4::Float64
    t5::Float64
    valve_position_limits::MinMax
    p_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{TGTypeI}, value) = _decode(TGTypeI, value, true)
function _decode(::Type{TGTypeI}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-851ef81fcfd9a658ecf6.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding TGTypeI";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "TGTypeI")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "TGTypeI"), _openapi_validate)
    _openapi_field_r =
        _decode(Float64, _required(_openapi_object, "R", "TGTypeI"), _openapi_validate)
    _openapi_field_ts =
        _decode(Float64, _required(_openapi_object, "Ts", "TGTypeI"), _openapi_validate)
    _openapi_field_tc =
        _decode(Float64, _required(_openapi_object, "Tc", "TGTypeI"), _openapi_validate)
    _openapi_field_t3 =
        _decode(Float64, _required(_openapi_object, "T3", "TGTypeI"), _openapi_validate)
    _openapi_field_t4 =
        _decode(Float64, _required(_openapi_object, "T4", "TGTypeI"), _openapi_validate)
    _openapi_field_t5 =
        _decode(Float64, _required(_openapi_object, "T5", "TGTypeI"), _openapi_validate)
    _openapi_field_valve_position_limits = _decode(
        MinMax,
        _required(_openapi_object, "valve_position_limits", "TGTypeI"),
        _openapi_validate,
    )
    _openapi_field_p_ref =
        haskey(_openapi_object, "P_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["P_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in
        ("id", "R", "Ts", "Tc", "T3", "T4", "T5", "valve_position_limits", "P_ref") &&
            continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return TGTypeI(;
        id=_openapi_field_id,
        r=_openapi_field_r,
        ts=_openapi_field_ts,
        tc=_openapi_field_tc,
        t3=_openapi_field_t3,
        t4=_openapi_field_t4,
        t5=_openapi_field_t5,
        valve_position_limits=_openapi_field_valve_position_limits,
        p_ref=_openapi_field_p_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::TGTypeI)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.r isa Absent || (_openapi_output["R"] = _encode(_openapi_value.r))
    _openapi_value.ts isa Absent || (_openapi_output["Ts"] = _encode(_openapi_value.ts))
    _openapi_value.tc isa Absent || (_openapi_output["Tc"] = _encode(_openapi_value.tc))
    _openapi_value.t3 isa Absent || (_openapi_output["T3"] = _encode(_openapi_value.t3))
    _openapi_value.t4 isa Absent || (_openapi_output["T4"] = _encode(_openapi_value.t4))
    _openapi_value.t5 isa Absent || (_openapi_output["T5"] = _encode(_openapi_value.t5))
    _openapi_value.valve_position_limits isa Absent || (
        _openapi_output["valve_position_limits"] =
            _encode(_openapi_value.valve_position_limits)
    )
    _openapi_value.p_ref isa Absent ||
        (_openapi_output["P_ref"] = _encode(_openapi_value.p_ref))
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
            resource="https://openapi.invalid/schema/external-851ef81fcfd9a658ecf6.json",
            pointer="",
        ),
        _openapi_output,
        "encoding TGTypeI";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::TGTypeI)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.r isa Absent || push!(_openapi_output, "R" => _openapi_value.r)
    _openapi_value.ts isa Absent || push!(_openapi_output, "Ts" => _openapi_value.ts)
    _openapi_value.tc isa Absent || push!(_openapi_output, "Tc" => _openapi_value.tc)
    _openapi_value.t3 isa Absent || push!(_openapi_output, "T3" => _openapi_value.t3)
    _openapi_value.t4 isa Absent || push!(_openapi_output, "T4" => _openapi_value.t4)
    _openapi_value.t5 isa Absent || push!(_openapi_output, "T5" => _openapi_value.t5)
    _openapi_value.valve_position_limits isa Absent || push!(
        _openapi_output,
        "valve_position_limits" => _openapi_value.valve_position_limits,
    )
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
