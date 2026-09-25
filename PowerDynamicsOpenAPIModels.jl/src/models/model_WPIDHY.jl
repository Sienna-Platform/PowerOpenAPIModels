"""
    WPIDHY

Woodward PID Hydro Governor

  - `id`: Unique integer identifier for this component
  - `t_reg`: Input time constant of the governor
  - `reg`: Input governor gain
  - `kp`: Governor proportional gain
  - `ki`: Governor integral gain
  - `kd`: Governor derivative gain
  - `ta`: Governor derivative/high-frequency time constant
  - `tb`: Gate-servo time constant
  - `v_lim`: A pair of values bounding a quantity from below (`min`) and from above (`max`).
  - `g_lim`: A pair of values bounding a quantity from below (`min`) and from above (`max`).
  - `tw`: Water inertia time constant
  - `p_lim`: A pair of values bounding a quantity from below (`min`) and from above (`max`).
  - `d_turb`: Turbine damping coefficient
  - `gate_openings`: Gate opening speed at different loads
  - `power_gate_openings`: Power at gate_openings
  - `p_ref`: Reference load set-point
"""
Base.@kwdef struct WPIDHY <: APIModel
    id::Int64
    t_reg::Float64
    reg::Float64
    kp::Float64
    ki::Float64
    kd::Float64
    ta::Float64
    tb::Float64
    v_lim::MinMax
    g_lim::MinMax
    tw::Float64
    p_lim::MinMax
    d_turb::Union{Absent, Float64, Nothing} = ABSENT
    gate_openings::Vector{Float64}
    power_gate_openings::Vector{Float64}
    p_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{WPIDHY}, value) = _decode(WPIDHY, value, true)
function _decode(::Type{WPIDHY}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-daf50dbfc5f2a05e1e1a.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding WPIDHY";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "WPIDHY")
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "WPIDHY"), false)
    _openapi_field_t_reg =
        _decode(Float64, _required(_openapi_object, "T_reg", "WPIDHY"), false)
    _openapi_field_reg =
        _decode(Float64, _required(_openapi_object, "reg", "WPIDHY"), false)
    _openapi_field_kp = _decode(Float64, _required(_openapi_object, "Kp", "WPIDHY"), false)
    _openapi_field_ki = _decode(Float64, _required(_openapi_object, "Ki", "WPIDHY"), false)
    _openapi_field_kd = _decode(Float64, _required(_openapi_object, "Kd", "WPIDHY"), false)
    _openapi_field_ta = _decode(Float64, _required(_openapi_object, "Ta", "WPIDHY"), false)
    _openapi_field_tb = _decode(Float64, _required(_openapi_object, "Tb", "WPIDHY"), false)
    _openapi_field_v_lim =
        _decode(MinMax, _required(_openapi_object, "V_lim", "WPIDHY"), false)
    _openapi_field_g_lim =
        _decode(MinMax, _required(_openapi_object, "G_lim", "WPIDHY"), false)
    _openapi_field_tw = _decode(Float64, _required(_openapi_object, "Tw", "WPIDHY"), false)
    _openapi_field_p_lim =
        _decode(MinMax, _required(_openapi_object, "P_lim", "WPIDHY"), false)
    _openapi_field_d_turb =
        haskey(_openapi_object, "D_turb") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["D_turb"], false) : ABSENT
    _openapi_field_gate_openings = _decode(
        Vector{Float64},
        _required(_openapi_object, "gate_openings", "WPIDHY"),
        false,
    )
    _openapi_field_power_gate_openings = _decode(
        Vector{Float64},
        _required(_openapi_object, "power_gate_openings", "WPIDHY"),
        false,
    )
    _openapi_field_p_ref =
        haskey(_openapi_object, "P_ref") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["P_ref"], false) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "T_reg",
            "reg",
            "Kp",
            "Ki",
            "Kd",
            "Ta",
            "Tb",
            "V_lim",
            "G_lim",
            "Tw",
            "P_lim",
            "D_turb",
            "gate_openings",
            "power_gate_openings",
            "P_ref",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return WPIDHY(;
        id=_openapi_field_id,
        t_reg=_openapi_field_t_reg,
        reg=_openapi_field_reg,
        kp=_openapi_field_kp,
        ki=_openapi_field_ki,
        kd=_openapi_field_kd,
        ta=_openapi_field_ta,
        tb=_openapi_field_tb,
        v_lim=_openapi_field_v_lim,
        g_lim=_openapi_field_g_lim,
        tw=_openapi_field_tw,
        p_lim=_openapi_field_p_lim,
        d_turb=_openapi_field_d_turb,
        gate_openings=_openapi_field_gate_openings,
        power_gate_openings=_openapi_field_power_gate_openings,
        p_ref=_openapi_field_p_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::WPIDHY)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.t_reg isa Absent ||
        (_openapi_output["T_reg"] = _encode_unvalidated(_openapi_value.t_reg))
    _openapi_value.reg isa Absent ||
        (_openapi_output["reg"] = _encode_unvalidated(_openapi_value.reg))
    _openapi_value.kp isa Absent ||
        (_openapi_output["Kp"] = _encode_unvalidated(_openapi_value.kp))
    _openapi_value.ki isa Absent ||
        (_openapi_output["Ki"] = _encode_unvalidated(_openapi_value.ki))
    _openapi_value.kd isa Absent ||
        (_openapi_output["Kd"] = _encode_unvalidated(_openapi_value.kd))
    _openapi_value.ta isa Absent ||
        (_openapi_output["Ta"] = _encode_unvalidated(_openapi_value.ta))
    _openapi_value.tb isa Absent ||
        (_openapi_output["Tb"] = _encode_unvalidated(_openapi_value.tb))
    _openapi_value.v_lim isa Absent ||
        (_openapi_output["V_lim"] = _encode_unvalidated(_openapi_value.v_lim))
    _openapi_value.g_lim isa Absent ||
        (_openapi_output["G_lim"] = _encode_unvalidated(_openapi_value.g_lim))
    _openapi_value.tw isa Absent ||
        (_openapi_output["Tw"] = _encode_unvalidated(_openapi_value.tw))
    _openapi_value.p_lim isa Absent ||
        (_openapi_output["P_lim"] = _encode_unvalidated(_openapi_value.p_lim))
    _openapi_value.d_turb isa Absent ||
        (_openapi_output["D_turb"] = _encode_unvalidated(_openapi_value.d_turb))
    _openapi_value.gate_openings isa Absent || (
        _openapi_output["gate_openings"] =
            _encode_unvalidated(_openapi_value.gate_openings)
    )
    _openapi_value.power_gate_openings isa Absent || (
        _openapi_output["power_gate_openings"] =
            _encode_unvalidated(_openapi_value.power_gate_openings)
    )
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
_encode(_openapi_value::WPIDHY) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-daf50dbfc5f2a05e1e1a.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding WPIDHY";
    direction=:neutral,
)

