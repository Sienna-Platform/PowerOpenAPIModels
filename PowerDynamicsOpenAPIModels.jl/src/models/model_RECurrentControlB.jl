@doc "    RECurrentControlB\n\nParameters of the Inner Control part of the REECB model in PSS/E.\n\n- `i_max`: Maximum limit on total converter current.\n- `iqinj_lim`: Limits for Iqinj `(I_qh1, I_ql1)`.\n- `k_qv`: Reactive current injection gain during over and undervoltage conditions.\n- `k_vi`: Voltage regulator integral gain (used when QFlag = 1).\n- `k_vp`: Voltage regulator proportional gain (used when QFlag = 1).\n- `pq_flag`: PQ Flag used for the Current Limit Logic.\n- `q_flag`: Q Flag used for I_qinj.\n- `t_iq`: Time constant for low-pass filter for state q_V when QFlag = 0. Units: s.\n- `t_rv`: Voltage Filter Time Constant. Units: s.\n- `v_ref0`: User defined reference. If 0, `PowerSimulationsDynamics.jl` initializes to initial terminal voltage.\n- `vdip_lim`: Limits for Voltage Dip Logic `(Vdip, Vup)`.\n- `dbd_pnts`: Voltage error deadband thresholds `(dbd1, dbd2)`."
Base.@kwdef struct RECurrentControlB
    i_max::Float64
    iqinj_lim::RECurrentControlBIqinjLim
    k_qv::Float64
    k_vi::Float64
    k_vp::Float64
    pq_flag::Bool
    q_flag::Bool
    t_iq::Float64
    t_rv::Float64
    v_ref0::Float64
    vdip_lim::RECurrentControlBVdipLim
    dbd_pnts::RECurrentControlBDbdPnts
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{RECurrentControlB}, value) = _decode(RECurrentControlB, value, true)
function _decode(::Type{RECurrentControlB}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-832ddeca7e6e67b0c295.json", pointer = "/components/schemas/RECurrentControlB"), _openapi_raw, "decoding RECurrentControlB"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "RECurrentControlB")
    _openapi_field_i_max = _decode(Float64, _required(_openapi_object, "I_max", "RECurrentControlB"), _openapi_validate)
    _openapi_field_iqinj_lim = _decode(RECurrentControlBIqinjLim, _required(_openapi_object, "Iqinj_lim", "RECurrentControlB"), _openapi_validate)
    _openapi_field_k_qv = _decode(Float64, _required(_openapi_object, "K_qv", "RECurrentControlB"), _openapi_validate)
    _openapi_field_k_vi = _decode(Float64, _required(_openapi_object, "K_vi", "RECurrentControlB"), _openapi_validate)
    _openapi_field_k_vp = _decode(Float64, _required(_openapi_object, "K_vp", "RECurrentControlB"), _openapi_validate)
    _openapi_field_pq_flag = _decode(Bool, _required(_openapi_object, "PQ_Flag", "RECurrentControlB"), _openapi_validate)
    _openapi_field_q_flag = _decode(Bool, _required(_openapi_object, "Q_Flag", "RECurrentControlB"), _openapi_validate)
    _openapi_field_t_iq = _decode(Float64, _required(_openapi_object, "T_iq", "RECurrentControlB"), _openapi_validate)
    _openapi_field_t_rv = _decode(Float64, _required(_openapi_object, "T_rv", "RECurrentControlB"), _openapi_validate)
    _openapi_field_v_ref0 = _decode(Float64, _required(_openapi_object, "V_ref0", "RECurrentControlB"), _openapi_validate)
    _openapi_field_vdip_lim = _decode(RECurrentControlBVdipLim, _required(_openapi_object, "Vdip_lim", "RECurrentControlB"), _openapi_validate)
    _openapi_field_dbd_pnts = _decode(RECurrentControlBDbdPnts, _required(_openapi_object, "dbd_pnts", "RECurrentControlB"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("I_max","Iqinj_lim","K_qv","K_vi","K_vp","PQ_Flag","Q_Flag","T_iq","T_rv","V_ref0","Vdip_lim","dbd_pnts") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return RECurrentControlB(; i_max = _openapi_field_i_max, iqinj_lim = _openapi_field_iqinj_lim, k_qv = _openapi_field_k_qv, k_vi = _openapi_field_k_vi, k_vp = _openapi_field_k_vp, pq_flag = _openapi_field_pq_flag, q_flag = _openapi_field_q_flag, t_iq = _openapi_field_t_iq, t_rv = _openapi_field_t_rv, v_ref0 = _openapi_field_v_ref0, vdip_lim = _openapi_field_vdip_lim, dbd_pnts = _openapi_field_dbd_pnts, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::RECurrentControlB)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.i_max isa Absent || (_openapi_output["I_max"] = _encode(_openapi_value.i_max))
    _openapi_value.iqinj_lim isa Absent || (_openapi_output["Iqinj_lim"] = _encode(_openapi_value.iqinj_lim))
    _openapi_value.k_qv isa Absent || (_openapi_output["K_qv"] = _encode(_openapi_value.k_qv))
    _openapi_value.k_vi isa Absent || (_openapi_output["K_vi"] = _encode(_openapi_value.k_vi))
    _openapi_value.k_vp isa Absent || (_openapi_output["K_vp"] = _encode(_openapi_value.k_vp))
    _openapi_value.pq_flag isa Absent || (_openapi_output["PQ_Flag"] = _encode(_openapi_value.pq_flag))
    _openapi_value.q_flag isa Absent || (_openapi_output["Q_Flag"] = _encode(_openapi_value.q_flag))
    _openapi_value.t_iq isa Absent || (_openapi_output["T_iq"] = _encode(_openapi_value.t_iq))
    _openapi_value.t_rv isa Absent || (_openapi_output["T_rv"] = _encode(_openapi_value.t_rv))
    _openapi_value.v_ref0 isa Absent || (_openapi_output["V_ref0"] = _encode(_openapi_value.v_ref0))
    _openapi_value.vdip_lim isa Absent || (_openapi_output["Vdip_lim"] = _encode(_openapi_value.vdip_lim))
    _openapi_value.dbd_pnts isa Absent || (_openapi_output["dbd_pnts"] = _encode(_openapi_value.dbd_pnts))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-832ddeca7e6e67b0c295.json", pointer = "/components/schemas/RECurrentControlB"), _openapi_output, "encoding RECurrentControlB"; direction = :neutral)
end

function _form_fields(_openapi_value::RECurrentControlB)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.i_max isa Absent || push!(_openapi_output, "I_max" => _openapi_value.i_max)
    _openapi_value.iqinj_lim isa Absent || push!(_openapi_output, "Iqinj_lim" => _openapi_value.iqinj_lim)
    _openapi_value.k_qv isa Absent || push!(_openapi_output, "K_qv" => _openapi_value.k_qv)
    _openapi_value.k_vi isa Absent || push!(_openapi_output, "K_vi" => _openapi_value.k_vi)
    _openapi_value.k_vp isa Absent || push!(_openapi_output, "K_vp" => _openapi_value.k_vp)
    _openapi_value.pq_flag isa Absent || push!(_openapi_output, "PQ_Flag" => _openapi_value.pq_flag)
    _openapi_value.q_flag isa Absent || push!(_openapi_output, "Q_Flag" => _openapi_value.q_flag)
    _openapi_value.t_iq isa Absent || push!(_openapi_output, "T_iq" => _openapi_value.t_iq)
    _openapi_value.t_rv isa Absent || push!(_openapi_output, "T_rv" => _openapi_value.t_rv)
    _openapi_value.v_ref0 isa Absent || push!(_openapi_output, "V_ref0" => _openapi_value.v_ref0)
    _openapi_value.vdip_lim isa Absent || push!(_openapi_output, "Vdip_lim" => _openapi_value.vdip_lim)
    _openapi_value.dbd_pnts isa Absent || push!(_openapi_output, "dbd_pnts" => _openapi_value.dbd_pnts)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
