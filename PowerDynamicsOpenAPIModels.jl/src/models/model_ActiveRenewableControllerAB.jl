@doc "    ActiveRenewableControllerAB\n\nParameters of Active Power Controller including REPCA1 and REECB1.\n\n- `d_dn`: Droop for over-frequency conditions.\n- `d_up`: Droop for under-frequency conditions.\n- `freq_flag`: Frequency Flag for REPCA1: `false`: disable, `true`: enable.\n- `k_ig`: Active power PI control integral gain.\n- `k_pg`: Active power PI control proportional gain.\n- `p_lim`: Upper/Lower limit on power reference `(P_min, P_max)`.\n- `p_lim_inner`: Upper/Lower limit on power reference for REECB `(P_min_inner, P_max_inner)`.\n- `p_ref`: Reference Power Set-point.\n- `t_g`: Power Controller lag time constant. Units: s.\n- `t_p`: Real power measurement filter time constant. Units: s.\n- `t_pord`: Power filter time constant REECB time constant. Units: s.\n- `branch_id_control`: Branch circuit id for line drop compensation. If 0 generator power will be used. in psy this is a string representing the branch name\n- `bus_control`: ACBus identification number for voltage control. `0` identifies the local bus connected to this component.\n- `dp_lim`: Upper/Lower limit on power reference ramp rates `(dP_min, dP_max)`.\n- `fdbd_pnts`: Frequency error dead band thresholds `(fdbd1, fdbd2)`.\n- `fe_lim`: Upper/Lower limit on frequency error `(fe_min, fe_max)`.\n- `from_branch_control`: Monitored branch FROM bus number for line drop compensation (if 0 generator power will be used).\n- `to_branch_control`: Monitored branch TO bus number for line drop compensation (if 0 generator power will be used)."
Base.@kwdef struct ActiveRenewableControllerAB
    d_dn::Float64
    d_up::Float64
    freq_flag::Bool
    k_ig::Float64
    k_pg::Float64
    p_lim::ActiveRenewableControllerABPLim
    p_lim_inner::ActiveRenewableControllerABPLimInner
    p_ref::Union{Absent,Float64,Nothing} = ABSENT
    t_g::Float64
    t_p::Float64
    t_pord::Union{Absent,Float64,Nothing} = ABSENT
    branch_id_control::Int64
    bus_control::Int64
    dp_lim::ActiveRenewableControllerABDPLim
    fdbd_pnts::ActiveRenewableControllerABFdbdPnts
    fe_lim::ActiveRenewableControllerABFeLim
    from_branch_control::Int64
    to_branch_control::Int64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{ActiveRenewableControllerAB}, value) = _decode(ActiveRenewableControllerAB, value, true)
