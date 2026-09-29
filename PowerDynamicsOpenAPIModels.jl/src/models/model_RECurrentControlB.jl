"""
    RECurrentControlB

  - `vdip_lim`: A pair of values bounding a quantity from below (`min`) and from above (`max`).
  - `dbd_pnts`: A pair of deadband thresholds `(dbd1, dbd2)` on a voltage or reactive-power error signal, inside which the controller does not act.
  - `iqinj_lim`: A pair of values bounding a quantity from below (`min`) and from above (`max`).
"""
Base.@kwdef struct RECurrentControlB <: APIModel
    q_flag::Bool
    pq_flag::Bool
    vdip_lim::MinMax
    t_rv::Float64
    dbd_pnts::DbdPnts
    k_qv::Float64
    iqinj_lim::MinMax
    v_ref0::Float64
    k_vp::Float64
    k_vi::Float64
    t_iq::Float64
    i_max::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{RECurrentControlB}, value) = _decode(RECurrentControlB, value, true)
function _decode(::Type{RECurrentControlB}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-bdd345e8da7563e8db7b.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding RECurrentControlB";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "RECurrentControlB")
    _openapi_field_q_flag =
        _decode(Bool, _required(_openapi_object, "Q_Flag", "RECurrentControlB"), false)
    _openapi_field_pq_flag =
        _decode(Bool, _required(_openapi_object, "PQ_Flag", "RECurrentControlB"), false)
    _openapi_field_vdip_lim =
        _decode(MinMax, _required(_openapi_object, "Vdip_lim", "RECurrentControlB"), false)
    _openapi_field_t_rv =
        _decode(Float64, _required(_openapi_object, "T_rv", "RECurrentControlB"), false)
    _openapi_field_dbd_pnts =
        _decode(DbdPnts, _required(_openapi_object, "dbd_pnts", "RECurrentControlB"), false)
    _openapi_field_k_qv =
        _decode(Float64, _required(_openapi_object, "K_qv", "RECurrentControlB"), false)
    _openapi_field_iqinj_lim =
        _decode(MinMax, _required(_openapi_object, "Iqinj_lim", "RECurrentControlB"), false)
    _openapi_field_v_ref0 =
        _decode(Float64, _required(_openapi_object, "V_ref0", "RECurrentControlB"), false)
    _openapi_field_k_vp =
        _decode(Float64, _required(_openapi_object, "K_vp", "RECurrentControlB"), false)
    _openapi_field_k_vi =
        _decode(Float64, _required(_openapi_object, "K_vi", "RECurrentControlB"), false)
    _openapi_field_t_iq =
        _decode(Float64, _required(_openapi_object, "T_iq", "RECurrentControlB"), false)
    _openapi_field_i_max =
        _decode(Float64, _required(_openapi_object, "I_max", "RECurrentControlB"), false)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "Q_Flag",
            "PQ_Flag",
            "Vdip_lim",
            "T_rv",
            "dbd_pnts",
            "K_qv",
            "Iqinj_lim",
            "V_ref0",
            "K_vp",
            "K_vi",
            "T_iq",
            "I_max",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return RECurrentControlB(;
        q_flag=_openapi_field_q_flag,
        pq_flag=_openapi_field_pq_flag,
        vdip_lim=_openapi_field_vdip_lim,
        t_rv=_openapi_field_t_rv,
        dbd_pnts=_openapi_field_dbd_pnts,
        k_qv=_openapi_field_k_qv,
        iqinj_lim=_openapi_field_iqinj_lim,
        v_ref0=_openapi_field_v_ref0,
        k_vp=_openapi_field_k_vp,
        k_vi=_openapi_field_k_vi,
        t_iq=_openapi_field_t_iq,
        i_max=_openapi_field_i_max,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::RECurrentControlB)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.q_flag isa Absent ||
        (_openapi_output["Q_Flag"] = _encode_unvalidated(_openapi_value.q_flag))
    _openapi_value.pq_flag isa Absent ||
        (_openapi_output["PQ_Flag"] = _encode_unvalidated(_openapi_value.pq_flag))
    _openapi_value.vdip_lim isa Absent ||
        (_openapi_output["Vdip_lim"] = _encode_unvalidated(_openapi_value.vdip_lim))
    _openapi_value.t_rv isa Absent ||
        (_openapi_output["T_rv"] = _encode_unvalidated(_openapi_value.t_rv))
    _openapi_value.dbd_pnts isa Absent ||
        (_openapi_output["dbd_pnts"] = _encode_unvalidated(_openapi_value.dbd_pnts))
    _openapi_value.k_qv isa Absent ||
        (_openapi_output["K_qv"] = _encode_unvalidated(_openapi_value.k_qv))
    _openapi_value.iqinj_lim isa Absent ||
        (_openapi_output["Iqinj_lim"] = _encode_unvalidated(_openapi_value.iqinj_lim))
    _openapi_value.v_ref0 isa Absent ||
        (_openapi_output["V_ref0"] = _encode_unvalidated(_openapi_value.v_ref0))
    _openapi_value.k_vp isa Absent ||
        (_openapi_output["K_vp"] = _encode_unvalidated(_openapi_value.k_vp))
    _openapi_value.k_vi isa Absent ||
        (_openapi_output["K_vi"] = _encode_unvalidated(_openapi_value.k_vi))
    _openapi_value.t_iq isa Absent ||
        (_openapi_output["T_iq"] = _encode_unvalidated(_openapi_value.t_iq))
    _openapi_value.i_max isa Absent ||
        (_openapi_output["I_max"] = _encode_unvalidated(_openapi_value.i_max))
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
_encode(_openapi_value::RECurrentControlB) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-bdd345e8da7563e8db7b.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding RECurrentControlB";
    direction=:neutral,
)

function _form_fields(_openapi_value::RECurrentControlB)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.q_flag isa Absent ||
        push!(_openapi_output, "Q_Flag" => _openapi_value.q_flag)
    _openapi_value.pq_flag isa Absent ||
        push!(_openapi_output, "PQ_Flag" => _openapi_value.pq_flag)
    _openapi_value.vdip_lim isa Absent ||
        push!(_openapi_output, "Vdip_lim" => _openapi_value.vdip_lim)
    _openapi_value.t_rv isa Absent || push!(_openapi_output, "T_rv" => _openapi_value.t_rv)
    _openapi_value.dbd_pnts isa Absent ||
        push!(_openapi_output, "dbd_pnts" => _openapi_value.dbd_pnts)
    _openapi_value.k_qv isa Absent || push!(_openapi_output, "K_qv" => _openapi_value.k_qv)
    _openapi_value.iqinj_lim isa Absent ||
        push!(_openapi_output, "Iqinj_lim" => _openapi_value.iqinj_lim)
    _openapi_value.v_ref0 isa Absent ||
        push!(_openapi_output, "V_ref0" => _openapi_value.v_ref0)
    _openapi_value.k_vp isa Absent || push!(_openapi_output, "K_vp" => _openapi_value.k_vp)
    _openapi_value.k_vi isa Absent || push!(_openapi_output, "K_vi" => _openapi_value.k_vi)
    _openapi_value.t_iq isa Absent || push!(_openapi_output, "T_iq" => _openapi_value.t_iq)
    _openapi_value.i_max isa Absent ||
        push!(_openapi_output, "I_max" => _openapi_value.i_max)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
