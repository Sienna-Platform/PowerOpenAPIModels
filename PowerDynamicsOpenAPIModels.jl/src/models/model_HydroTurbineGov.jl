"""
    HydroTurbineGov

Hydro turbine-governor

  - `id`: Unique integer identifier for this component
  - `r_big`: Permanent droop, in pu.
  - `r_small`: Temporary droop, in pu.
  - `tr`: Governor time constant. Units: s.
  - `tf`: Filter time constant. Units: s.
  - `tg`: Servo time constant. Units: s.
  - `velm`: Gate velocity limit
  - `gate_position_limits`: Gate position limits
  - `tw`: Water time constant. Units: s.
  - `at`: Turbine gain
  - `d_t`: Turbine damping
  - `q_nl`: No power flow
  - `p_ref`: Reference load set-point
"""
Base.@kwdef struct HydroTurbineGov <: APIModel
    id::Int64
    r_big::Float64
    r_small::Float64
    tr::Float64
    tf::Float64
    tg::Float64
    velm::Float64
    gate_position_limits::MinMax
    tw::Float64
    at::Float64
    d_t::Float64
    q_nl::Float64
    p_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{HydroTurbineGov}, value) = _decode(HydroTurbineGov, value, true)
function _decode(::Type{HydroTurbineGov}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-4dbead0853d0d9479b9c.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding HydroTurbineGov";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "HydroTurbineGov")
    _openapi_field_id =
        _decode_zoned(Int64, _required(_openapi_object, "id", "HydroTurbineGov"), false)
    _openapi_field_r_big = _decode_zoned(
        Float64,
        _required(_openapi_object, "R_BIG", "HydroTurbineGov"),
        false,
    )
    _openapi_field_r_small = _decode_zoned(
        Float64,
        _required(_openapi_object, "R_SMALL", "HydroTurbineGov"),
        false,
    )
    _openapi_field_tr =
        _decode_zoned(Float64, _required(_openapi_object, "Tr", "HydroTurbineGov"), false)
    _openapi_field_tf =
        _decode_zoned(Float64, _required(_openapi_object, "Tf", "HydroTurbineGov"), false)
    _openapi_field_tg =
        _decode_zoned(Float64, _required(_openapi_object, "Tg", "HydroTurbineGov"), false)
    _openapi_field_velm =
        _decode_zoned(Float64, _required(_openapi_object, "VELM", "HydroTurbineGov"), false)
    _openapi_field_gate_position_limits = _decode_zoned(
        MinMax,
        _required(_openapi_object, "gate_position_limits", "HydroTurbineGov"),
        false,
    )
    _openapi_field_tw =
        _decode_zoned(Float64, _required(_openapi_object, "Tw", "HydroTurbineGov"), false)
    _openapi_field_at =
        _decode_zoned(Float64, _required(_openapi_object, "At", "HydroTurbineGov"), false)
    _openapi_field_d_t =
        _decode_zoned(Float64, _required(_openapi_object, "D_T", "HydroTurbineGov"), false)
    _openapi_field_q_nl =
        _decode_zoned(Float64, _required(_openapi_object, "q_nl", "HydroTurbineGov"), false)
    _openapi_field_p_ref =
        haskey(_openapi_object, "P_ref") ?
        _decode_zoned(Union{Absent, Float64, Nothing}, _openapi_object["P_ref"], false) :
        ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "R_BIG",
            "R_SMALL",
            "Tr",
            "Tf",
            "Tg",
            "VELM",
            "gate_position_limits",
            "Tw",
            "At",
            "D_T",
            "q_nl",
            "P_ref",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return HydroTurbineGov(;
        id=_openapi_field_id,
        r_big=_openapi_field_r_big,
        r_small=_openapi_field_r_small,
        tr=_openapi_field_tr,
        tf=_openapi_field_tf,
        tg=_openapi_field_tg,
        velm=_openapi_field_velm,
        gate_position_limits=_openapi_field_gate_position_limits,
        tw=_openapi_field_tw,
        at=_openapi_field_at,
        d_t=_openapi_field_d_t,
        q_nl=_openapi_field_q_nl,
        p_ref=_openapi_field_p_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::HydroTurbineGov)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.r_big isa Absent ||
        (_openapi_output["R_BIG"] = _encode_unvalidated(_openapi_value.r_big))
    _openapi_value.r_small isa Absent ||
        (_openapi_output["R_SMALL"] = _encode_unvalidated(_openapi_value.r_small))
    _openapi_value.tr isa Absent ||
        (_openapi_output["Tr"] = _encode_unvalidated(_openapi_value.tr))
    _openapi_value.tf isa Absent ||
        (_openapi_output["Tf"] = _encode_unvalidated(_openapi_value.tf))
    _openapi_value.tg isa Absent ||
        (_openapi_output["Tg"] = _encode_unvalidated(_openapi_value.tg))
    _openapi_value.velm isa Absent ||
        (_openapi_output["VELM"] = _encode_unvalidated(_openapi_value.velm))
    _openapi_value.gate_position_limits isa Absent || (
        _openapi_output["gate_position_limits"] =
            _encode_unvalidated(_openapi_value.gate_position_limits)
    )
    _openapi_value.tw isa Absent ||
        (_openapi_output["Tw"] = _encode_unvalidated(_openapi_value.tw))
    _openapi_value.at isa Absent ||
        (_openapi_output["At"] = _encode_unvalidated(_openapi_value.at))
    _openapi_value.d_t isa Absent ||
        (_openapi_output["D_T"] = _encode_unvalidated(_openapi_value.d_t))
    _openapi_value.q_nl isa Absent ||
        (_openapi_output["q_nl"] = _encode_unvalidated(_openapi_value.q_nl))
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
_encode(_openapi_value::HydroTurbineGov) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-4dbead0853d0d9479b9c.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding HydroTurbineGov";
    direction=:neutral,
)

function _form_fields(_openapi_value::HydroTurbineGov)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.r_big isa Absent ||
        push!(_openapi_output, "R_BIG" => _openapi_value.r_big)
    _openapi_value.r_small isa Absent ||
        push!(_openapi_output, "R_SMALL" => _openapi_value.r_small)
    _openapi_value.tr isa Absent || push!(_openapi_output, "Tr" => _openapi_value.tr)
    _openapi_value.tf isa Absent || push!(_openapi_output, "Tf" => _openapi_value.tf)
    _openapi_value.tg isa Absent || push!(_openapi_output, "Tg" => _openapi_value.tg)
    _openapi_value.velm isa Absent || push!(_openapi_output, "VELM" => _openapi_value.velm)
    _openapi_value.gate_position_limits isa Absent || push!(
        _openapi_output,
        "gate_position_limits" => _openapi_value.gate_position_limits,
    )
    _openapi_value.tw isa Absent || push!(_openapi_output, "Tw" => _openapi_value.tw)
    _openapi_value.at isa Absent || push!(_openapi_output, "At" => _openapi_value.at)
    _openapi_value.d_t isa Absent || push!(_openapi_output, "D_T" => _openapi_value.d_t)
    _openapi_value.q_nl isa Absent || push!(_openapi_output, "q_nl" => _openapi_value.q_nl)
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
