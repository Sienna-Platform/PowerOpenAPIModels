"""
    GenericDER

Parameters of a Generic Distributed Energy Resource Model. Based on "Modeling Framework and Coordination of DER and Flexible Loads for Ancillary Service Provision." It has no bus of its own: exactly one static injection device, with the same name, names it in its `dynamic_injector` property, and that device supplies the rest of its data.

  - `id`: Unique integer identifier for this component.
  - `name`: Name of the dynamic injection. Must equal the name of the static injection device that names it in `dynamic_injector`.
  - `qref_flag`: Reactive Power Control Mode. 1 VoltVar Control, 2 Constant Q Control, 3 Constant PF Control
  - `pq_flag`: Active and reactive power priority mode. 0 for Q priority, 1 for P priority
  - `gen_flag`: Define generator or storage system. 0 unit is a storage device, 1 unit is a generator
  - `perop_flag`: Defines operation of permisible region in VRT characteristic. 0 for cease, 1 for continuous operation
  - `recon_flag`: Defines if DER can reconnect after voltage ride-through disconnection
  - `trv`: Voltage measurement transducer's time constant, in s. Units: s.
  - `vv_pnts`: Y-axis Volt-var curve points (V1,V2,V3,V4)
  - `q_lim`: Reactive power limits in pu (Q_min, Q_max)
  - `tp`: Power measurement transducer's time constant, in s. Units: s.
  - `e_lim`: Error limit in PI controller for q control (e_min, e_max)
  - `kpq`: PI controller proportional gain for q control
  - `kiq`: PI controller integral gain for q control
  - `iqr_lim`: Limit on rate of change for reactive current (pu/s) (Iqr_min, Iqr_max)
  - `i_max`: Max. inverter's current
  - `tg`: Current control's time constant, in s. Units: s.
  - `kwh_cap`: BESS capacity in kWh
  - `soc_ini`: Initial state of charge (SOC) in pu
  - `soc_lim`: Battery's SOC limits (SOC_min, SOC_max)
  - `trf`: Time constant to estimate system frequency, in s. Units: s.
  - `fdbd_pnts`: Frequency error dead band thresholds `(fdbd1, fdbd2)`
  - `d_dn`: reciprocal of droop for over-frequency conditions, in pu
  - `d_up`: reciprocal of droop for under-frequency conditions, in pu
  - `fe_lim`: Frequency error limits in pu (fe_min, fe_max)
  - `kpp`: PI controller proportional gain for p control
  - `kip`: PI controller integral gain for p control
  - `p_lim`: Active power limits in pu (P_min, P_max)
  - `dp_lim`: Ramp rate limits for active power in pu/s (dP_min, dP_max)
  - `t_pord`: Power filter time constant in s. Units: s.
  - `rrpwr`: Ramp rate for real power increase following a fault, in pu/s
  - `vrt_pnts`: Voltage ride through v points (vrt1,vrt2,vrt3,vrt4,vrt5)
  - `tvrt_pnts`: Voltage ride through time points (tvrt1,tvrt2,tvrt3)
  - `tv_delay`: Time delay for reconnection after voltage ride-through disconnection. Units: s.
  - `ves_lim`: Min and max voltage for entering service (VES_min,VES_max)
  - `frt_pnts`: Frequency ride through v points (frt1,frt2,frt3,frt4)
  - `tfrt_pnts`: Frequency ride through time points (tfrt1,tfrt2)
  - `tf_delay`: Time delay for reconnection after frequency ride-through disconnection. Units: s.
  - `fes_lim`: Min and max frequency for entering service (FES_min,FES_max)
  - `pfa_ref`: Reference power factor
  - `q_ref`: Reference reactive power, in pu. Units: pu.
  - `p_ref`: Reference active power, in pu. Units: pu.
  - `base_power`: Base power for the per-unit parameters of this model. Usually equal to the `base_power` of the static injection device that names this model. Units: MVA.
"""
Base.@kwdef struct GenericDER <: APIModel
    id::Int64
    name::String
    qref_flag::Int64
    pq_flag::Bool
    gen_flag::Bool
    perop_flag::Bool
    recon_flag::Bool
    trv::Float64
    vv_pnts::VoltVarPnts
    q_lim::MinMax
    tp::Float64
    e_lim::MinMax
    kpq::Float64
    kiq::Float64
    iqr_lim::MinMax
    i_max::Float64
    tg::Float64
    kwh_cap::Float64
    soc_ini::Float64
    soc_lim::MinMax
    trf::Float64
    fdbd_pnts::FdbdPnts
    d_dn::Float64
    d_up::Float64
    fe_lim::MinMax
    kpp::Float64
    kip::Float64
    p_lim::MinMax
    dp_lim::MinMax
    t_pord::Float64
    rrpwr::Float64
    vrt_pnts::VoltageRideThroughPnts
    tvrt_pnts::VoltageRideThroughTimePnts
    tv_delay::Float64
    ves_lim::MinMax
    frt_pnts::FrequencyRideThroughPnts
    tfrt_pnts::FrequencyRideThroughTimePnts
    tf_delay::Float64
    fes_lim::MinMax
    pfa_ref::Union{Absent, Float64, Nothing} = ABSENT
    q_ref::Union{Absent, Float64, Nothing} = ABSENT
    p_ref::Union{Absent, Float64, Nothing} = ABSENT
    base_power::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{GenericDER}, value) = _decode(GenericDER, value, true)
