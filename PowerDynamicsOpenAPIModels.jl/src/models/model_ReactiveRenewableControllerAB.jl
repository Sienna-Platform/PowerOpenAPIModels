"""
    ReactiveRenewableControllerAB

Parameters of Reactive Power Controller including REPCA1 and REECB1.

  - `bus_control`: ACBus identification number for voltage control. `0` identifies the local bus connected to this component.
  - `from_branch_control`: Monitored branch FROM bus identification number for line drop compensation (if 0 generator power will be used).
  - `to_branch_control`: Monitored branch TO bus identification number for line drop compensation (if 0 generator power will be used).
  - `branch_id_control`: Branch circuit id for line drop compensation (as a string). If 0 generator power will be used.
  - `vc_flag`: Voltage Compensator Flag for REPCA1.
  - `ref_flag`: Flag for Reactive Power Control for REPCA1. `false`: Q-control, `true`: V-control.
  - `pf_flag`: Flag for Power Factor Control for Outer Control of REECB1. `false`: Q-control, `true`: Power Factor Control.
  - `v_flag`: Flag for Voltage Control for Outer Control of REECB1. `false`: Voltage Control, `true`: Q-Control.
  - `t_fltr`: Voltage or Q-power of REPCA Filter Time Constant. Units: s.
  - `k_p`: Reactive power PI control proportional gain.
  - `k_i`: Reactive power PI control integral gain.
  - `t_ft`: Reactive power lead time constant. Units: s.
  - `t_fv`: Reactive power lag time constant. Units: s.
  - `v_frz`: Voltage below which state xiq_oc (integrator state) is freeze.
  - `r_c`: Line drop compensation resistance (used when VC_Flag = 1).
  - `x_c`: Line drop compensation reactance (used when VC_Flag = 1).
  - `k_c`: Reactive current compensation gain (used when VC_Flag = 0).
  - `e_lim`: Upper/Lower limit on Voltage or Q-power deadband output `(e_min, e_max)`.
  - `dbd_pnts`: Voltage or Q-power error dead band thresholds `(dbd1, dbd2)`.
  - `q_lim`: Upper/Lower limit on reactive power V/Q control in REPCA `(Q_min, Q_max)`.
  - `t_p`: Active power lag time constant in REECB. Used only when PF_Flag = 1. Units: s.
  - `q_lim_inner`: Upper/Lower limit on reactive power input in REECB `(Q_min_inner, Q_max_inner)`. Only used when V_Flag = 1.
  - `v_lim`: Upper/Lower limit on reactive power PI controller in REECB `(V_min, V_max)`. Only used when V_Flag = 1.
  - `k_qp`: Reactive power regulator proportional gain (used when V_Flag = 1).
  - `k_qi`: Reactive power regulator integral gain (used when V_Flag = 1).
  - `q_ref`: Reference Reactive Power Set-point.
  - `v_ref`: Reference Voltage Set-point.
"""
Base.@kwdef struct ReactiveRenewableControllerAB <: APIModel
    bus_control::Int64
    from_branch_control::Int64
    to_branch_control::Int64
    branch_id_control::String
    vc_flag::Bool
    ref_flag::Bool
    pf_flag::Bool
    v_flag::Bool
    t_fltr::Float64
    k_p::Float64
    k_i::Float64
    t_ft::Float64
    t_fv::Float64
    v_frz::Float64
    r_c::Float64
    x_c::Float64
    k_c::Float64
    e_lim::MinMax
    dbd_pnts::DbdPnts
    q_lim::MinMax
    t_p::Float64
    q_lim_inner::MinMax
    v_lim::MinMax
    k_qp::Float64
    k_qi::Float64
    q_ref::Union{Absent, Float64, Nothing} = ABSENT
    v_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ReactiveRenewableControllerAB}, value) =
    _decode(ReactiveRenewableControllerAB, value, true)
