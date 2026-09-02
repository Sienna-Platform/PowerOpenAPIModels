@doc "    ReactiveRenewableControllerAB\n\nParameters of Reactive Power Controller including REPCA1 and REECB1.\n\n- `k_c`: Reactive current compensation gain (used when VC_Flag = 0).\n- `k_i`: Reactive power PI control integral gain.\n- `k_p`: Reactive power PI control proportional gain.\n- `k_qi`: Reactive power regulator integral gain (used when V_Flag = 1).\n- `k_qp`: Reactive power regulator proportional gain (used when V_Flag = 1).\n- `pf_flag`: Flag for Power Factor Control for Outer Control of REECB1. `false`: Q-control, `true`: Power Factor Control.\n- `q_lim`: Upper/Lower limit on reactive power V/Q control in REPCA `(Q_min, Q_max)`.\n- `q_lim_inner`: Upper/Lower limit on reactive power input in REECB `(Q_min_inner, Q_max_inner)`. Only used when V_Flag = 1.\n- `q_ref`: Reference Reactive Power Set-point.\n- `r_c`: Line drop compensation resistance (used when VC_Flag = 1).\n- `ref_flag`: Flag for Reactive Power Control for REPCA1. `false`: Q-control, `true`: V-control.\n- `t_fltr`: Voltage or Q-power of REPCA Filter Time Constant. Units: s.\n- `t_ft`: Reactive power lead time constant. Units: s.\n- `t_fv`: Reactive power lag time constant. Units: s.\n- `t_p`: Active power lag time constant in REECB. Used only when PF_Flag = 1. Units: s.\n- `vc_flag`: Voltage Compensator Flag for REPCA1.\n- `v_flag`: Flag for Voltage Control for Outer Control of REECB1. `false`: Voltage Control, `true`: Q-Control.\n- `v_frz`: Voltage below which state xiq_oc (integrator state) is freeze.\n- `v_lim`: Upper/Lower limit on reactive power PI controller in REECB `(V_min, V_max)`. Only used when V_Flag = 1.\n- `v_ref`: Reference Voltage Set-point.\n- `x_c`: Line drop compensation reactance (used when VC_Flag = 1).\n- `branch_id_control`: Branch circuit id for line drop compensation (as a string). If 0 generator power will be used.\n- `bus_control`: ACBus identification number for voltage control. `0` identifies the local bus connected to this component.\n- `dbd_pnts`: Voltage or Q-power error dead band thresholds `(dbd1, dbd2)`.\n- `e_lim`: Upper/Lower limit on Voltage or Q-power deadband output `(e_min, e_max)`.\n- `from_branch_control`: Monitored branch FROM bus identification number for line drop compensation (if 0 generator power will be used).\n- `to_branch_control`: Monitored branch TO bus identification number for line drop compensation (if 0 generator power will be used)."
Base.@kwdef struct ReactiveRenewableControllerAB
    k_c::Float64
    k_i::Float64
    k_p::Float64
    k_qi::Float64
    k_qp::Float64
    pf_flag::Bool
    q_lim::ReactiveRenewableControllerABQLim
    q_lim_inner::ReactiveRenewableControllerABQLimInner
    q_ref::Union{Absent,Float64,Nothing} = ABSENT
    r_c::Float64
    ref_flag::Bool
    t_fltr::Float64
    t_ft::Float64
    t_fv::Float64
    t_p::Float64
    vc_flag::Bool
    v_flag::Bool
    v_frz::Float64
    v_lim::ReactiveRenewableControllerABVLim
    v_ref::Union{Absent,Float64,Nothing} = ABSENT
    x_c::Float64
    branch_id_control::String
    bus_control::Int64
    dbd_pnts::ReactiveRenewableControllerABDbdPnts
    e_lim::ReactiveRenewableControllerABELim
    from_branch_control::Int64
    to_branch_control::Int64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{ReactiveRenewableControllerAB}, value) = _decode(ReactiveRenewableControllerAB, value, true)
