"""
    PIDGOV

Hydro Turbine-Governor with PID controller

  - `a_tw`: Factor multiplying Tw
  - `d_turb`: Turbine damping factor
  - `g_lim`: Gate opening velocity limits
  - `kd`: Governor derivative gain
  - `ki`: Governor integral gain
  - `kp`: Governor proportional gain
  - `p_ref`: Reference load set-point
  - `rperm`: Speed permanent droop parameter
  - `t_reg`: Speed detector time constant
  - `ta`: Governor derivative time constant
  - `tb`: Gate-servo time constant
  - `tw`: Water inertia time constant
  - `feedback_flag`: Feedback signal for governor droop: 0 for electrical power, and 1 for gate position
  - `gate_openings`: Gate opening speed at different loads
  - `id`: Unique integer identifier for this component
  - `power_gate_openings`: Power at gate_openings
"""
Base.@kwdef struct PIDGOV <: APIModel
    a_tw::Float64
    d_turb::Float64
    g_lim::MinMax
    kd::Float64
    ki::Float64
    kp::Float64
    p_ref::Union{Absent, Float64, Nothing} = ABSENT
    rperm::Float64
    t_reg::Float64
    ta::Float64
    tb::Float64
    tw::Float64
    feedback_flag::Int64
    gate_openings::Vector{Float64}
    id::Int64
    power_gate_openings::Vector{Float64}
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{PIDGOV}, value) = _decode(PIDGOV, value, true)
function _decode(::Type{PIDGOV}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-d5d2d2b15ebff194ab18.json",
            pointer="/components/schemas/PIDGOV",
        ),
        _openapi_raw,
        "decoding PIDGOV";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "PIDGOV")
    _openapi_field_a_tw =
        _decode(Float64, _required(_openapi_object, "A_tw", "PIDGOV"), _openapi_validate)
    _openapi_field_d_turb =
        _decode(Float64, _required(_openapi_object, "D_turb", "PIDGOV"), _openapi_validate)
    _openapi_field_g_lim =
        _decode(MinMax, _required(_openapi_object, "G_lim", "PIDGOV"), _openapi_validate)
    _openapi_field_kd =
        _decode(Float64, _required(_openapi_object, "Kd", "PIDGOV"), _openapi_validate)
    _openapi_field_ki =
        _decode(Float64, _required(_openapi_object, "Ki", "PIDGOV"), _openapi_validate)
    _openapi_field_kp =
        _decode(Float64, _required(_openapi_object, "Kp", "PIDGOV"), _openapi_validate)
    _openapi_field_p_ref =
        haskey(_openapi_object, "P_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["P_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_rperm =
        _decode(Float64, _required(_openapi_object, "Rperm", "PIDGOV"), _openapi_validate)
    _openapi_field_t_reg =
        _decode(Float64, _required(_openapi_object, "T_reg", "PIDGOV"), _openapi_validate)
    _openapi_field_ta =
        _decode(Float64, _required(_openapi_object, "Ta", "PIDGOV"), _openapi_validate)
    _openapi_field_tb =
        _decode(Float64, _required(_openapi_object, "Tb", "PIDGOV"), _openapi_validate)
    _openapi_field_tw =
        _decode(Float64, _required(_openapi_object, "Tw", "PIDGOV"), _openapi_validate)
    _openapi_field_feedback_flag = _decode(
        Int64,
        _required(_openapi_object, "feedback_flag", "PIDGOV"),
        _openapi_validate,
    )
    _openapi_field_gate_openings = _decode(
        Vector{Float64},
        _required(_openapi_object, "gate_openings", "PIDGOV"),
        _openapi_validate,
    )
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "PIDGOV"), _openapi_validate)
    _openapi_field_power_gate_openings = _decode(
        Vector{Float64},
        _required(_openapi_object, "power_gate_openings", "PIDGOV"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "A_tw",
            "D_turb",
            "G_lim",
            "Kd",
            "Ki",
            "Kp",
            "P_ref",
            "Rperm",
            "T_reg",
            "Ta",
            "Tb",
            "Tw",
            "feedback_flag",
            "gate_openings",
            "id",
            "power_gate_openings",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return PIDGOV(;
        a_tw=_openapi_field_a_tw,
        d_turb=_openapi_field_d_turb,
        g_lim=_openapi_field_g_lim,
        kd=_openapi_field_kd,
        ki=_openapi_field_ki,
        kp=_openapi_field_kp,
        p_ref=_openapi_field_p_ref,
        rperm=_openapi_field_rperm,
        t_reg=_openapi_field_t_reg,
        ta=_openapi_field_ta,
        tb=_openapi_field_tb,
        tw=_openapi_field_tw,
        feedback_flag=_openapi_field_feedback_flag,
        gate_openings=_openapi_field_gate_openings,
        id=_openapi_field_id,
        power_gate_openings=_openapi_field_power_gate_openings,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::PIDGOV)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.a_tw isa Absent ||
        (_openapi_output["A_tw"] = _encode(_openapi_value.a_tw))
    _openapi_value.d_turb isa Absent ||
        (_openapi_output["D_turb"] = _encode(_openapi_value.d_turb))
    _openapi_value.g_lim isa Absent ||
        (_openapi_output["G_lim"] = _encode(_openapi_value.g_lim))
    _openapi_value.kd isa Absent || (_openapi_output["Kd"] = _encode(_openapi_value.kd))
    _openapi_value.ki isa Absent || (_openapi_output["Ki"] = _encode(_openapi_value.ki))
    _openapi_value.kp isa Absent || (_openapi_output["Kp"] = _encode(_openapi_value.kp))
    _openapi_value.p_ref isa Absent ||
        (_openapi_output["P_ref"] = _encode(_openapi_value.p_ref))
    _openapi_value.rperm isa Absent ||
        (_openapi_output["Rperm"] = _encode(_openapi_value.rperm))
    _openapi_value.t_reg isa Absent ||
        (_openapi_output["T_reg"] = _encode(_openapi_value.t_reg))
    _openapi_value.ta isa Absent || (_openapi_output["Ta"] = _encode(_openapi_value.ta))
    _openapi_value.tb isa Absent || (_openapi_output["Tb"] = _encode(_openapi_value.tb))
    _openapi_value.tw isa Absent || (_openapi_output["Tw"] = _encode(_openapi_value.tw))
    _openapi_value.feedback_flag isa Absent ||
        (_openapi_output["feedback_flag"] = _encode(_openapi_value.feedback_flag))
    _openapi_value.gate_openings isa Absent ||
        (_openapi_output["gate_openings"] = _encode(_openapi_value.gate_openings))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.power_gate_openings isa Absent || (
        _openapi_output["power_gate_openings"] =
            _encode(_openapi_value.power_gate_openings)
    )
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
            pointer="/components/schemas/PIDGOV",
        ),
        _openapi_output,
        "encoding PIDGOV";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::PIDGOV)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.a_tw isa Absent || push!(_openapi_output, "A_tw" => _openapi_value.a_tw)
    _openapi_value.d_turb isa Absent ||
        push!(_openapi_output, "D_turb" => _openapi_value.d_turb)
    _openapi_value.g_lim isa Absent ||
        push!(_openapi_output, "G_lim" => _openapi_value.g_lim)
    _openapi_value.kd isa Absent || push!(_openapi_output, "Kd" => _openapi_value.kd)
    _openapi_value.ki isa Absent || push!(_openapi_output, "Ki" => _openapi_value.ki)
    _openapi_value.kp isa Absent || push!(_openapi_output, "Kp" => _openapi_value.kp)
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    _openapi_value.rperm isa Absent ||
        push!(_openapi_output, "Rperm" => _openapi_value.rperm)
    _openapi_value.t_reg isa Absent ||
        push!(_openapi_output, "T_reg" => _openapi_value.t_reg)
    _openapi_value.ta isa Absent || push!(_openapi_output, "Ta" => _openapi_value.ta)
    _openapi_value.tb isa Absent || push!(_openapi_output, "Tb" => _openapi_value.tb)
    _openapi_value.tw isa Absent || push!(_openapi_output, "Tw" => _openapi_value.tw)
    _openapi_value.feedback_flag isa Absent ||
        push!(_openapi_output, "feedback_flag" => _openapi_value.feedback_flag)
    _openapi_value.gate_openings isa Absent ||
        push!(_openapi_output, "gate_openings" => _openapi_value.gate_openings)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.power_gate_openings isa Absent ||
        push!(_openapi_output, "power_gate_openings" => _openapi_value.power_gate_openings)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