function _decode(::Type{ActiveRenewableControllerAB}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-832ddeca7e6e67b0c295.json", pointer = "/components/schemas/ActiveRenewableControllerAB"), _openapi_raw, "decoding ActiveRenewableControllerAB"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "ActiveRenewableControllerAB")
    _openapi_field_d_dn = _decode(Float64, _required(_openapi_object, "D_dn", "ActiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_d_up = _decode(Float64, _required(_openapi_object, "D_up", "ActiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_freq_flag = _decode(Bool, _required(_openapi_object, "Freq_Flag", "ActiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_k_ig = _decode(Float64, _required(_openapi_object, "K_ig", "ActiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_k_pg = _decode(Float64, _required(_openapi_object, "K_pg", "ActiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_p_lim = _decode(ActiveRenewableControllerABPLim, _required(_openapi_object, "P_lim", "ActiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_p_lim_inner = _decode(ActiveRenewableControllerABPLimInner, _required(_openapi_object, "P_lim_inner", "ActiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_p_ref = haskey(_openapi_object, "P_ref") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["P_ref"], _openapi_validate) : ABSENT
    _openapi_field_t_g = _decode(Float64, _required(_openapi_object, "T_g", "ActiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_t_p = _decode(Float64, _required(_openapi_object, "T_p", "ActiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_t_pord = haskey(_openapi_object, "T_pord") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["T_pord"], _openapi_validate) : ABSENT
    _openapi_field_branch_id_control = _decode(Int64, _required(_openapi_object, "branch_id_control", "ActiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_bus_control = _decode(Int64, _required(_openapi_object, "bus_control", "ActiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_dp_lim = _decode(ActiveRenewableControllerABDPLim, _required(_openapi_object, "dP_lim", "ActiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_fdbd_pnts = _decode(ActiveRenewableControllerABFdbdPnts, _required(_openapi_object, "fdbd_pnts", "ActiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_fe_lim = _decode(ActiveRenewableControllerABFeLim, _required(_openapi_object, "fe_lim", "ActiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_from_branch_control = _decode(Int64, _required(_openapi_object, "from_branch_control", "ActiveRenewableControllerAB"), _openapi_validate)
    _openapi_field_to_branch_control = _decode(Int64, _required(_openapi_object, "to_branch_control", "ActiveRenewableControllerAB"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("D_dn","D_up","Freq_Flag","K_ig","K_pg","P_lim","P_lim_inner","P_ref","T_g","T_p","T_pord","branch_id_control","bus_control","dP_lim","fdbd_pnts","fe_lim","from_branch_control","to_branch_control") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return ActiveRenewableControllerAB(; d_dn = _openapi_field_d_dn, d_up = _openapi_field_d_up, freq_flag = _openapi_field_freq_flag, k_ig = _openapi_field_k_ig, k_pg = _openapi_field_k_pg, p_lim = _openapi_field_p_lim, p_lim_inner = _openapi_field_p_lim_inner, p_ref = _openapi_field_p_ref, t_g = _openapi_field_t_g, t_p = _openapi_field_t_p, t_pord = _openapi_field_t_pord, branch_id_control = _openapi_field_branch_id_control, bus_control = _openapi_field_bus_control, dp_lim = _openapi_field_dp_lim, fdbd_pnts = _openapi_field_fdbd_pnts, fe_lim = _openapi_field_fe_lim, from_branch_control = _openapi_field_from_branch_control, to_branch_control = _openapi_field_to_branch_control, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::ActiveRenewableControllerAB)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.d_dn isa Absent || (_openapi_output["D_dn"] = _encode(_openapi_value.d_dn))
    _openapi_value.d_up isa Absent || (_openapi_output["D_up"] = _encode(_openapi_value.d_up))
    _openapi_value.freq_flag isa Absent || (_openapi_output["Freq_Flag"] = _encode(_openapi_value.freq_flag))
    _openapi_value.k_ig isa Absent || (_openapi_output["K_ig"] = _encode(_openapi_value.k_ig))
    _openapi_value.k_pg isa Absent || (_openapi_output["K_pg"] = _encode(_openapi_value.k_pg))
    _openapi_value.p_lim isa Absent || (_openapi_output["P_lim"] = _encode(_openapi_value.p_lim))
    _openapi_value.p_lim_inner isa Absent || (_openapi_output["P_lim_inner"] = _encode(_openapi_value.p_lim_inner))
    _openapi_value.p_ref isa Absent || (_openapi_output["P_ref"] = _encode(_openapi_value.p_ref))
    _openapi_value.t_g isa Absent || (_openapi_output["T_g"] = _encode(_openapi_value.t_g))
    _openapi_value.t_p isa Absent || (_openapi_output["T_p"] = _encode(_openapi_value.t_p))
    _openapi_value.t_pord isa Absent || (_openapi_output["T_pord"] = _encode(_openapi_value.t_pord))
    _openapi_value.branch_id_control isa Absent || (_openapi_output["branch_id_control"] = _encode(_openapi_value.branch_id_control))
    _openapi_value.bus_control isa Absent || (_openapi_output["bus_control"] = _encode(_openapi_value.bus_control))
    _openapi_value.dp_lim isa Absent || (_openapi_output["dP_lim"] = _encode(_openapi_value.dp_lim))
    _openapi_value.fdbd_pnts isa Absent || (_openapi_output["fdbd_pnts"] = _encode(_openapi_value.fdbd_pnts))
    _openapi_value.fe_lim isa Absent || (_openapi_output["fe_lim"] = _encode(_openapi_value.fe_lim))
    _openapi_value.from_branch_control isa Absent || (_openapi_output["from_branch_control"] = _encode(_openapi_value.from_branch_control))
    _openapi_value.to_branch_control isa Absent || (_openapi_output["to_branch_control"] = _encode(_openapi_value.to_branch_control))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-832ddeca7e6e67b0c295.json", pointer = "/components/schemas/ActiveRenewableControllerAB"), _openapi_output, "encoding ActiveRenewableControllerAB"; direction = :neutral)
end

function _form_fields(_openapi_value::ActiveRenewableControllerAB)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.d_dn isa Absent || push!(_openapi_output, "D_dn" => _openapi_value.d_dn)
    _openapi_value.d_up isa Absent || push!(_openapi_output, "D_up" => _openapi_value.d_up)
    _openapi_value.freq_flag isa Absent || push!(_openapi_output, "Freq_Flag" => _openapi_value.freq_flag)
    _openapi_value.k_ig isa Absent || push!(_openapi_output, "K_ig" => _openapi_value.k_ig)
    _openapi_value.k_pg isa Absent || push!(_openapi_output, "K_pg" => _openapi_value.k_pg)
    _openapi_value.p_lim isa Absent || push!(_openapi_output, "P_lim" => _openapi_value.p_lim)
    _openapi_value.p_lim_inner isa Absent || push!(_openapi_output, "P_lim_inner" => _openapi_value.p_lim_inner)
    _openapi_value.p_ref isa Absent || push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    _openapi_value.t_g isa Absent || push!(_openapi_output, "T_g" => _openapi_value.t_g)
    _openapi_value.t_p isa Absent || push!(_openapi_output, "T_p" => _openapi_value.t_p)
    _openapi_value.t_pord isa Absent || push!(_openapi_output, "T_pord" => _openapi_value.t_pord)
    _openapi_value.branch_id_control isa Absent || push!(_openapi_output, "branch_id_control" => _openapi_value.branch_id_control)
    _openapi_value.bus_control isa Absent || push!(_openapi_output, "bus_control" => _openapi_value.bus_control)
    _openapi_value.dp_lim isa Absent || push!(_openapi_output, "dP_lim" => _openapi_value.dp_lim)
    _openapi_value.fdbd_pnts isa Absent || push!(_openapi_output, "fdbd_pnts" => _openapi_value.fdbd_pnts)
    _openapi_value.fe_lim isa Absent || push!(_openapi_output, "fe_lim" => _openapi_value.fe_lim)
    _openapi_value.from_branch_control isa Absent || push!(_openapi_output, "from_branch_control" => _openapi_value.from_branch_control)
    _openapi_value.to_branch_control isa Absent || push!(_openapi_output, "to_branch_control" => _openapi_value.to_branch_control)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