function _decode(::Type{ReactiveRenewableControllerAB}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-832ddeca7e6e67b0c295.json", pointer = "/components/schemas/ReactiveRenewableControllerAB"), _openapi_raw, "decoding ReactiveRenewableControllerAB"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "ReactiveRenewableControllerAB")
    _openapi_field_k_c = _decode(Float64, _required(_openapi_object, "K_c", "ReactiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_k_i = _decode(Float64, _required(_openapi_object, "K_i", "ReactiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_k_p = _decode(Float64, _required(_openapi_object, "K_p", "ReactiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_k_qi = _decode(Float64, _required(_openapi_object, "K_qi", "ReactiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_k_qp = _decode(Float64, _required(_openapi_object, "K_qp", "ReactiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_pf_flag = _decode(Bool, _required(_openapi_object, "PF_Flag", "ReactiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_q_lim = _decode(ReactiveRenewableControllerABQLim, _required(_openapi_object, "Q_lim", "ReactiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_q_lim_inner = _decode(ReactiveRenewableControllerABQLimInner, _required(_openapi_object, "Q_lim_inner", "ReactiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_q_ref = haskey(_openapi_object, "Q_ref") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["Q_ref"], _openapi_validate) : ABSENT
    _openapi_field_r_c = _decode(Float64, _required(_openapi_object, "R_c", "ReactiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_ref_flag = _decode(Bool, _required(_openapi_object, "Ref_Flag", "ReactiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_t_fltr = _decode(Float64, _required(_openapi_object, "T_fltr", "ReactiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_t_ft = _decode(Float64, _required(_openapi_object, "T_ft", "ReactiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_t_fv = _decode(Float64, _required(_openapi_object, "T_fv", "ReactiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_t_p = _decode(Float64, _required(_openapi_object, "T_p", "ReactiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_vc_flag = _decode(Bool, _required(_openapi_object, "VC_Flag", "ReactiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_v_flag = _decode(Bool, _required(_openapi_object, "V_Flag", "ReactiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_v_frz = _decode(Float64, _required(_openapi_object, "V_frz", "ReactiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_v_lim = _decode(ReactiveRenewableControllerABVLim, _required(_openapi_object, "V_lim", "ReactiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_v_ref = haskey(_openapi_object, "V_ref") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["V_ref"], _openapi_validate) : ABSENT
    _openapi_field_x_c = _decode(Float64, _required(_openapi_object, "X_c", "ReactiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_branch_id_control = _decode(String, _required(_openapi_object, "branch_id_control", "ReactiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_bus_control = _decode(Int64, _required(_openapi_object, "bus_control", "ReactiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_dbd_pnts = _decode(ReactiveRenewableControllerABDbdPnts, _required(_openapi_object, "dbd_pnts", "ReactiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_e_lim = _decode(ReactiveRenewableControllerABELim, _required(_openapi_object, "e_lim", "ReactiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_from_branch_control = _decode(Int64, _required(_openapi_object, "from_branch_control", "ReactiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_to_branch_control = _decode(Int64, _required(_openapi_object, "to_branch_control", "ReactiveRenewableControllerAB"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("K_c","K_i","K_p","K_qi","K_qp","PF_Flag","Q_lim","Q_lim_inner","Q_ref","R_c","Ref_Flag","T_fltr","T_ft","T_fv","T_p","VC_Flag","V_Flag","V_frz","V_lim","V_ref","X_c","branch_id_control","bus_control","dbd_pnts","e_lim","from_branch_control","to_branch_control") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return ReactiveRenewableControllerAB(; k_c = _openapi_field_k_c, k_i = _openapi_field_k_i, k_p = _openapi_field_k_p, k_qi = _openapi_field_k_qi, k_qp = _openapi_field_k_qp, pf_flag = _openapi_field_pf_flag, q_lim = _openapi_field_q_lim, q_lim_inner = _openapi_field_q_lim_inner, q_ref = _openapi_field_q_ref, r_c = _openapi_field_r_c, ref_flag = _openapi_field_ref_flag, t_fltr = _openapi_field_t_fltr, t_ft = _openapi_field_t_ft, t_fv = _openapi_field_t_fv, t_p = _openapi_field_t_p, vc_flag = _openapi_field_vc_flag, v_flag = _openapi_field_v_flag, v_frz = _openapi_field_v_frz, v_lim = _openapi_field_v_lim, v_ref = _openapi_field_v_ref, x_c = _openapi_field_x_c, branch_id_control = _openapi_field_branch_id_control, bus_control = _openapi_field_bus_control, dbd_pnts = _openapi_field_dbd_pnts, e_lim = _openapi_field_e_lim, from_branch_control = _openapi_field_from_branch_control, to_branch_control = _openapi_field_to_branch_control, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::ReactiveRenewableControllerAB)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.k_c isa Absent || (_openapi_output["K_c"] = _encode(_openapi_value.k_c))
    _openapi_value.k_i isa Absent || (_openapi_output["K_i"] = _encode(_openapi_value.k_i))
    _openapi_value.k_p isa Absent || (_openapi_output["K_p"] = _encode(_openapi_value.k_p))
    _openapi_value.k_qi isa Absent || (_openapi_output["K_qi"] = _encode(_openapi_value.k_qi))
    _openapi_value.k_qp isa Absent || (_openapi_output["K_qp"] = _encode(_openapi_value.k_qp))
    _openapi_value.pf_flag isa Absent || (_openapi_output["PF_Flag"] = _encode(_openapi_value.pf_flag))
    _openapi_value.q_lim isa Absent || (_openapi_output["Q_lim"] = _encode(_openapi_value.q_lim))
    _openapi_value.q_lim_inner isa Absent || (_openapi_output["Q_lim_inner"] = _encode(_openapi_value.q_lim_inner))
    _openapi_value.q_ref isa Absent || (_openapi_output["Q_ref"] = _encode(_openapi_value.q_ref))
    _openapi_value.r_c isa Absent || (_openapi_output["R_c"] = _encode(_openapi_value.r_c))
    _openapi_value.ref_flag isa Absent || (_openapi_output["Ref_Flag"] = _encode(_openapi_value.ref_flag))
    _openapi_value.t_fltr isa Absent || (_openapi_output["T_fltr"] = _encode(_openapi_value.t_fltr))
    _openapi_value.t_ft isa Absent || (_openapi_output["T_ft"] = _encode(_openapi_value.t_ft))
    _openapi_value.t_fv isa Absent || (_openapi_output["T_fv"] = _encode(_openapi_value.t_fv))
    _openapi_value.t_p isa Absent || (_openapi_output["T_p"] = _encode(_openapi_value.t_p))
    _openapi_value.vc_flag isa Absent || (_openapi_output["VC_Flag"] = _encode(_openapi_value.vc_flag))
    _openapi_value.v_flag isa Absent || (_openapi_output["V_Flag"] = _encode(_openapi_value.v_flag))
    _openapi_value.v_frz isa Absent || (_openapi_output["V_frz"] = _encode(_openapi_value.v_frz))
    _openapi_value.v_lim isa Absent || (_openapi_output["V_lim"] = _encode(_openapi_value.v_lim))
    _openapi_value.v_ref isa Absent || (_openapi_output["V_ref"] = _encode(_openapi_value.v_ref))
    _openapi_value.x_c isa Absent || (_openapi_output["X_c"] = _encode(_openapi_value.x_c))
    _openapi_value.branch_id_control isa Absent || (_openapi_output["branch_id_control"] = _encode(_openapi_value.branch_id_control))
    _openapi_value.bus_control isa Absent || (_openapi_output["bus_control"] = _encode(_openapi_value.bus_control))
    _openapi_value.dbd_pnts isa Absent || (_openapi_output["dbd_pnts"] = _encode(_openapi_value.dbd_pnts))
    _openapi_value.e_lim isa Absent || (_openapi_output["e_lim"] = _encode(_openapi_value.e_lim))
    _openapi_value.from_branch_control isa Absent || (_openapi_output["from_branch_control"] = _encode(_openapi_value.from_branch_control))
    _openapi_value.to_branch_control isa Absent || (_openapi_output["to_branch_control"] = _encode(_openapi_value.to_branch_control))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-832ddeca7e6e67b0c295.json", pointer = "/components/schemas/ReactiveRenewableControllerAB"), _openapi_output, "encoding ReactiveRenewableControllerAB"; direction = :neutral)
end

function _form_fields(_openapi_value::ReactiveRenewableControllerAB)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.k_c isa Absent || push!(_openapi_output, "K_c" => _openapi_value.k_c)
    _openapi_value.k_i isa Absent || push!(_openapi_output, "K_i" => _openapi_value.k_i)
    _openapi_value.k_p isa Absent || push!(_openapi_output, "K_p" => _openapi_value.k_p)
    _openapi_value.k_qi isa Absent || push!(_openapi_output, "K_qi" => _openapi_value.k_qi)
    _openapi_value.k_qp isa Absent || push!(_openapi_output, "K_qp" => _openapi_value.k_qp)
    _openapi_value.pf_flag isa Absent || push!(_openapi_output, "PF_Flag" => _openapi_value.pf_flag)
    _openapi_value.q_lim isa Absent || push!(_openapi_output, "Q_lim" => _openapi_value.q_lim)
    _openapi_value.q_lim_inner isa Absent || push!(_openapi_output, "Q_lim_inner" => _openapi_value.q_lim_inner)
    _openapi_value.q_ref isa Absent || push!(_openapi_output, "Q_ref" => _openapi_value.q_ref)
    _openapi_value.r_c isa Absent || push!(_openapi_output, "R_c" => _openapi_value.r_c)
    _openapi_value.ref_flag isa Absent || push!(_openapi_output, "Ref_Flag" => _openapi_value.ref_flag)
    _openapi_value.t_fltr isa Absent || push!(_openapi_output, "T_fltr" => _openapi_value.t_fltr)
    _openapi_value.t_ft isa Absent || push!(_openapi_output, "T_ft" => _openapi_value.t_ft)
    _openapi_value.t_fv isa Absent || push!(_openapi_output, "T_fv" => _openapi_value.t_fv)
    _openapi_value.t_p isa Absent || push!(_openapi_output, "T_p" => _openapi_value.t_p)
    _openapi_value.vc_flag isa Absent || push!(_openapi_output, "VC_Flag" => _openapi_value.vc_flag)
    _openapi_value.v_flag isa Absent || push!(_openapi_output, "V_Flag" => _openapi_value.v_flag)
    _openapi_value.v_frz isa Absent || push!(_openapi_output, "V_frz" => _openapi_value.v_frz)
    _openapi_value.v_lim isa Absent || push!(_openapi_output, "V_lim" => _openapi_value.v_lim)
    _openapi_value.v_ref isa Absent || push!(_openapi_output, "V_ref" => _openapi_value.v_ref)
    _openapi_value.x_c isa Absent || push!(_openapi_output, "X_c" => _openapi_value.x_c)
    _openapi_value.branch_id_control isa Absent || push!(_openapi_output, "branch_id_control" => _openapi_value.branch_id_control)
    _openapi_value.bus_control isa Absent || push!(_openapi_output, "bus_control" => _openapi_value.bus_control)
    _openapi_value.dbd_pnts isa Absent || push!(_openapi_output, "dbd_pnts" => _openapi_value.dbd_pnts)
    _openapi_value.e_lim isa Absent || push!(_openapi_output, "e_lim" => _openapi_value.e_lim)
    _openapi_value.from_branch_control isa Absent || push!(_openapi_output, "from_branch_control" => _openapi_value.from_branch_control)
    _openapi_value.to_branch_control isa Absent || push!(_openapi_output, "to_branch_control" => _openapi_value.to_branch_control)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