function _decode(::Type{GenericDER}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-1c4b7abd3c66ae6d8393.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding GenericDER";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "GenericDER")
    _openapi_field_id =
        _decode_zoned(Int64, _required(_openapi_object, "id", "GenericDER"), false)
    _openapi_field_name =
        _decode_zoned(String, _required(_openapi_object, "name", "GenericDER"), false)
    _openapi_field_qref_flag =
        _decode_zoned(Int64, _required(_openapi_object, "Qref_Flag", "GenericDER"), false)
    _openapi_field_pq_flag =
        _decode_zoned(Bool, _required(_openapi_object, "PQ_Flag", "GenericDER"), false)
    _openapi_field_gen_flag =
        _decode_zoned(Bool, _required(_openapi_object, "Gen_Flag", "GenericDER"), false)
    _openapi_field_perop_flag =
        _decode_zoned(Bool, _required(_openapi_object, "PerOp_Flag", "GenericDER"), false)
    _openapi_field_recon_flag =
        _decode_zoned(Bool, _required(_openapi_object, "Recon_Flag", "GenericDER"), false)
    _openapi_field_trv =
        _decode_zoned(Float64, _required(_openapi_object, "Trv", "GenericDER"), false)
    _openapi_field_vv_pnts = _decode_zoned(
        VoltVarPnts,
        _required(_openapi_object, "VV_pnts", "GenericDER"),
        false,
    )
    _openapi_field_q_lim =
        _decode_zoned(MinMax, _required(_openapi_object, "Q_lim", "GenericDER"), false)
    _openapi_field_tp =
        _decode_zoned(Float64, _required(_openapi_object, "Tp", "GenericDER"), false)
    _openapi_field_e_lim =
        _decode_zoned(MinMax, _required(_openapi_object, "e_lim", "GenericDER"), false)
    _openapi_field_kpq =
        _decode_zoned(Float64, _required(_openapi_object, "Kpq", "GenericDER"), false)
    _openapi_field_kiq =
        _decode_zoned(Float64, _required(_openapi_object, "Kiq", "GenericDER"), false)
    _openapi_field_iqr_lim =
        _decode_zoned(MinMax, _required(_openapi_object, "Iqr_lim", "GenericDER"), false)
    _openapi_field_i_max =
        _decode_zoned(Float64, _required(_openapi_object, "I_max", "GenericDER"), false)
    _openapi_field_tg =
        _decode_zoned(Float64, _required(_openapi_object, "Tg", "GenericDER"), false)
    _openapi_field_kwh_cap =
        _decode_zoned(Float64, _required(_openapi_object, "kWh_Cap", "GenericDER"), false)
    _openapi_field_soc_ini =
        _decode_zoned(Float64, _required(_openapi_object, "SOC_ini", "GenericDER"), false)
    _openapi_field_soc_lim =
        _decode_zoned(MinMax, _required(_openapi_object, "SOC_lim", "GenericDER"), false)
    _openapi_field_trf =
        _decode_zoned(Float64, _required(_openapi_object, "Trf", "GenericDER"), false)
    _openapi_field_fdbd_pnts = _decode_zoned(
        FdbdPnts,
        _required(_openapi_object, "fdbd_pnts", "GenericDER"),
        false,
    )
    _openapi_field_d_dn =
        _decode_zoned(Float64, _required(_openapi_object, "D_dn", "GenericDER"), false)
    _openapi_field_d_up =
        _decode_zoned(Float64, _required(_openapi_object, "D_up", "GenericDER"), false)
    _openapi_field_fe_lim =
        _decode_zoned(MinMax, _required(_openapi_object, "fe_lim", "GenericDER"), false)
    _openapi_field_kpp =
        _decode_zoned(Float64, _required(_openapi_object, "Kpp", "GenericDER"), false)
    _openapi_field_kip =
        _decode_zoned(Float64, _required(_openapi_object, "Kip", "GenericDER"), false)
    _openapi_field_p_lim =
        _decode_zoned(MinMax, _required(_openapi_object, "P_lim", "GenericDER"), false)
    _openapi_field_dp_lim =
        _decode_zoned(MinMax, _required(_openapi_object, "dP_lim", "GenericDER"), false)
    _openapi_field_t_pord =
        _decode_zoned(Float64, _required(_openapi_object, "T_pord", "GenericDER"), false)
    _openapi_field_rrpwr =
        _decode_zoned(Float64, _required(_openapi_object, "rrpwr", "GenericDER"), false)
    _openapi_field_vrt_pnts = _decode_zoned(
        VoltageRideThroughPnts,
        _required(_openapi_object, "VRT_pnts", "GenericDER"),
        false,
    )
    _openapi_field_tvrt_pnts = _decode_zoned(
        VoltageRideThroughTimePnts,
        _required(_openapi_object, "TVRT_pnts", "GenericDER"),
        false,
    )
    _openapi_field_tv_delay =
        _decode_zoned(Float64, _required(_openapi_object, "tV_delay", "GenericDER"), false)
    _openapi_field_ves_lim =
        _decode_zoned(MinMax, _required(_openapi_object, "VES_lim", "GenericDER"), false)
    _openapi_field_frt_pnts = _decode_zoned(
        FrequencyRideThroughPnts,
        _required(_openapi_object, "FRT_pnts", "GenericDER"),
        false,
    )
    _openapi_field_tfrt_pnts = _decode_zoned(
        FrequencyRideThroughTimePnts,
        _required(_openapi_object, "TFRT_pnts", "GenericDER"),
        false,
    )
    _openapi_field_tf_delay =
        _decode_zoned(Float64, _required(_openapi_object, "tF_delay", "GenericDER"), false)
    _openapi_field_fes_lim =
        _decode_zoned(MinMax, _required(_openapi_object, "FES_lim", "GenericDER"), false)
    _openapi_field_pfa_ref =
        haskey(_openapi_object, "Pfa_ref") ?
        _decode_zoned(Union{Absent, Float64, Nothing}, _openapi_object["Pfa_ref"], false) :
        ABSENT
    _openapi_field_q_ref =
        haskey(_openapi_object, "Q_ref") ?
        _decode_zoned(Union{Absent, Float64, Nothing}, _openapi_object["Q_ref"], false) :
        ABSENT
    _openapi_field_p_ref =
        haskey(_openapi_object, "P_ref") ?
        _decode_zoned(Union{Absent, Float64, Nothing}, _openapi_object["P_ref"], false) :
        ABSENT
    _openapi_field_base_power = _decode_zoned(
        Float64,
        _required(_openapi_object, "base_power", "GenericDER"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "Qref_Flag",
            "PQ_Flag",
            "Gen_Flag",
            "PerOp_Flag",
            "Recon_Flag",
            "Trv",
            "VV_pnts",
            "Q_lim",
            "Tp",
            "e_lim",
            "Kpq",
            "Kiq",
            "Iqr_lim",
            "I_max",
            "Tg",
            "kWh_Cap",
            "SOC_ini",
            "SOC_lim",
            "Trf",
            "fdbd_pnts",
            "D_dn",
            "D_up",
            "fe_lim",
            "Kpp",
            "Kip",
            "P_lim",
            "dP_lim",
            "T_pord",
            "rrpwr",
            "VRT_pnts",
            "TVRT_pnts",
            "tV_delay",
            "VES_lim",
            "FRT_pnts",
            "TFRT_pnts",
            "tF_delay",
            "FES_lim",
            "Pfa_ref",
            "Q_ref",
            "P_ref",
            "base_power",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return GenericDER(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        qref_flag=_openapi_field_qref_flag,
        pq_flag=_openapi_field_pq_flag,
        gen_flag=_openapi_field_gen_flag,
        perop_flag=_openapi_field_perop_flag,
        recon_flag=_openapi_field_recon_flag,
        trv=_openapi_field_trv,
        vv_pnts=_openapi_field_vv_pnts,
        q_lim=_openapi_field_q_lim,
        tp=_openapi_field_tp,
        e_lim=_openapi_field_e_lim,
        kpq=_openapi_field_kpq,
        kiq=_openapi_field_kiq,
        iqr_lim=_openapi_field_iqr_lim,
        i_max=_openapi_field_i_max,
        tg=_openapi_field_tg,
        kwh_cap=_openapi_field_kwh_cap,
        soc_ini=_openapi_field_soc_ini,
        soc_lim=_openapi_field_soc_lim,
        trf=_openapi_field_trf,
        fdbd_pnts=_openapi_field_fdbd_pnts,
        d_dn=_openapi_field_d_dn,
        d_up=_openapi_field_d_up,
        fe_lim=_openapi_field_fe_lim,
        kpp=_openapi_field_kpp,
        kip=_openapi_field_kip,
        p_lim=_openapi_field_p_lim,
        dp_lim=_openapi_field_dp_lim,
        t_pord=_openapi_field_t_pord,
        rrpwr=_openapi_field_rrpwr,
        vrt_pnts=_openapi_field_vrt_pnts,
        tvrt_pnts=_openapi_field_tvrt_pnts,
        tv_delay=_openapi_field_tv_delay,
        ves_lim=_openapi_field_ves_lim,
        frt_pnts=_openapi_field_frt_pnts,
        tfrt_pnts=_openapi_field_tfrt_pnts,
        tf_delay=_openapi_field_tf_delay,
        fes_lim=_openapi_field_fes_lim,
        pfa_ref=_openapi_field_pfa_ref,
        q_ref=_openapi_field_q_ref,
        p_ref=_openapi_field_p_ref,
        base_power=_openapi_field_base_power,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::GenericDER)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode_unvalidated(_openapi_value.name))
    _openapi_value.qref_flag isa Absent ||
        (_openapi_output["Qref_Flag"] = _encode_unvalidated(_openapi_value.qref_flag))
    _openapi_value.pq_flag isa Absent ||
        (_openapi_output["PQ_Flag"] = _encode_unvalidated(_openapi_value.pq_flag))
    _openapi_value.gen_flag isa Absent ||
        (_openapi_output["Gen_Flag"] = _encode_unvalidated(_openapi_value.gen_flag))
    _openapi_value.perop_flag isa Absent ||
        (_openapi_output["PerOp_Flag"] = _encode_unvalidated(_openapi_value.perop_flag))
    _openapi_value.recon_flag isa Absent ||
        (_openapi_output["Recon_Flag"] = _encode_unvalidated(_openapi_value.recon_flag))
    _openapi_value.trv isa Absent ||
        (_openapi_output["Trv"] = _encode_unvalidated(_openapi_value.trv))
    _openapi_value.vv_pnts isa Absent ||
        (_openapi_output["VV_pnts"] = _encode_unvalidated(_openapi_value.vv_pnts))
    _openapi_value.q_lim isa Absent ||
        (_openapi_output["Q_lim"] = _encode_unvalidated(_openapi_value.q_lim))
    _openapi_value.tp isa Absent ||
        (_openapi_output["Tp"] = _encode_unvalidated(_openapi_value.tp))
    _openapi_value.e_lim isa Absent ||
        (_openapi_output["e_lim"] = _encode_unvalidated(_openapi_value.e_lim))
    _openapi_value.kpq isa Absent ||
        (_openapi_output["Kpq"] = _encode_unvalidated(_openapi_value.kpq))
    _openapi_value.kiq isa Absent ||
        (_openapi_output["Kiq"] = _encode_unvalidated(_openapi_value.kiq))
    _openapi_value.iqr_lim isa Absent ||
        (_openapi_output["Iqr_lim"] = _encode_unvalidated(_openapi_value.iqr_lim))
    _openapi_value.i_max isa Absent ||
        (_openapi_output["I_max"] = _encode_unvalidated(_openapi_value.i_max))
    _openapi_value.tg isa Absent ||
        (_openapi_output["Tg"] = _encode_unvalidated(_openapi_value.tg))
    _openapi_value.kwh_cap isa Absent ||
        (_openapi_output["kWh_Cap"] = _encode_unvalidated(_openapi_value.kwh_cap))
    _openapi_value.soc_ini isa Absent ||
        (_openapi_output["SOC_ini"] = _encode_unvalidated(_openapi_value.soc_ini))
    _openapi_value.soc_lim isa Absent ||
        (_openapi_output["SOC_lim"] = _encode_unvalidated(_openapi_value.soc_lim))
    _openapi_value.trf isa Absent ||
        (_openapi_output["Trf"] = _encode_unvalidated(_openapi_value.trf))
    _openapi_value.fdbd_pnts isa Absent ||
        (_openapi_output["fdbd_pnts"] = _encode_unvalidated(_openapi_value.fdbd_pnts))
    _openapi_value.d_dn isa Absent ||
        (_openapi_output["D_dn"] = _encode_unvalidated(_openapi_value.d_dn))
    _openapi_value.d_up isa Absent ||
        (_openapi_output["D_up"] = _encode_unvalidated(_openapi_value.d_up))
    _openapi_value.fe_lim isa Absent ||
        (_openapi_output["fe_lim"] = _encode_unvalidated(_openapi_value.fe_lim))
    _openapi_value.kpp isa Absent ||
        (_openapi_output["Kpp"] = _encode_unvalidated(_openapi_value.kpp))
    _openapi_value.kip isa Absent ||
        (_openapi_output["Kip"] = _encode_unvalidated(_openapi_value.kip))
    _openapi_value.p_lim isa Absent ||
        (_openapi_output["P_lim"] = _encode_unvalidated(_openapi_value.p_lim))
    _openapi_value.dp_lim isa Absent ||
        (_openapi_output["dP_lim"] = _encode_unvalidated(_openapi_value.dp_lim))
    _openapi_value.t_pord isa Absent ||
        (_openapi_output["T_pord"] = _encode_unvalidated(_openapi_value.t_pord))
    _openapi_value.rrpwr isa Absent ||
        (_openapi_output["rrpwr"] = _encode_unvalidated(_openapi_value.rrpwr))
    _openapi_value.vrt_pnts isa Absent ||
        (_openapi_output["VRT_pnts"] = _encode_unvalidated(_openapi_value.vrt_pnts))
    _openapi_value.tvrt_pnts isa Absent ||
        (_openapi_output["TVRT_pnts"] = _encode_unvalidated(_openapi_value.tvrt_pnts))
    _openapi_value.tv_delay isa Absent ||
        (_openapi_output["tV_delay"] = _encode_unvalidated(_openapi_value.tv_delay))
    _openapi_value.ves_lim isa Absent ||
        (_openapi_output["VES_lim"] = _encode_unvalidated(_openapi_value.ves_lim))
    _openapi_value.frt_pnts isa Absent ||
        (_openapi_output["FRT_pnts"] = _encode_unvalidated(_openapi_value.frt_pnts))
    _openapi_value.tfrt_pnts isa Absent ||
        (_openapi_output["TFRT_pnts"] = _encode_unvalidated(_openapi_value.tfrt_pnts))
    _openapi_value.tf_delay isa Absent ||
        (_openapi_output["tF_delay"] = _encode_unvalidated(_openapi_value.tf_delay))
    _openapi_value.fes_lim isa Absent ||
        (_openapi_output["FES_lim"] = _encode_unvalidated(_openapi_value.fes_lim))
    _openapi_value.pfa_ref isa Absent ||
        (_openapi_output["Pfa_ref"] = _encode_unvalidated(_openapi_value.pfa_ref))
    _openapi_value.q_ref isa Absent ||
        (_openapi_output["Q_ref"] = _encode_unvalidated(_openapi_value.q_ref))
    _openapi_value.p_ref isa Absent ||
        (_openapi_output["P_ref"] = _encode_unvalidated(_openapi_value.p_ref))
    _openapi_value.base_power isa Absent ||
        (_openapi_output["base_power"] = _encode_unvalidated(_openapi_value.base_power))
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
_encode(_openapi_value::GenericDER) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-1c4b7abd3c66ae6d8393.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding GenericDER";
    direction=:neutral,
)

function _form_fields(_openapi_value::GenericDER)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.qref_flag isa Absent ||
        push!(_openapi_output, "Qref_Flag" => _openapi_value.qref_flag)
    _openapi_value.pq_flag isa Absent ||
        push!(_openapi_output, "PQ_Flag" => _openapi_value.pq_flag)
    _openapi_value.gen_flag isa Absent ||
        push!(_openapi_output, "Gen_Flag" => _openapi_value.gen_flag)
    _openapi_value.perop_flag isa Absent ||
        push!(_openapi_output, "PerOp_Flag" => _openapi_value.perop_flag)
    _openapi_value.recon_flag isa Absent ||
        push!(_openapi_output, "Recon_Flag" => _openapi_value.recon_flag)
    _openapi_value.trv isa Absent || push!(_openapi_output, "Trv" => _openapi_value.trv)
    _openapi_value.vv_pnts isa Absent ||
        push!(_openapi_output, "VV_pnts" => _openapi_value.vv_pnts)
    _openapi_value.q_lim isa Absent ||
        push!(_openapi_output, "Q_lim" => _openapi_value.q_lim)
    _openapi_value.tp isa Absent || push!(_openapi_output, "Tp" => _openapi_value.tp)
    _openapi_value.e_lim isa Absent ||
        push!(_openapi_output, "e_lim" => _openapi_value.e_lim)
    _openapi_value.kpq isa Absent || push!(_openapi_output, "Kpq" => _openapi_value.kpq)
    _openapi_value.kiq isa Absent || push!(_openapi_output, "Kiq" => _openapi_value.kiq)
    _openapi_value.iqr_lim isa Absent ||
        push!(_openapi_output, "Iqr_lim" => _openapi_value.iqr_lim)
    _openapi_value.i_max isa Absent ||
        push!(_openapi_output, "I_max" => _openapi_value.i_max)
    _openapi_value.tg isa Absent || push!(_openapi_output, "Tg" => _openapi_value.tg)
    _openapi_value.kwh_cap isa Absent ||
        push!(_openapi_output, "kWh_Cap" => _openapi_value.kwh_cap)
    _openapi_value.soc_ini isa Absent ||
        push!(_openapi_output, "SOC_ini" => _openapi_value.soc_ini)
    _openapi_value.soc_lim isa Absent ||
        push!(_openapi_output, "SOC_lim" => _openapi_value.soc_lim)
    _openapi_value.trf isa Absent || push!(_openapi_output, "Trf" => _openapi_value.trf)
    _openapi_value.fdbd_pnts isa Absent ||
        push!(_openapi_output, "fdbd_pnts" => _openapi_value.fdbd_pnts)
    _openapi_value.d_dn isa Absent || push!(_openapi_output, "D_dn" => _openapi_value.d_dn)
    _openapi_value.d_up isa Absent || push!(_openapi_output, "D_up" => _openapi_value.d_up)
    _openapi_value.fe_lim isa Absent ||
        push!(_openapi_output, "fe_lim" => _openapi_value.fe_lim)
    _openapi_value.kpp isa Absent || push!(_openapi_output, "Kpp" => _openapi_value.kpp)
    _openapi_value.kip isa Absent || push!(_openapi_output, "Kip" => _openapi_value.kip)
    _openapi_value.p_lim isa Absent ||
        push!(_openapi_output, "P_lim" => _openapi_value.p_lim)
    _openapi_value.dp_lim isa Absent ||
        push!(_openapi_output, "dP_lim" => _openapi_value.dp_lim)
    _openapi_value.t_pord isa Absent ||
        push!(_openapi_output, "T_pord" => _openapi_value.t_pord)
    _openapi_value.rrpwr isa Absent ||
        push!(_openapi_output, "rrpwr" => _openapi_value.rrpwr)
    _openapi_value.vrt_pnts isa Absent ||
        push!(_openapi_output, "VRT_pnts" => _openapi_value.vrt_pnts)
    _openapi_value.tvrt_pnts isa Absent ||
        push!(_openapi_output, "TVRT_pnts" => _openapi_value.tvrt_pnts)
    _openapi_value.tv_delay isa Absent ||
        push!(_openapi_output, "tV_delay" => _openapi_value.tv_delay)
    _openapi_value.ves_lim isa Absent ||
        push!(_openapi_output, "VES_lim" => _openapi_value.ves_lim)
    _openapi_value.frt_pnts isa Absent ||
        push!(_openapi_output, "FRT_pnts" => _openapi_value.frt_pnts)
    _openapi_value.tfrt_pnts isa Absent ||
        push!(_openapi_output, "TFRT_pnts" => _openapi_value.tfrt_pnts)
    _openapi_value.tf_delay isa Absent ||
        push!(_openapi_output, "tF_delay" => _openapi_value.tf_delay)
    _openapi_value.fes_lim isa Absent ||
        push!(_openapi_output, "FES_lim" => _openapi_value.fes_lim)
    _openapi_value.pfa_ref isa Absent ||
        push!(_openapi_output, "Pfa_ref" => _openapi_value.pfa_ref)
    _openapi_value.q_ref isa Absent ||
        push!(_openapi_output, "Q_ref" => _openapi_value.q_ref)
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    _openapi_value.base_power isa Absent ||
        push!(_openapi_output, "base_power" => _openapi_value.base_power)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
