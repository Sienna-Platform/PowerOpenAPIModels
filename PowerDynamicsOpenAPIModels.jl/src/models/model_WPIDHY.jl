"""
    WPIDHY

Woodward PID Hydro Governor

  - `d_turb`: Turbine damping coefficient
  - `g_lim`: Minimum and maximum gate velocity
  - `kd`: Governor derivative gain
  - `ki`: Governor integral gain
  - `kp`: Governor proportional gain
  - `p_lim`: Minimum and maximum gate openings
  - `p_ref`: Reference load set-point
  - `t_reg`: Input time constant of the governor
  - `ta`: Governor derivative/high-frequency time constant
  - `tb`: Gate-servo time constant
  - `tw`: Water inertia time constant
  - `v_lim`: Gate opening velocity limits
  - `gate_openings`: Gate opening speed at different loads
  - `id`: Unique integer identifier for this component
  - `power_gate_openings`: Power at gate_openings
  - `reg`: Input governor gain
"""
Base.@kwdef struct WPIDHY <: APIModel
    d_turb::Union{Absent, Float64, Nothing} = ABSENT
    g_lim::MinMax
    kd::Float64
    ki::Float64
    kp::Float64
    p_lim::MinMax
    p_ref::Union{Absent, Float64, Nothing} = ABSENT
    t_reg::Float64
    ta::Float64
    tb::Float64
    tw::Float64
    v_lim::MinMax
    gate_openings::Vector{Float64}
    id::Int64
    power_gate_openings::Vector{Float64}
    reg::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{WPIDHY}, value) = _decode(WPIDHY, value, true)
