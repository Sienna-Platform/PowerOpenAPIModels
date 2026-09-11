"""
    GeneralGovModel

GE General Governor/Turbine Model. The GeneralGovModel (GGOV1) model is a general purpose governor model used for a variety of prime movers controlled by proportional-integral-derivative (PID) governors including gas turbines

  - `a_set`: Acceleration limiter setpoint
  - `dm`: Mechanical damping coefficient
  - `k_turb`: Turbine gain
  - `ka`: Acceleration limiter gain
  - `kd_gov`: Governor derivative gain
  - `ki_gov`: Governor integral gain
  - `ki_load`: Load integral gain for PI controller
  - `ki_mw`: Power controller (reset) gain
  - `kp_gov`: Governor proportional gain
  - `kp_load`: Load limiter proportional gain for PI controller
  - `ld_ref`: Load limiter integral gain for PI controller
  - `p_ref`: Reference power set-point
  - `r`: Speed droop parameter
  - `r_close`: Maximum valve closing rate
  - `r_lim`: Maximum rate of load increase
  - `r_open`: Maximum valve opening rate
  - `r_select`: Feedback signal for governor droop
  - `t_act`: Actuator time constant
  - `t_eng`: Transport lag time constant for diesel engine
  - `t_rate`: Turbine rating
  - `ta`: Acceleration limiter time constant
  - `tb`: Turbine lag time constant
  - `tc`: Turbine lead time constant
  - `td_gov`: Governor derivative time constant
  - `tf_load`: Load limiter time constant
  - `tpelec`: Electrical power transducer time constant
  - `tsa`: Temperature detection lead time constant
  - `tsb`: Temperature detection lag time constant
  - `wf_nl`: No load fuel flow
  - `db`: Speed governor deadband
  - `fuel_flag`: Flag switch for fuel source characteristic
  - `id`: Unique integer identifier for this component
  - `speed_error_signal`: Speed error signal limits
  - `valve_position_limits`: Valve position limits
"""
Base.@kwdef struct GeneralGovModel <: APIModel
    a_set::Float64
    dm::Float64
    k_turb::Float64
    ka::Float64
    kd_gov::Float64
    ki_gov::Float64
    ki_load::Float64
    ki_mw::Float64
    kp_gov::Float64
    kp_load::Float64
    ld_ref::Float64
    p_ref::Union{Absent, Float64, Nothing} = ABSENT
    r::Union{Absent, Float64, Nothing} = ABSENT
    r_close::Float64
    r_lim::UpDown
    r_open::Float64
    r_select::Union{Absent, Int64, Nothing} = ABSENT
    t_act::Float64
    t_eng::Float64
    t_rate::Float64
    ta::Float64
    tb::Float64
    tc::Float64
    td_gov::Float64
    tf_load::Float64
    tpelec::Float64
    tsa::Float64
    tsb::Float64
    wf_nl::Float64
    db::Float64
    fuel_flag::Int64
    id::Int64
    speed_error_signal::MinMax
    valve_position_limits::MinMax
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{GeneralGovModel}, value) = _decode(GeneralGovModel, value, true)
function _decode(::Type{GeneralGovModel}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-d5d2d2b15ebff194ab18.json",
            pointer="/components/schemas/GeneralGovModel",
        ),
        _openapi_raw,
        "decoding GeneralGovModel";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "GeneralGovModel")
    _openapi_field_a_set = _decode(
        Float64,
        _required(_openapi_object, "A_set", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_dm = _decode(
        Float64,
        _required(_openapi_object, "Dm", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_k_turb = _decode(
        Float64,
        _required(_openapi_object, "K_turb", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_ka = _decode(
        Float64,
        _required(_openapi_object, "Ka", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_kd_gov = _decode(
        Float64,
        _required(_openapi_object, "Kd_gov", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_ki_gov = _decode(
        Float64,
        _required(_openapi_object, "Ki_gov", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_ki_load = _decode(
        Float64,
        _required(_openapi_object, "Ki_load", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_ki_mw = _decode(
        Float64,
        _required(_openapi_object, "Ki_mw", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_kp_gov = _decode(
        Float64,
        _required(_openapi_object, "Kp_gov", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_kp_load = _decode(
        Float64,
        _required(_openapi_object, "Kp_load", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_ld_ref = _decode(
        Float64,
        _required(_openapi_object, "Ld_ref", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_p_ref =
        haskey(_openapi_object, "P_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["P_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_r =
        haskey(_openapi_object, "R") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["R"], _openapi_validate) :
        ABSENT
    _openapi_field_r_close = _decode(
        Float64,
        _required(_openapi_object, "R_close", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_r_lim = _decode(
        UpDown,
        _required(_openapi_object, "R_lim", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_r_open = _decode(
        Float64,
        _required(_openapi_object, "R_open", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_r_select =
        haskey(_openapi_object, "R_select") ?
        _decode(
            Union{Absent, Int64, Nothing},
            _openapi_object["R_select"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_t_act = _decode(
        Float64,
        _required(_openapi_object, "T_act", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_t_eng = _decode(
        Float64,
        _required(_openapi_object, "T_eng", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_t_rate = _decode(
        Float64,
        _required(_openapi_object, "T_rate", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_ta = _decode(
        Float64,
        _required(_openapi_object, "Ta", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_tb = _decode(
        Float64,
        _required(_openapi_object, "Tb", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_tc = _decode(
        Float64,
        _required(_openapi_object, "Tc", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_td_gov = _decode(
        Float64,
        _required(_openapi_object, "Td_gov", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_tf_load = _decode(
        Float64,
        _required(_openapi_object, "Tf_load", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_tpelec = _decode(
        Float64,
        _required(_openapi_object, "Tpelec", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_tsa = _decode(
        Float64,
        _required(_openapi_object, "Tsa", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_tsb = _decode(
        Float64,
        _required(_openapi_object, "Tsb", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_wf_nl = _decode(
        Float64,
        _required(_openapi_object, "Wf_nl", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_db = _decode(
        Float64,
        _required(_openapi_object, "db", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_fuel_flag = _decode(
        Int64,
        _required(_openapi_object, "fuel_flag", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_id = _decode(
        Int64,
        _required(_openapi_object, "id", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_speed_error_signal = _decode(
        MinMax,
        _required(_openapi_object, "speed_error_signal", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_field_valve_position_limits = _decode(
        MinMax,
        _required(_openapi_object, "valve_position_limits", "GeneralGovModel"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "A_set",
            "Dm",
            "K_turb",
            "Ka",
            "Kd_gov",
            "Ki_gov",
            "Ki_load",
            "Ki_mw",
            "Kp_gov",
            "Kp_load",
            "Ld_ref",
            "P_ref",
            "R",
            "R_close",
            "R_lim",
            "R_open",
            "R_select",
            "T_act",
            "T_eng",
            "T_rate",
            "Ta",
            "Tb",
            "Tc",
            "Td_gov",
            "Tf_load",
            "Tpelec",
            "Tsa",
            "Tsb",
            "Wf_nl",
            "db",
            "fuel_flag",
            "id",
            "speed_error_signal",
            "valve_position_limits",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return GeneralGovModel(;
        a_set=_openapi_field_a_set,
        dm=_openapi_field_dm,
        k_turb=_openapi_field_k_turb,
        ka=_openapi_field_ka,
        kd_gov=_openapi_field_kd_gov,
        ki_gov=_openapi_field_ki_gov,
        ki_load=_openapi_field_ki_load,
        ki_mw=_openapi_field_ki_mw,
        kp_gov=_openapi_field_kp_gov,
        kp_load=_openapi_field_kp_load,
        ld_ref=_openapi_field_ld_ref,
        p_ref=_openapi_field_p_ref,
        r=_openapi_field_r,
        r_close=_openapi_field_r_close,
        r_lim=_openapi_field_r_lim,
        r_open=_openapi_field_r_open,
        r_select=_openapi_field_r_select,
        t_act=_openapi_field_t_act,
        t_eng=_openapi_field_t_eng,
        t_rate=_openapi_field_t_rate,
        ta=_openapi_field_ta,
        tb=_openapi_field_tb,
        tc=_openapi_field_tc,
        td_gov=_openapi_field_td_gov,
        tf_load=_openapi_field_tf_load,
        tpelec=_openapi_field_tpelec,
        tsa=_openapi_field_tsa,
        tsb=_openapi_field_tsb,
        wf_nl=_openapi_field_wf_nl,
        db=_openapi_field_db,
        fuel_flag=_openapi_field_fuel_flag,
        id=_openapi_field_id,
        speed_error_signal=_openapi_field_speed_error_signal,
        valve_position_limits=_openapi_field_valve_position_limits,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::GeneralGovModel)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.a_set isa Absent ||
        (_openapi_output["A_set"] = _encode(_openapi_value.a_set))
    _openapi_value.dm isa Absent || (_openapi_output["Dm"] = _encode(_openapi_value.dm))
    _openapi_value.k_turb isa Absent ||
        (_openapi_output["K_turb"] = _encode(_openapi_value.k_turb))
    _openapi_value.ka isa Absent || (_openapi_output["Ka"] = _encode(_openapi_value.ka))
    _openapi_value.kd_gov isa Absent ||
        (_openapi_output["Kd_gov"] = _encode(_openapi_value.kd_gov))
    _openapi_value.ki_gov isa Absent ||
        (_openapi_output["Ki_gov"] = _encode(_openapi_value.ki_gov))
    _openapi_value.ki_load isa Absent ||
        (_openapi_output["Ki_load"] = _encode(_openapi_value.ki_load))
    _openapi_value.ki_mw isa Absent ||
        (_openapi_output["Ki_mw"] = _encode(_openapi_value.ki_mw))
    _openapi_value.kp_gov isa Absent ||
        (_openapi_output["Kp_gov"] = _encode(_openapi_value.kp_gov))
    _openapi_value.kp_load isa Absent ||
        (_openapi_output["Kp_load"] = _encode(_openapi_value.kp_load))
    _openapi_value.ld_ref isa Absent ||
        (_openapi_output["Ld_ref"] = _encode(_openapi_value.ld_ref))
    _openapi_value.p_ref isa Absent ||
        (_openapi_output["P_ref"] = _encode(_openapi_value.p_ref))
    _openapi_value.r isa Absent || (_openapi_output["R"] = _encode(_openapi_value.r))
    _openapi_value.r_close isa Absent ||
        (_openapi_output["R_close"] = _encode(_openapi_value.r_close))
    _openapi_value.r_lim isa Absent ||
        (_openapi_output["R_lim"] = _encode(_openapi_value.r_lim))
    _openapi_value.r_open isa Absent ||
        (_openapi_output["R_open"] = _encode(_openapi_value.r_open))
    _openapi_value.r_select isa Absent ||
        (_openapi_output["R_select"] = _encode(_openapi_value.r_select))
    _openapi_value.t_act isa Absent ||
        (_openapi_output["T_act"] = _encode(_openapi_value.t_act))
    _openapi_value.t_eng isa Absent ||
        (_openapi_output["T_eng"] = _encode(_openapi_value.t_eng))
    _openapi_value.t_rate isa Absent ||
        (_openapi_output["T_rate"] = _encode(_openapi_value.t_rate))
    _openapi_value.ta isa Absent || (_openapi_output["Ta"] = _encode(_openapi_value.ta))
    _openapi_value.tb isa Absent || (_openapi_output["Tb"] = _encode(_openapi_value.tb))
    _openapi_value.tc isa Absent || (_openapi_output["Tc"] = _encode(_openapi_value.tc))
    _openapi_value.td_gov isa Absent ||
        (_openapi_output["Td_gov"] = _encode(_openapi_value.td_gov))
    _openapi_value.tf_load isa Absent ||
        (_openapi_output["Tf_load"] = _encode(_openapi_value.tf_load))
    _openapi_value.tpelec isa Absent ||
        (_openapi_output["Tpelec"] = _encode(_openapi_value.tpelec))
    _openapi_value.tsa isa Absent || (_openapi_output["Tsa"] = _encode(_openapi_value.tsa))
    _openapi_value.tsb isa Absent || (_openapi_output["Tsb"] = _encode(_openapi_value.tsb))
    _openapi_value.wf_nl isa Absent ||
        (_openapi_output["Wf_nl"] = _encode(_openapi_value.wf_nl))
    _openapi_value.db isa Absent || (_openapi_output["db"] = _encode(_openapi_value.db))
    _openapi_value.fuel_flag isa Absent ||
        (_openapi_output["fuel_flag"] = _encode(_openapi_value.fuel_flag))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.speed_error_signal isa Absent ||
        (_openapi_output["speed_error_signal"] = _encode(_openapi_value.speed_error_signal))
    _openapi_value.valve_position_limits isa Absent || (
        _openapi_output["valve_position_limits"] =
            _encode(_openapi_value.valve_position_limits)
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
            pointer="/components/schemas/GeneralGovModel",
        ),
        _openapi_output,
        "encoding GeneralGovModel";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::GeneralGovModel)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.a_set isa Absent ||
        push!(_openapi_output, "A_set" => _openapi_value.a_set)
    _openapi_value.dm isa Absent || push!(_openapi_output, "Dm" => _openapi_value.dm)
    _openapi_value.k_turb isa Absent ||
        push!(_openapi_output, "K_turb" => _openapi_value.k_turb)
    _openapi_value.ka isa Absent || push!(_openapi_output, "Ka" => _openapi_value.ka)
    _openapi_value.kd_gov isa Absent ||
        push!(_openapi_output, "Kd_gov" => _openapi_value.kd_gov)
    _openapi_value.ki_gov isa Absent ||
        push!(_openapi_output, "Ki_gov" => _openapi_value.ki_gov)
    _openapi_value.ki_load isa Absent ||
        push!(_openapi_output, "Ki_load" => _openapi_value.ki_load)
    _openapi_value.ki_mw isa Absent ||
        push!(_openapi_output, "Ki_mw" => _openapi_value.ki_mw)
    _openapi_value.kp_gov isa Absent ||
        push!(_openapi_output, "Kp_gov" => _openapi_value.kp_gov)
    _openapi_value.kp_load isa Absent ||
        push!(_openapi_output, "Kp_load" => _openapi_value.kp_load)
    _openapi_value.ld_ref isa Absent ||
        push!(_openapi_output, "Ld_ref" => _openapi_value.ld_ref)
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    _openapi_value.r isa Absent || push!(_openapi_output, "R" => _openapi_value.r)
    _openapi_value.r_close isa Absent ||
        push!(_openapi_output, "R_close" => _openapi_value.r_close)
    _openapi_value.r_lim isa Absent ||
        push!(_openapi_output, "R_lim" => _openapi_value.r_lim)
    _openapi_value.r_open isa Absent ||
        push!(_openapi_output, "R_open" => _openapi_value.r_open)
    _openapi_value.r_select isa Absent ||
        push!(_openapi_output, "R_select" => _openapi_value.r_select)
    _openapi_value.t_act isa Absent ||
        push!(_openapi_output, "T_act" => _openapi_value.t_act)
    _openapi_value.t_eng isa Absent ||
        push!(_openapi_output, "T_eng" => _openapi_value.t_eng)
    _openapi_value.t_rate isa Absent ||
        push!(_openapi_output, "T_rate" => _openapi_value.t_rate)
    _openapi_value.ta isa Absent || push!(_openapi_output, "Ta" => _openapi_value.ta)
    _openapi_value.tb isa Absent || push!(_openapi_output, "Tb" => _openapi_value.tb)
    _openapi_value.tc isa Absent || push!(_openapi_output, "Tc" => _openapi_value.tc)
    _openapi_value.td_gov isa Absent ||
        push!(_openapi_output, "Td_gov" => _openapi_value.td_gov)
    _openapi_value.tf_load isa Absent ||
        push!(_openapi_output, "Tf_load" => _openapi_value.tf_load)
    _openapi_value.tpelec isa Absent ||
        push!(_openapi_output, "Tpelec" => _openapi_value.tpelec)
    _openapi_value.tsa isa Absent || push!(_openapi_output, "Tsa" => _openapi_value.tsa)
    _openapi_value.tsb isa Absent || push!(_openapi_output, "Tsb" => _openapi_value.tsb)
    _openapi_value.wf_nl isa Absent ||
        push!(_openapi_output, "Wf_nl" => _openapi_value.wf_nl)
    _openapi_value.db isa Absent || push!(_openapi_output, "db" => _openapi_value.db)
    _openapi_value.fuel_flag isa Absent ||
        push!(_openapi_output, "fuel_flag" => _openapi_value.fuel_flag)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.speed_error_signal isa Absent ||
        push!(_openapi_output, "speed_error_signal" => _openapi_value.speed_error_signal)
    _openapi_value.valve_position_limits isa Absent || push!(
        _openapi_output,
        "valve_position_limits" => _openapi_value.valve_position_limits,
    )
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
