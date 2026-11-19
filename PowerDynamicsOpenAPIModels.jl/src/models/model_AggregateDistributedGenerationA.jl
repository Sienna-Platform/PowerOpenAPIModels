"""
    AggregateDistributedGenerationA

Parameters of the DERA1 model in PSS/E It has no bus of its own: exactly one static injection device, with the same name, names it in its `dynamic_injector` property, and that device supplies the rest of its data.

  - `id`: Unique integer identifier for this component.
  - `name`: Name of the dynamic injection. Must equal the name of the static injection device that names it in `dynamic_injector`.
  - `pf_flag`: Flag for Power Factor Control
  - `freq_flag`: Flag to enable/disable frequency control
  - `pq_flag`: Flag used to enforce maximum current
  - `gen_flag`: Flag to specify generator or storage
  - `vtrip_flag`: Flag to enable/disable voltage trip logic
  - `ftrip_flag`: Flag to enable/disable frequency trip logic
  - `t_rv`: Voltage measurement transducer time constant. Units: s.
  - `trf`: Frequency measurement transducer time constant. Units: s.
  - `dbd_pnts`: Voltage deadband thresholds `(dbd1, dbd2)`
  - `k_qv`: Proportional voltage control gain (pu)
  - `tp`: Power measurement transducer time constant. Units: s.
  - `t_iq`: Time constant for low-pass filter for state q_V when QFlag = 0. Units: s.
  - `d_dn`: Reciprocal of droop for over-frequency conditions (>0) (pu)
  - `d_up`: Reciprocal of droop for under-frequency conditions <=0) (pu)
  - `fdbd_pnts`: Frequency control deadband thresholds `(fdbd1, fdbd2)`
  - `fe_lim`: Frequency error limits (femin, femax)
  - `p_lim`: Power limits (Pmin, Pmax)
  - `dp_lim`: Power reference ramp rate limits (dPmin, dPmax)
  - `tpord`: Power filter time constant. Units: s.
  - `kpg`: PI controller proportional gain (pu)
  - `kig`: PI controller integral gain (pu)
  - `i_max`: Maximum limit on total converter current (pu)
  - `vl_pnts`: Low voltage cutout points `[(tv10, vl0), (tv11, vl1)]`
  - `vh_pnts`: High voltage cutout points `[(tvh0, vh0), (tvh1, vh1)]`
  - `vrfrac`: Fraction of device that recovers after voltage comes back to within vl1 < V < vh1 (0 <= Vrfrac <= 1)
  - `fl`: Inverter frequency break-point for low frequency cut-out (Hz). Units: Hz.
  - `fh`: Inverter frequency break-point for high frequency cut-out (Hz). Units: Hz.
  - `tfl`: Low frequency cut-out timer corresponding to frequency fl (s). Units: s.
  - `tfh`: High frequency cut-out timer corresponding to frequency fh (s). Units: s.
  - `tg`: Current control time constant (to represent behavior of inner control loops) (> 0) (s). Units: s.
  - `rrpwr`: Ramp rate for real power increase following a fault (pu/s)
  - `tv`: Time constant on the output of the multiplier (s). Units: s.
  - `vpr`: Voltage below which frequency tripping is disabled (pu). Units: pu.
  - `iq_lim`: Reactive current injection limits (Iqll, Iqhl)
  - `v_ref`: User defined voltage reference. If 0, `PowerSimulationsDynamics.jl` initializes to initial terminal voltage
  - `pfa_ref`: Reference power factor
  - `frequency_ref`: Reference frequency, in natural units. Usually equal to the system frequency. Units: Hz.
  - `q_ref`: Reference reactive power, in pu. Units: pu.
  - `p_ref`: Reference active power, in pu. Units: pu.
  - `base_power`: Base power for the per-unit parameters of this model. Usually equal to the `base_power` of the static injection device that names this model. Units: MVA.
"""
Base.@kwdef struct AggregateDistributedGenerationA <: APIModel
    id::Int64
    name::String
    pf_flag::Bool
    freq_flag::Bool
    pq_flag::Bool
    gen_flag::Bool
    vtrip_flag::Bool
    ftrip_flag::Bool
    t_rv::Float64
    trf::Float64
    dbd_pnts::DbdPnts
    k_qv::Float64
    tp::Float64
    t_iq::Float64
    d_dn::Float64
    d_up::Float64
    fdbd_pnts::FdbdPnts
    fe_lim::MinMax
    p_lim::MinMax
    dp_lim::MinMax
    tpord::Float64
    kpg::Float64
    kig::Float64
    i_max::Float64
    vl_pnts::Vector{Vector{Float64}}
    vh_pnts::Vector{Vector{Float64}}
    vrfrac::Float64
    fl::Float64
    fh::Float64
    tfl::Float64
    tfh::Float64
    tg::Float64
    rrpwr::Float64
    tv::Float64
    vpr::Float64
    iq_lim::MinMax
    v_ref::Union{Absent, Float64, Nothing} = ABSENT
    pfa_ref::Union{Absent, Float64, Nothing} = ABSENT
    frequency_ref::Union{Absent, Float64, Nothing} = ABSENT
    q_ref::Union{Absent, Float64, Nothing} = ABSENT
    p_ref::Union{Absent, Float64, Nothing} = ABSENT
    base_power::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{AggregateDistributedGenerationA}, value) =
    _decode(AggregateDistributedGenerationA, value, true)