function _decode(::Type{WPIDHY}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-d5d2d2b15ebff194ab18.json",
            pointer="/components/schemas/WPIDHY",
        ),
        _openapi_raw,
        "decoding WPIDHY";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "WPIDHY")
    _openapi_field_d_turb =
        haskey(_openapi_object, "D_turb") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["D_turb"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_g_lim =
        _decode(MinMax, _required(_openapi_object, "G_lim", "WPIDHY"), _openapi_validate)
    _openapi_field_kd =
        _decode(Float64, _required(_openapi_object, "Kd", "WPIDHY"), _openapi_validate)
    _openapi_field_ki =
        _decode(Float64, _required(_openapi_object, "Ki", "WPIDHY"), _openapi_validate)
    _openapi_field_kp =
        _decode(Float64, _required(_openapi_object, "Kp", "WPIDHY"), _openapi_validate)
    _openapi_field_p_lim =
        _decode(MinMax, _required(_openapi_object, "P_lim", "WPIDHY"), _openapi_validate)
    _openapi_field_p_ref =
        haskey(_openapi_object, "P_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["P_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_t_reg =
        _decode(Float64, _required(_openapi_object, "T_reg", "WPIDHY"), _openapi_validate)
    _openapi_field_ta =
        _decode(Float64, _required(_openapi_object, "Ta", "WPIDHY"), _openapi_validate)
    _openapi_field_tb =
        _decode(Float64, _required(_openapi_object, "Tb", "WPIDHY"), _openapi_validate)
    _openapi_field_tw =
        _decode(Float64, _required(_openapi_object, "Tw", "WPIDHY"), _openapi_validate)
    _openapi_field_v_lim =
        _decode(MinMax, _required(_openapi_object, "V_lim", "WPIDHY"), _openapi_validate)
    _openapi_field_gate_openings = _decode(
        Vector{Float64},
        _required(_openapi_object, "gate_openings", "WPIDHY"),
        _openapi_validate,
    )
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "WPIDHY"), _openapi_validate)
    _openapi_field_power_gate_openings = _decode(
        Vector{Float64},
        _required(_openapi_object, "power_gate_openings", "WPIDHY"),
        _openapi_validate,
    )
    _openapi_field_reg =
        _decode(Float64, _required(_openapi_object, "reg", "WPIDHY"), _openapi_validate)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "D_turb",
            "G_lim",
            "Kd",
            "Ki",
            "Kp",
            "P_lim",
            "P_ref",
            "T_reg",
            "Ta",
            "Tb",
            "Tw",
            "V_lim",
            "gate_openings",
            "id",
            "power_gate_openings",
            "reg",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return WPIDHY(;
        d_turb=_openapi_field_d_turb,
        g_lim=_openapi_field_g_lim,
        kd=_openapi_field_kd,
        ki=_openapi_field_ki,
        kp=_openapi_field_kp,
        p_lim=_openapi_field_p_lim,
        p_ref=_openapi_field_p_ref,
        t_reg=_openapi_field_t_reg,
        ta=_openapi_field_ta,
        tb=_openapi_field_tb,
        tw=_openapi_field_tw,
        v_lim=_openapi_field_v_lim,
        gate_openings=_openapi_field_gate_openings,
        id=_openapi_field_id,
        power_gate_openings=_openapi_field_power_gate_openings,
        reg=_openapi_field_reg,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::WPIDHY)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.d_turb isa Absent ||
        (_openapi_output["D_turb"] = _encode(_openapi_value.d_turb))
    _openapi_value.g_lim isa Absent ||
        (_openapi_output["G_lim"] = _encode(_openapi_value.g_lim))
    _openapi_value.kd isa Absent || (_openapi_output["Kd"] = _encode(_openapi_value.kd))
    _openapi_value.ki isa Absent || (_openapi_output["Ki"] = _encode(_openapi_value.ki))
    _openapi_value.kp isa Absent || (_openapi_output["Kp"] = _encode(_openapi_value.kp))
    _openapi_value.p_lim isa Absent ||
        (_openapi_output["P_lim"] = _encode(_openapi_value.p_lim))
    _openapi_value.p_ref isa Absent ||
        (_openapi_output["P_ref"] = _encode(_openapi_value.p_ref))
    _openapi_value.t_reg isa Absent ||
        (_openapi_output["T_reg"] = _encode(_openapi_value.t_reg))
    _openapi_value.ta isa Absent || (_openapi_output["Ta"] = _encode(_openapi_value.ta))
    _openapi_value.tb isa Absent || (_openapi_output["Tb"] = _encode(_openapi_value.tb))
    _openapi_value.tw isa Absent || (_openapi_output["Tw"] = _encode(_openapi_value.tw))
    _openapi_value.v_lim isa Absent ||
        (_openapi_output["V_lim"] = _encode(_openapi_value.v_lim))
    _openapi_value.gate_openings isa Absent ||
        (_openapi_output["gate_openings"] = _encode(_openapi_value.gate_openings))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.power_gate_openings isa Absent || (
        _openapi_output["power_gate_openings"] =
            _encode(_openapi_value.power_gate_openings)
    )
    _openapi_value.reg isa Absent || (_openapi_output["reg"] = _encode(_openapi_value.reg))
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
            pointer="/components/schemas/WPIDHY",
        ),
        _openapi_output,
        "encoding WPIDHY";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::WPIDHY)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.d_turb isa Absent ||
        push!(_openapi_output, "D_turb" => _openapi_value.d_turb)
    _openapi_value.g_lim isa Absent ||
        push!(_openapi_output, "G_lim" => _openapi_value.g_lim)
    _openapi_value.kd isa Absent || push!(_openapi_output, "Kd" => _openapi_value.kd)
    _openapi_value.ki isa Absent || push!(_openapi_output, "Ki" => _openapi_value.ki)
    _openapi_value.kp isa Absent || push!(_openapi_output, "Kp" => _openapi_value.kp)
    _openapi_value.p_lim isa Absent ||
        push!(_openapi_output, "P_lim" => _openapi_value.p_lim)
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    _openapi_value.t_reg isa Absent ||
        push!(_openapi_output, "T_reg" => _openapi_value.t_reg)
    _openapi_value.ta isa Absent || push!(_openapi_output, "Ta" => _openapi_value.ta)
    _openapi_value.tb isa Absent || push!(_openapi_output, "Tb" => _openapi_value.tb)
    _openapi_value.tw isa Absent || push!(_openapi_output, "Tw" => _openapi_value.tw)
    _openapi_value.v_lim isa Absent ||
        push!(_openapi_output, "V_lim" => _openapi_value.v_lim)
    _openapi_value.gate_openings isa Absent ||
        push!(_openapi_output, "gate_openings" => _openapi_value.gate_openings)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.power_gate_openings isa Absent ||
        push!(_openapi_output, "power_gate_openings" => _openapi_value.power_gate_openings)
    _openapi_value.reg isa Absent || push!(_openapi_output, "reg" => _openapi_value.reg)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