function _decode(
    ::Type{ReactiveRenewableControllerAB},
    _openapi_raw,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-3185257ed44962fba368.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding ReactiveRenewableControllerAB";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ReactiveRenewableControllerAB")
    _openapi_field_bus_control = _decode(
        Int64,
        _required(_openapi_object, "bus_control", "ReactiveRenewableControllerAB"),
        _openapi_validate,
    )
    _openapi_field_from_branch_control = _decode(
        Int64,
        _required(_openapi_object, "from_branch_control", "ReactiveRenewableControllerAB"),
        _openapi_validate,
    )
    _openapi_field_to_branch_control = _decode(
        Int64,
        _required(_openapi_object, "to_branch_control", "ReactiveRenewableControllerAB"),
        _openapi_validate,
    )
    _openapi_field_branch_id_control = _decode(
        String,
        _required(_openapi_object, "branch_id_control", "ReactiveRenewableControllerAB"),
        _openapi_validate,
    )
    _openapi_field_vc_flag = _decode(
        Bool,
        _required(_openapi_object, "VC_Flag", "ReactiveRenewableControllerAB"),
        _openapi_validate,
    )
    _openapi_field_ref_flag = _decode(
        Bool,
        _required(_openapi_object, "Ref_Flag", "ReactiveRenewableControllerAB"),
        _openapi_validate,
    )
    _openapi_field_pf_flag = _decode(
        Bool,
        _required(_openapi_object, "PF_Flag", "ReactiveRenewableControllerAB"),
        _openapi_validate,
    )
    _openapi_field_v_flag = _decode(
        Bool,
        _required(_openapi_object, "V_Flag", "ReactiveRenewableControllerAB"),
        _openapi_validate,
    )
    _openapi_field_t_fltr = _decode(
        Float64,
        _required(_openapi_object, "T_fltr", "ReactiveRenewableControllerAB"),
        _openapi_validate,
    )
    _openapi_field_k_p = _decode(
        Float64,
        _required(_openapi_object, "K_p", "ReactiveRenewableControllerAB"),
        _openapi_validate,
    )
    _openapi_field_k_i = _decode(
        Float64,
        _required(_openapi_object, "K_i", "ReactiveRenewableControllerAB"),
        _openapi_validate,
    )
    _openapi_field_t_ft = _decode(
        Float64,
        _required(_openapi_object, "T_ft", "ReactiveRenewableControllerAB"),
        _openapi_validate,
    )
    _openapi_field_t_fv = _decode(
        Float64,
        _required(_openapi_object, "T_fv", "ReactiveRenewableControllerAB"),
        _openapi_validate,
    )
    _openapi_field_v_frz = _decode(
        Float64,
        _required(_openapi_object, "V_frz", "ReactiveRenewableControllerAB"),
        _openapi_validate,
    )
    _openapi_field_r_c = _decode(
        Float64,
        _required(_openapi_object, "R_c", "ReactiveRenewableControllerAB"),
        _openapi_validate,
    )
    _openapi_field_x_c = _decode(
        Float64,
        _required(_openapi_object, "X_c", "ReactiveRenewableControllerAB"),
        _openapi_validate,
    )
    _openapi_field_k_c = _decode(
        Float64,
        _required(_openapi_object, "K_c", "ReactiveRenewableControllerAB"),
        _openapi_validate,
    )
    _openapi_field_e_lim = _decode(
        MinMax,
        _required(_openapi_object, "e_lim", "ReactiveRenewableControllerAB"),
        _openapi_validate,
    )
    _openapi_field_dbd_pnts = _decode(
        DbdPnts,
        _required(_openapi_object, "dbd_pnts", "ReactiveRenewableControllerAB"),
        _openapi_validate,
    )
    _openapi_field_q_lim = _decode(
        MinMax,
        _required(_openapi_object, "Q_lim", "ReactiveRenewableControllerAB"),
        _openapi_validate,
    )
    _openapi_field_t_p = _decode(
        Float64,
        _required(_openapi_object, "T_p", "ReactiveRenewableControllerAB"),
        _openapi_validate,
    )
    _openapi_field_q_lim_inner = _decode(
        MinMax,
        _required(_openapi_object, "Q_lim_inner", "ReactiveRenewableControllerAB"),
        _openapi_validate,
    )
    _openapi_field_v_lim = _decode(
        MinMax,
        _required(_openapi_object, "V_lim", "ReactiveRenewableControllerAB"),
        _openapi_validate,
    )
    _openapi_field_k_qp = _decode(
        Float64,
        _required(_openapi_object, "K_qp", "ReactiveRenewableControllerAB"),
        _openapi_validate,
    )
    _openapi_field_k_qi = _decode(
        Float64,
        _required(_openapi_object, "K_qi", "ReactiveRenewableControllerAB"),
        _openapi_validate,
    )
    _openapi_field_q_ref =
        haskey(_openapi_object, "Q_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["Q_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_v_ref =
        haskey(_openapi_object, "V_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["V_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "bus_control",
            "from_branch_control",
            "to_branch_control",
            "branch_id_control",
            "VC_Flag",
            "Ref_Flag",
            "PF_Flag",
            "V_Flag",
            "T_fltr",
            "K_p",
            "K_i",
            "T_ft",
            "T_fv",
            "V_frz",
            "R_c",
            "X_c",
            "K_c",
            "e_lim",
            "dbd_pnts",
            "Q_lim",
            "T_p",
            "Q_lim_inner",
            "V_lim",
            "K_qp",
            "K_qi",
            "Q_ref",
            "V_ref",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return ReactiveRenewableControllerAB(;
        bus_control=_openapi_field_bus_control,
        from_branch_control=_openapi_field_from_branch_control,
        to_branch_control=_openapi_field_to_branch_control,
        branch_id_control=_openapi_field_branch_id_control,
        vc_flag=_openapi_field_vc_flag,
        ref_flag=_openapi_field_ref_flag,
        pf_flag=_openapi_field_pf_flag,
        v_flag=_openapi_field_v_flag,
        t_fltr=_openapi_field_t_fltr,
        k_p=_openapi_field_k_p,
        k_i=_openapi_field_k_i,
        t_ft=_openapi_field_t_ft,
        t_fv=_openapi_field_t_fv,
        v_frz=_openapi_field_v_frz,
        r_c=_openapi_field_r_c,
        x_c=_openapi_field_x_c,
        k_c=_openapi_field_k_c,
        e_lim=_openapi_field_e_lim,
        dbd_pnts=_openapi_field_dbd_pnts,
        q_lim=_openapi_field_q_lim,
        t_p=_openapi_field_t_p,
        q_lim_inner=_openapi_field_q_lim_inner,
        v_lim=_openapi_field_v_lim,
        k_qp=_openapi_field_k_qp,
        k_qi=_openapi_field_k_qi,
        q_ref=_openapi_field_q_ref,
        v_ref=_openapi_field_v_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::ReactiveRenewableControllerAB)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.bus_control isa Absent ||
        (_openapi_output["bus_control"] = _encode(_openapi_value.bus_control))
    _openapi_value.from_branch_control isa Absent || (
        _openapi_output["from_branch_control"] =
            _encode(_openapi_value.from_branch_control)
    )
    _openapi_value.to_branch_control isa Absent ||
        (_openapi_output["to_branch_control"] = _encode(_openapi_value.to_branch_control))
    _openapi_value.branch_id_control isa Absent ||
        (_openapi_output["branch_id_control"] = _encode(_openapi_value.branch_id_control))
    _openapi_value.vc_flag isa Absent ||
        (_openapi_output["VC_Flag"] = _encode(_openapi_value.vc_flag))
    _openapi_value.ref_flag isa Absent ||
        (_openapi_output["Ref_Flag"] = _encode(_openapi_value.ref_flag))
    _openapi_value.pf_flag isa Absent ||
        (_openapi_output["PF_Flag"] = _encode(_openapi_value.pf_flag))
    _openapi_value.v_flag isa Absent ||
        (_openapi_output["V_Flag"] = _encode(_openapi_value.v_flag))
    _openapi_value.t_fltr isa Absent ||
        (_openapi_output["T_fltr"] = _encode(_openapi_value.t_fltr))
    _openapi_value.k_p isa Absent || (_openapi_output["K_p"] = _encode(_openapi_value.k_p))
    _openapi_value.k_i isa Absent || (_openapi_output["K_i"] = _encode(_openapi_value.k_i))
    _openapi_value.t_ft isa Absent ||
        (_openapi_output["T_ft"] = _encode(_openapi_value.t_ft))
    _openapi_value.t_fv isa Absent ||
        (_openapi_output["T_fv"] = _encode(_openapi_value.t_fv))
    _openapi_value.v_frz isa Absent ||
        (_openapi_output["V_frz"] = _encode(_openapi_value.v_frz))
    _openapi_value.r_c isa Absent || (_openapi_output["R_c"] = _encode(_openapi_value.r_c))
    _openapi_value.x_c isa Absent || (_openapi_output["X_c"] = _encode(_openapi_value.x_c))
    _openapi_value.k_c isa Absent || (_openapi_output["K_c"] = _encode(_openapi_value.k_c))
    _openapi_value.e_lim isa Absent ||
        (_openapi_output["e_lim"] = _encode(_openapi_value.e_lim))
    _openapi_value.dbd_pnts isa Absent ||
        (_openapi_output["dbd_pnts"] = _encode(_openapi_value.dbd_pnts))
    _openapi_value.q_lim isa Absent ||
        (_openapi_output["Q_lim"] = _encode(_openapi_value.q_lim))
    _openapi_value.t_p isa Absent || (_openapi_output["T_p"] = _encode(_openapi_value.t_p))
    _openapi_value.q_lim_inner isa Absent ||
        (_openapi_output["Q_lim_inner"] = _encode(_openapi_value.q_lim_inner))
    _openapi_value.v_lim isa Absent ||
        (_openapi_output["V_lim"] = _encode(_openapi_value.v_lim))
    _openapi_value.k_qp isa Absent ||
        (_openapi_output["K_qp"] = _encode(_openapi_value.k_qp))
    _openapi_value.k_qi isa Absent ||
        (_openapi_output["K_qi"] = _encode(_openapi_value.k_qi))
    _openapi_value.q_ref isa Absent ||
        (_openapi_output["Q_ref"] = _encode(_openapi_value.q_ref))
    _openapi_value.v_ref isa Absent ||
        (_openapi_output["V_ref"] = _encode(_openapi_value.v_ref))
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
            resource="https://openapi.invalid/schema/external-3185257ed44962fba368.json",
            pointer="",
        ),
        _openapi_output,
        "encoding ReactiveRenewableControllerAB";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::ReactiveRenewableControllerAB)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.bus_control isa Absent ||
        push!(_openapi_output, "bus_control" => _openapi_value.bus_control)
    _openapi_value.from_branch_control isa Absent ||
        push!(_openapi_output, "from_branch_control" => _openapi_value.from_branch_control)
    _openapi_value.to_branch_control isa Absent ||
        push!(_openapi_output, "to_branch_control" => _openapi_value.to_branch_control)
    _openapi_value.branch_id_control isa Absent ||
        push!(_openapi_output, "branch_id_control" => _openapi_value.branch_id_control)
    _openapi_value.vc_flag isa Absent ||
        push!(_openapi_output, "VC_Flag" => _openapi_value.vc_flag)
    _openapi_value.ref_flag isa Absent ||
        push!(_openapi_output, "Ref_Flag" => _openapi_value.ref_flag)
    _openapi_value.pf_flag isa Absent ||
        push!(_openapi_output, "PF_Flag" => _openapi_value.pf_flag)
    _openapi_value.v_flag isa Absent ||
        push!(_openapi_output, "V_Flag" => _openapi_value.v_flag)
    _openapi_value.t_fltr isa Absent ||
        push!(_openapi_output, "T_fltr" => _openapi_value.t_fltr)
    _openapi_value.k_p isa Absent || push!(_openapi_output, "K_p" => _openapi_value.k_p)
    _openapi_value.k_i isa Absent || push!(_openapi_output, "K_i" => _openapi_value.k_i)
    _openapi_value.t_ft isa Absent || push!(_openapi_output, "T_ft" => _openapi_value.t_ft)
    _openapi_value.t_fv isa Absent || push!(_openapi_output, "T_fv" => _openapi_value.t_fv)
    _openapi_value.v_frz isa Absent ||
        push!(_openapi_output, "V_frz" => _openapi_value.v_frz)
    _openapi_value.r_c isa Absent || push!(_openapi_output, "R_c" => _openapi_value.r_c)
    _openapi_value.x_c isa Absent || push!(_openapi_output, "X_c" => _openapi_value.x_c)
    _openapi_value.k_c isa Absent || push!(_openapi_output, "K_c" => _openapi_value.k_c)
    _openapi_value.e_lim isa Absent ||
        push!(_openapi_output, "e_lim" => _openapi_value.e_lim)
    _openapi_value.dbd_pnts isa Absent ||
        push!(_openapi_output, "dbd_pnts" => _openapi_value.dbd_pnts)
    _openapi_value.q_lim isa Absent ||
        push!(_openapi_output, "Q_lim" => _openapi_value.q_lim)
    _openapi_value.t_p isa Absent || push!(_openapi_output, "T_p" => _openapi_value.t_p)
    _openapi_value.q_lim_inner isa Absent ||
        push!(_openapi_output, "Q_lim_inner" => _openapi_value.q_lim_inner)
    _openapi_value.v_lim isa Absent ||
        push!(_openapi_output, "V_lim" => _openapi_value.v_lim)
    _openapi_value.k_qp isa Absent || push!(_openapi_output, "K_qp" => _openapi_value.k_qp)
    _openapi_value.k_qi isa Absent || push!(_openapi_output, "K_qi" => _openapi_value.k_qi)
    _openapi_value.q_ref isa Absent ||
        push!(_openapi_output, "Q_ref" => _openapi_value.q_ref)
    _openapi_value.v_ref isa Absent ||
        push!(_openapi_output, "V_ref" => _openapi_value.v_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