function _decode(
    ::Type{AggregateDistributedGenerationA},
    _openapi_raw,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-ea9f72190d6864dfe669.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding AggregateDistributedGenerationA";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "AggregateDistributedGenerationA")
    _openapi_field_id = _decode_zoned(
        Int64,
        _required(_openapi_object, "id", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_name = _decode_zoned(
        String,
        _required(_openapi_object, "name", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_pf_flag = _decode_zoned(
        Bool,
        _required(_openapi_object, "Pf_Flag", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_freq_flag = _decode_zoned(
        Bool,
        _required(_openapi_object, "Freq_Flag", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_pq_flag = _decode_zoned(
        Bool,
        _required(_openapi_object, "PQ_Flag", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_gen_flag = _decode_zoned(
        Bool,
        _required(_openapi_object, "Gen_Flag", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_vtrip_flag = _decode_zoned(
        Bool,
        _required(_openapi_object, "Vtrip_Flag", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_ftrip_flag = _decode_zoned(
        Bool,
        _required(_openapi_object, "Ftrip_Flag", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_t_rv = _decode_zoned(
        Float64,
        _required(_openapi_object, "T_rv", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_trf = _decode_zoned(
        Float64,
        _required(_openapi_object, "Trf", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_dbd_pnts = _decode_zoned(
        DbdPnts,
        _required(_openapi_object, "dbd_pnts", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_k_qv = _decode_zoned(
        Float64,
        _required(_openapi_object, "K_qv", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_tp = _decode_zoned(
        Float64,
        _required(_openapi_object, "Tp", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_t_iq = _decode_zoned(
        Float64,
        _required(_openapi_object, "T_iq", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_d_dn = _decode_zoned(
        Float64,
        _required(_openapi_object, "D_dn", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_d_up = _decode_zoned(
        Float64,
        _required(_openapi_object, "D_up", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_fdbd_pnts = _decode_zoned(
        FdbdPnts,
        _required(_openapi_object, "fdbd_pnts", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_fe_lim = _decode_zoned(
        MinMax,
        _required(_openapi_object, "fe_lim", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_p_lim = _decode_zoned(
        MinMax,
        _required(_openapi_object, "P_lim", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_dp_lim = _decode_zoned(
        MinMax,
        _required(_openapi_object, "dP_lim", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_tpord = _decode_zoned(
        Float64,
        _required(_openapi_object, "Tpord", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_kpg = _decode_zoned(
        Float64,
        _required(_openapi_object, "Kpg", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_kig = _decode_zoned(
        Float64,
        _required(_openapi_object, "Kig", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_i_max = _decode_zoned(
        Float64,
        _required(_openapi_object, "I_max", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_vl_pnts = _decode_zoned(
        Vector{Vector{Float64}},
        _required(_openapi_object, "vl_pnts", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_vh_pnts = _decode_zoned(
        Vector{Vector{Float64}},
        _required(_openapi_object, "vh_pnts", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_vrfrac = _decode_zoned(
        Float64,
        _required(_openapi_object, "Vrfrac", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_fl = _decode_zoned(
        Float64,
        _required(_openapi_object, "fl", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_fh = _decode_zoned(
        Float64,
        _required(_openapi_object, "fh", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_tfl = _decode_zoned(
        Float64,
        _required(_openapi_object, "tfl", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_tfh = _decode_zoned(
        Float64,
        _required(_openapi_object, "tfh", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_tg = _decode_zoned(
        Float64,
        _required(_openapi_object, "Tg", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_rrpwr = _decode_zoned(
        Float64,
        _required(_openapi_object, "rrpwr", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_tv = _decode_zoned(
        Float64,
        _required(_openapi_object, "Tv", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_vpr = _decode_zoned(
        Float64,
        _required(_openapi_object, "Vpr", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_iq_lim = _decode_zoned(
        MinMax,
        _required(_openapi_object, "Iq_lim", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_field_v_ref =
        haskey(_openapi_object, "V_ref") ?
        _decode_zoned(Union{Absent, Float64, Nothing}, _openapi_object["V_ref"], false) :
        ABSENT
    _openapi_field_pfa_ref =
        haskey(_openapi_object, "Pfa_ref") ?
        _decode_zoned(Union{Absent, Float64, Nothing}, _openapi_object["Pfa_ref"], false) :
        ABSENT
    _openapi_field_frequency_ref =
        haskey(_openapi_object, "frequency_ref") ?
        _decode_zoned(
            Union{Absent, Float64, Nothing},
            _openapi_object["frequency_ref"],
            false,
        ) : ABSENT
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
        _required(_openapi_object, "base_power", "AggregateDistributedGenerationA"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "Pf_Flag",
            "Freq_Flag",
            "PQ_Flag",
            "Gen_Flag",
            "Vtrip_Flag",
            "Ftrip_Flag",
            "T_rv",
            "Trf",
            "dbd_pnts",
            "K_qv",
            "Tp",
            "T_iq",
            "D_dn",
            "D_up",
            "fdbd_pnts",
            "fe_lim",
            "P_lim",
            "dP_lim",
            "Tpord",
            "Kpg",
            "Kig",
            "I_max",
            "vl_pnts",
            "vh_pnts",
            "Vrfrac",
            "fl",
            "fh",
            "tfl",
            "tfh",
            "Tg",
            "rrpwr",
            "Tv",
            "Vpr",
            "Iq_lim",
            "V_ref",
            "Pfa_ref",
            "frequency_ref",
            "Q_ref",
            "P_ref",
            "base_power",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode_zoned(Any, _openapi_item, false)
    end
    return AggregateDistributedGenerationA(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        pf_flag=_openapi_field_pf_flag,
        freq_flag=_openapi_field_freq_flag,
        pq_flag=_openapi_field_pq_flag,
        gen_flag=_openapi_field_gen_flag,
        vtrip_flag=_openapi_field_vtrip_flag,
        ftrip_flag=_openapi_field_ftrip_flag,
        t_rv=_openapi_field_t_rv,
        trf=_openapi_field_trf,
        dbd_pnts=_openapi_field_dbd_pnts,
        k_qv=_openapi_field_k_qv,
        tp=_openapi_field_tp,
        t_iq=_openapi_field_t_iq,
        d_dn=_openapi_field_d_dn,
        d_up=_openapi_field_d_up,
        fdbd_pnts=_openapi_field_fdbd_pnts,
        fe_lim=_openapi_field_fe_lim,
        p_lim=_openapi_field_p_lim,
        dp_lim=_openapi_field_dp_lim,
        tpord=_openapi_field_tpord,
        kpg=_openapi_field_kpg,
        kig=_openapi_field_kig,
        i_max=_openapi_field_i_max,
        vl_pnts=_openapi_field_vl_pnts,
        vh_pnts=_openapi_field_vh_pnts,
        vrfrac=_openapi_field_vrfrac,
        fl=_openapi_field_fl,
        fh=_openapi_field_fh,
        tfl=_openapi_field_tfl,
        tfh=_openapi_field_tfh,
        tg=_openapi_field_tg,
        rrpwr=_openapi_field_rrpwr,
        tv=_openapi_field_tv,
        vpr=_openapi_field_vpr,
        iq_lim=_openapi_field_iq_lim,
        v_ref=_openapi_field_v_ref,
        pfa_ref=_openapi_field_pfa_ref,
        frequency_ref=_openapi_field_frequency_ref,
        q_ref=_openapi_field_q_ref,
        p_ref=_openapi_field_p_ref,
        base_power=_openapi_field_base_power,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::AggregateDistributedGenerationA)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode_unvalidated(_openapi_value.name))
    _openapi_value.pf_flag isa Absent ||
        (_openapi_output["Pf_Flag"] = _encode_unvalidated(_openapi_value.pf_flag))
    _openapi_value.freq_flag isa Absent ||
        (_openapi_output["Freq_Flag"] = _encode_unvalidated(_openapi_value.freq_flag))
    _openapi_value.pq_flag isa Absent ||
        (_openapi_output["PQ_Flag"] = _encode_unvalidated(_openapi_value.pq_flag))
    _openapi_value.gen_flag isa Absent ||
        (_openapi_output["Gen_Flag"] = _encode_unvalidated(_openapi_value.gen_flag))
    _openapi_value.vtrip_flag isa Absent ||
        (_openapi_output["Vtrip_Flag"] = _encode_unvalidated(_openapi_value.vtrip_flag))
    _openapi_value.ftrip_flag isa Absent ||
        (_openapi_output["Ftrip_Flag"] = _encode_unvalidated(_openapi_value.ftrip_flag))
    _openapi_value.t_rv isa Absent ||
        (_openapi_output["T_rv"] = _encode_unvalidated(_openapi_value.t_rv))
    _openapi_value.trf isa Absent ||
        (_openapi_output["Trf"] = _encode_unvalidated(_openapi_value.trf))
    _openapi_value.dbd_pnts isa Absent ||
        (_openapi_output["dbd_pnts"] = _encode_unvalidated(_openapi_value.dbd_pnts))
    _openapi_value.k_qv isa Absent ||
        (_openapi_output["K_qv"] = _encode_unvalidated(_openapi_value.k_qv))
    _openapi_value.tp isa Absent ||
        (_openapi_output["Tp"] = _encode_unvalidated(_openapi_value.tp))
    _openapi_value.t_iq isa Absent ||
        (_openapi_output["T_iq"] = _encode_unvalidated(_openapi_value.t_iq))
    _openapi_value.d_dn isa Absent ||
        (_openapi_output["D_dn"] = _encode_unvalidated(_openapi_value.d_dn))
    _openapi_value.d_up isa Absent ||
        (_openapi_output["D_up"] = _encode_unvalidated(_openapi_value.d_up))
    _openapi_value.fdbd_pnts isa Absent ||
        (_openapi_output["fdbd_pnts"] = _encode_unvalidated(_openapi_value.fdbd_pnts))
    _openapi_value.fe_lim isa Absent ||
        (_openapi_output["fe_lim"] = _encode_unvalidated(_openapi_value.fe_lim))
    _openapi_value.p_lim isa Absent ||
        (_openapi_output["P_lim"] = _encode_unvalidated(_openapi_value.p_lim))
    _openapi_value.dp_lim isa Absent ||
        (_openapi_output["dP_lim"] = _encode_unvalidated(_openapi_value.dp_lim))
    _openapi_value.tpord isa Absent ||
        (_openapi_output["Tpord"] = _encode_unvalidated(_openapi_value.tpord))
    _openapi_value.kpg isa Absent ||
        (_openapi_output["Kpg"] = _encode_unvalidated(_openapi_value.kpg))
    _openapi_value.kig isa Absent ||
        (_openapi_output["Kig"] = _encode_unvalidated(_openapi_value.kig))
    _openapi_value.i_max isa Absent ||
        (_openapi_output["I_max"] = _encode_unvalidated(_openapi_value.i_max))
    _openapi_value.vl_pnts isa Absent ||
        (_openapi_output["vl_pnts"] = _encode_unvalidated(_openapi_value.vl_pnts))
    _openapi_value.vh_pnts isa Absent ||
        (_openapi_output["vh_pnts"] = _encode_unvalidated(_openapi_value.vh_pnts))
    _openapi_value.vrfrac isa Absent ||
        (_openapi_output["Vrfrac"] = _encode_unvalidated(_openapi_value.vrfrac))
    _openapi_value.fl isa Absent ||
        (_openapi_output["fl"] = _encode_unvalidated(_openapi_value.fl))
    _openapi_value.fh isa Absent ||
        (_openapi_output["fh"] = _encode_unvalidated(_openapi_value.fh))
    _openapi_value.tfl isa Absent ||
        (_openapi_output["tfl"] = _encode_unvalidated(_openapi_value.tfl))
    _openapi_value.tfh isa Absent ||
        (_openapi_output["tfh"] = _encode_unvalidated(_openapi_value.tfh))
    _openapi_value.tg isa Absent ||
        (_openapi_output["Tg"] = _encode_unvalidated(_openapi_value.tg))
    _openapi_value.rrpwr isa Absent ||
        (_openapi_output["rrpwr"] = _encode_unvalidated(_openapi_value.rrpwr))
    _openapi_value.tv isa Absent ||
        (_openapi_output["Tv"] = _encode_unvalidated(_openapi_value.tv))
    _openapi_value.vpr isa Absent ||
        (_openapi_output["Vpr"] = _encode_unvalidated(_openapi_value.vpr))
    _openapi_value.iq_lim isa Absent ||
        (_openapi_output["Iq_lim"] = _encode_unvalidated(_openapi_value.iq_lim))
    _openapi_value.v_ref isa Absent ||
        (_openapi_output["V_ref"] = _encode_unvalidated(_openapi_value.v_ref))
    _openapi_value.pfa_ref isa Absent ||
        (_openapi_output["Pfa_ref"] = _encode_unvalidated(_openapi_value.pfa_ref))
    _openapi_value.frequency_ref isa Absent || (
        _openapi_output["frequency_ref"] =
            _encode_unvalidated(_openapi_value.frequency_ref)
    )
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
_encode(_openapi_value::AggregateDistributedGenerationA) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-ea9f72190d6864dfe669.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding AggregateDistributedGenerationA";
    direction=:neutral,
)

function _form_fields(_openapi_value::AggregateDistributedGenerationA)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.pf_flag isa Absent ||
        push!(_openapi_output, "Pf_Flag" => _openapi_value.pf_flag)
    _openapi_value.freq_flag isa Absent ||
        push!(_openapi_output, "Freq_Flag" => _openapi_value.freq_flag)
    _openapi_value.pq_flag isa Absent ||
        push!(_openapi_output, "PQ_Flag" => _openapi_value.pq_flag)
    _openapi_value.gen_flag isa Absent ||
        push!(_openapi_output, "Gen_Flag" => _openapi_value.gen_flag)
    _openapi_value.vtrip_flag isa Absent ||
        push!(_openapi_output, "Vtrip_Flag" => _openapi_value.vtrip_flag)
    _openapi_value.ftrip_flag isa Absent ||
        push!(_openapi_output, "Ftrip_Flag" => _openapi_value.ftrip_flag)
    _openapi_value.t_rv isa Absent || push!(_openapi_output, "T_rv" => _openapi_value.t_rv)
    _openapi_value.trf isa Absent || push!(_openapi_output, "Trf" => _openapi_value.trf)
    _openapi_value.dbd_pnts isa Absent ||
        push!(_openapi_output, "dbd_pnts" => _openapi_value.dbd_pnts)
    _openapi_value.k_qv isa Absent || push!(_openapi_output, "K_qv" => _openapi_value.k_qv)
    _openapi_value.tp isa Absent || push!(_openapi_output, "Tp" => _openapi_value.tp)
    _openapi_value.t_iq isa Absent || push!(_openapi_output, "T_iq" => _openapi_value.t_iq)
    _openapi_value.d_dn isa Absent || push!(_openapi_output, "D_dn" => _openapi_value.d_dn)
    _openapi_value.d_up isa Absent || push!(_openapi_output, "D_up" => _openapi_value.d_up)
    _openapi_value.fdbd_pnts isa Absent ||
        push!(_openapi_output, "fdbd_pnts" => _openapi_value.fdbd_pnts)
    _openapi_value.fe_lim isa Absent ||
        push!(_openapi_output, "fe_lim" => _openapi_value.fe_lim)
    _openapi_value.p_lim isa Absent ||
        push!(_openapi_output, "P_lim" => _openapi_value.p_lim)
    _openapi_value.dp_lim isa Absent ||
        push!(_openapi_output, "dP_lim" => _openapi_value.dp_lim)
    _openapi_value.tpord isa Absent ||
        push!(_openapi_output, "Tpord" => _openapi_value.tpord)
    _openapi_value.kpg isa Absent || push!(_openapi_output, "Kpg" => _openapi_value.kpg)
    _openapi_value.kig isa Absent || push!(_openapi_output, "Kig" => _openapi_value.kig)
    _openapi_value.i_max isa Absent ||
        push!(_openapi_output, "I_max" => _openapi_value.i_max)
    _openapi_value.vl_pnts isa Absent ||
        push!(_openapi_output, "vl_pnts" => _openapi_value.vl_pnts)
    _openapi_value.vh_pnts isa Absent ||
        push!(_openapi_output, "vh_pnts" => _openapi_value.vh_pnts)
    _openapi_value.vrfrac isa Absent ||
        push!(_openapi_output, "Vrfrac" => _openapi_value.vrfrac)
    _openapi_value.fl isa Absent || push!(_openapi_output, "fl" => _openapi_value.fl)
    _openapi_value.fh isa Absent || push!(_openapi_output, "fh" => _openapi_value.fh)
    _openapi_value.tfl isa Absent || push!(_openapi_output, "tfl" => _openapi_value.tfl)
    _openapi_value.tfh isa Absent || push!(_openapi_output, "tfh" => _openapi_value.tfh)
    _openapi_value.tg isa Absent || push!(_openapi_output, "Tg" => _openapi_value.tg)
    _openapi_value.rrpwr isa Absent ||
        push!(_openapi_output, "rrpwr" => _openapi_value.rrpwr)
    _openapi_value.tv isa Absent || push!(_openapi_output, "Tv" => _openapi_value.tv)
    _openapi_value.vpr isa Absent || push!(_openapi_output, "Vpr" => _openapi_value.vpr)
    _openapi_value.iq_lim isa Absent ||
        push!(_openapi_output, "Iq_lim" => _openapi_value.iq_lim)
    _openapi_value.v_ref isa Absent ||
        push!(_openapi_output, "V_ref" => _openapi_value.v_ref)
    _openapi_value.pfa_ref isa Absent ||
        push!(_openapi_output, "Pfa_ref" => _openapi_value.pfa_ref)
    _openapi_value.frequency_ref isa Absent ||
        push!(_openapi_output, "frequency_ref" => _openapi_value.frequency_ref)
    _openapi_value.q_ref isa Absent ||
        push!(_openapi_output, "Q_ref" => _openapi_value.q_ref)
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    _openapi_value.base_power isa Absent ||
        push!(_openapi_output, "base_power" => _openapi_value.base_power)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
