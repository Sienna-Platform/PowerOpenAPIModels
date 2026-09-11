"""
    HydroTurbineGov

Hydro turbine-governor

  - `at`: Turbine gain
  - `d_t`: Turbine damping
  - `p_ref`: Reference load set-point
  - `r`: Permanent droop parameter
  - `tf`: Filter time constant
  - `tg`: Servo time constant
  - `tr`: Governor time constant
  - `tw`: Water time constant
  - `velm`: Gate velocity limit
  - `gate_position_limits`: Gate position limits
  - `id`: Unique integer identifier for this component
  - `q_nl`: No power flow
  - `r_2`: Temporary droop
"""
Base.@kwdef struct HydroTurbineGov <: APIModel
    at::Float64
    d_t::Float64
    p_ref::Union{Absent, Float64, Nothing} = ABSENT
    r::Float64
    tf::Float64
    tg::Float64
    tr::Float64
    tw::Float64
    velm::Float64
    gate_position_limits::MinMax
    id::Int64
    q_nl::Float64
    r_2::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{HydroTurbineGov}, value) = _decode(HydroTurbineGov, value, true)
function _decode(::Type{HydroTurbineGov}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-d5d2d2b15ebff194ab18.json",
            pointer="/components/schemas/HydroTurbineGov",
        ),
        _openapi_raw,
        "decoding HydroTurbineGov";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "HydroTurbineGov")
    _openapi_field_at = _decode(
        Float64,
        _required(_openapi_object, "At", "HydroTurbineGov"),
        _openapi_validate,
    )
    _openapi_field_d_t = _decode(
        Float64,
        _required(_openapi_object, "D_T", "HydroTurbineGov"),
        _openapi_validate,
    )
    _openapi_field_p_ref =
        haskey(_openapi_object, "P_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["P_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_r = _decode(
        Float64,
        _required(_openapi_object, "R", "HydroTurbineGov"),
        _openapi_validate,
    )
    _openapi_field_tf = _decode(
        Float64,
        _required(_openapi_object, "Tf", "HydroTurbineGov"),
        _openapi_validate,
    )
    _openapi_field_tg = _decode(
        Float64,
        _required(_openapi_object, "Tg", "HydroTurbineGov"),
        _openapi_validate,
    )
    _openapi_field_tr = _decode(
        Float64,
        _required(_openapi_object, "Tr", "HydroTurbineGov"),
        _openapi_validate,
    )
    _openapi_field_tw = _decode(
        Float64,
        _required(_openapi_object, "Tw", "HydroTurbineGov"),
        _openapi_validate,
    )
    _openapi_field_velm = _decode(
        Float64,
        _required(_openapi_object, "VELM", "HydroTurbineGov"),
        _openapi_validate,
    )
    _openapi_field_gate_position_limits = _decode(
        MinMax,
        _required(_openapi_object, "gate_position_limits", "HydroTurbineGov"),
        _openapi_validate,
    )
    _openapi_field_id = _decode(
        Int64,
        _required(_openapi_object, "id", "HydroTurbineGov"),
        _openapi_validate,
    )
    _openapi_field_q_nl = _decode(
        Float64,
        _required(_openapi_object, "q_nl", "HydroTurbineGov"),
        _openapi_validate,
    )
    _openapi_field_r_2 = _decode(
        Float64,
        _required(_openapi_object, "r", "HydroTurbineGov"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "At",
            "D_T",
            "P_ref",
            "R",
            "Tf",
            "Tg",
            "Tr",
            "Tw",
            "VELM",
            "gate_position_limits",
            "id",
            "q_nl",
            "r",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return HydroTurbineGov(;
        at=_openapi_field_at,
        d_t=_openapi_field_d_t,
        p_ref=_openapi_field_p_ref,
        r=_openapi_field_r,
        tf=_openapi_field_tf,
        tg=_openapi_field_tg,
        tr=_openapi_field_tr,
        tw=_openapi_field_tw,
        velm=_openapi_field_velm,
        gate_position_limits=_openapi_field_gate_position_limits,
        id=_openapi_field_id,
        q_nl=_openapi_field_q_nl,
        r_2=_openapi_field_r_2,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::HydroTurbineGov)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.at isa Absent || (_openapi_output["At"] = _encode(_openapi_value.at))
    _openapi_value.d_t isa Absent || (_openapi_output["D_T"] = _encode(_openapi_value.d_t))
    _openapi_value.p_ref isa Absent ||
        (_openapi_output["P_ref"] = _encode(_openapi_value.p_ref))
    _openapi_value.r isa Absent || (_openapi_output["R"] = _encode(_openapi_value.r))
    _openapi_value.tf isa Absent || (_openapi_output["Tf"] = _encode(_openapi_value.tf))
    _openapi_value.tg isa Absent || (_openapi_output["Tg"] = _encode(_openapi_value.tg))
    _openapi_value.tr isa Absent || (_openapi_output["Tr"] = _encode(_openapi_value.tr))
    _openapi_value.tw isa Absent || (_openapi_output["Tw"] = _encode(_openapi_value.tw))
    _openapi_value.velm isa Absent ||
        (_openapi_output["VELM"] = _encode(_openapi_value.velm))
    _openapi_value.gate_position_limits isa Absent || (
        _openapi_output["gate_position_limits"] =
            _encode(_openapi_value.gate_position_limits)
    )
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.q_nl isa Absent ||
        (_openapi_output["q_nl"] = _encode(_openapi_value.q_nl))
    _openapi_value.r_2 isa Absent || (_openapi_output["r"] = _encode(_openapi_value.r_2))
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
            pointer="/components/schemas/HydroTurbineGov",
        ),
        _openapi_output,
        "encoding HydroTurbineGov";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::HydroTurbineGov)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.at isa Absent || push!(_openapi_output, "At" => _openapi_value.at)
    _openapi_value.d_t isa Absent || push!(_openapi_output, "D_T" => _openapi_value.d_t)
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    _openapi_value.r isa Absent || push!(_openapi_output, "R" => _openapi_value.r)
    _openapi_value.tf isa Absent || push!(_openapi_output, "Tf" => _openapi_value.tf)
    _openapi_value.tg isa Absent || push!(_openapi_output, "Tg" => _openapi_value.tg)
    _openapi_value.tr isa Absent || push!(_openapi_output, "Tr" => _openapi_value.tr)
    _openapi_value.tw isa Absent || push!(_openapi_output, "Tw" => _openapi_value.tw)
    _openapi_value.velm isa Absent || push!(_openapi_output, "VELM" => _openapi_value.velm)
    _openapi_value.gate_position_limits isa Absent || push!(
        _openapi_output,
        "gate_position_limits" => _openapi_value.gate_position_limits,
    )
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.q_nl isa Absent || push!(_openapi_output, "q_nl" => _openapi_value.q_nl)
    _openapi_value.r_2 isa Absent || push!(_openapi_output, "r" => _openapi_value.r_2)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