function _form_fields(_openapi_value::WPIDHY)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.t_reg isa Absent ||
        push!(_openapi_output, "T_reg" => _openapi_value.t_reg)
    _openapi_value.reg isa Absent || push!(_openapi_output, "reg" => _openapi_value.reg)
    _openapi_value.kp isa Absent || push!(_openapi_output, "Kp" => _openapi_value.kp)
    _openapi_value.ki isa Absent || push!(_openapi_output, "Ki" => _openapi_value.ki)
    _openapi_value.kd isa Absent || push!(_openapi_output, "Kd" => _openapi_value.kd)
    _openapi_value.ta isa Absent || push!(_openapi_output, "Ta" => _openapi_value.ta)
    _openapi_value.tb isa Absent || push!(_openapi_output, "Tb" => _openapi_value.tb)
    _openapi_value.v_lim isa Absent ||
        push!(_openapi_output, "V_lim" => _openapi_value.v_lim)
    _openapi_value.g_lim isa Absent ||
        push!(_openapi_output, "G_lim" => _openapi_value.g_lim)
    _openapi_value.tw isa Absent || push!(_openapi_output, "Tw" => _openapi_value.tw)
    _openapi_value.p_lim isa Absent ||
        push!(_openapi_output, "P_lim" => _openapi_value.p_lim)
    _openapi_value.d_turb isa Absent ||
        push!(_openapi_output, "D_turb" => _openapi_value.d_turb)
    _openapi_value.gate_openings isa Absent ||
        push!(_openapi_output, "gate_openings" => _openapi_value.gate_openings)
    _openapi_value.power_gate_openings isa Absent ||
        push!(_openapi_output, "power_gate_openings" => _openapi_value.power_gate_openings)
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
