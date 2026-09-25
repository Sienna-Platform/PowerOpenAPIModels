"""
    ActiveRenewableControllerAB

Parameters of Active Power Controller including REPCA1 and REECB1.

  - `bus_control`: ACBus identification number for voltage control. `0` identifies the local bus connected to this component.
  - `from_branch_control`: Monitored branch FROM bus number for line drop compensation (if 0 generator power will be used).
  - `to_branch_control`: Monitored branch TO bus number for line drop compensation (if 0 generator power will be used).
  - `branch_id_control`: Branch circuit id for line drop compensation. If 0 generator power will be used. in psy this is a string representing the branch name
  - `freq_flag`: Frequency Flag for REPCA1: `false`: disable, `true`: enable.
  - `k_pg`: Active power PI control proportional gain.
  - `k_ig`: Active power PI control integral gain.
  - `t_p`: Real power measurement filter time constant. Units: s.
  - `fdbd_pnts`: Frequency error dead band thresholds `(fdbd1, fdbd2)`.
  - `fe_lim`: Upper/Lower limit on frequency error `(fe_min, fe_max)`.
  - `p_lim`: Upper/Lower limit on power reference `(P_min, P_max)`.
  - `t_g`: Power Controller lag time constant. Units: s.
  - `d_dn`: Droop for over-frequency conditions.
  - `d_up`: Droop for under-frequency conditions.
  - `dp_lim`: Upper/Lower limit on power reference ramp rates `(dP_min, dP_max)`.
  - `p_lim_inner`: Upper/Lower limit on power reference for REECB `(P_min_inner, P_max_inner)`.
  - `t_pord`: Power filter time constant REECB time constant. Units: s.
  - `p_ref`: Reference Power Set-point.
"""
Base.@kwdef struct ActiveRenewableControllerAB <: APIModel
    bus_control::Int64
    from_branch_control::Int64
    to_branch_control::Int64
    branch_id_control::Int64
    freq_flag::Bool
    k_pg::Float64
    k_ig::Float64
    t_p::Float64
    fdbd_pnts::FdbdPnts
    fe_lim::MinMax
    p_lim::MinMax
    t_g::Float64
    d_dn::Float64
    d_up::Float64
    dp_lim::MinMax
    p_lim_inner::MinMax
    t_pord::Union{Absent, Float64, Nothing} = ABSENT
    p_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ActiveRenewableControllerAB}, value) =
    _decode(ActiveRenewableControllerAB, value, true)
function _decode(::Type{ActiveRenewableControllerAB}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-bfda6a12a4739953b346.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding ActiveRenewableControllerAB";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ActiveRenewableControllerAB")
    _openapi_field_bus_control = _decode(
        Int64,
        _required(_openapi_object, "bus_control", "ActiveRenewableControllerAB"),
        false,
    )
    _openapi_field_from_branch_control = _decode(
        Int64,
        _required(_openapi_object, "from_branch_control", "ActiveRenewableControllerAB"),
        false,
    )
    _openapi_field_to_branch_control = _decode(
        Int64,
        _required(_openapi_object, "to_branch_control", "ActiveRenewableControllerAB"),
        false,
    )
    _openapi_field_branch_id_control = _decode(
        Int64,
        _required(_openapi_object, "branch_id_control", "ActiveRenewableControllerAB"),
        false,
    )
    _openapi_field_freq_flag = _decode(
        Bool,
        _required(_openapi_object, "Freq_Flag", "ActiveRenewableControllerAB"),
        false,
    )
    _openapi_field_k_pg = _decode(
        Float64,
        _required(_openapi_object, "K_pg", "ActiveRenewableControllerAB"),
        false,
    )
    _openapi_field_k_ig = _decode(
        Float64,
        _required(_openapi_object, "K_ig", "ActiveRenewableControllerAB"),
        false,
    )
    _openapi_field_t_p = _decode(
        Float64,
        _required(_openapi_object, "T_p", "ActiveRenewableControllerAB"),
        false,
    )
    _openapi_field_fdbd_pnts = _decode(
        FdbdPnts,
        _required(_openapi_object, "fdbd_pnts", "ActiveRenewableControllerAB"),
        false,
    )
    _openapi_field_fe_lim = _decode(
        MinMax,
        _required(_openapi_object, "fe_lim", "ActiveRenewableControllerAB"),
        false,
    )
    _openapi_field_p_lim = _decode(
        MinMax,
        _required(_openapi_object, "P_lim", "ActiveRenewableControllerAB"),
        false,
    )
    _openapi_field_t_g = _decode(
        Float64,
        _required(_openapi_object, "T_g", "ActiveRenewableControllerAB"),
        false,
    )
    _openapi_field_d_dn = _decode(
        Float64,
        _required(_openapi_object, "D_dn", "ActiveRenewableControllerAB"),
        false,
    )
    _openapi_field_d_up = _decode(
        Float64,
        _required(_openapi_object, "D_up", "ActiveRenewableControllerAB"),
        false,
    )
    _openapi_field_dp_lim = _decode(
        MinMax,
        _required(_openapi_object, "dP_lim", "ActiveRenewableControllerAB"),
        false,
    )
    _openapi_field_p_lim_inner = _decode(
        MinMax,
        _required(_openapi_object, "P_lim_inner", "ActiveRenewableControllerAB"),
        false,
    )
    _openapi_field_t_pord =
        haskey(_openapi_object, "T_pord") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["T_pord"], false) : ABSENT
    _openapi_field_p_ref =
        haskey(_openapi_object, "P_ref") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["P_ref"], false) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "bus_control",
            "from_branch_control",
            "to_branch_control",
            "branch_id_control",
            "Freq_Flag",
            "K_pg",
            "K_ig",
            "T_p",
            "fdbd_pnts",
            "fe_lim",
            "P_lim",
            "T_g",
            "D_dn",
            "D_up",
            "dP_lim",
            "P_lim_inner",
            "T_pord",
            "P_ref",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return ActiveRenewableControllerAB(;
        bus_control=_openapi_field_bus_control,
        from_branch_control=_openapi_field_from_branch_control,
        to_branch_control=_openapi_field_to_branch_control,
        branch_id_control=_openapi_field_branch_id_control,
        freq_flag=_openapi_field_freq_flag,
        k_pg=_openapi_field_k_pg,
        k_ig=_openapi_field_k_ig,
        t_p=_openapi_field_t_p,
        fdbd_pnts=_openapi_field_fdbd_pnts,
        fe_lim=_openapi_field_fe_lim,
        p_lim=_openapi_field_p_lim,
        t_g=_openapi_field_t_g,
        d_dn=_openapi_field_d_dn,
        d_up=_openapi_field_d_up,
        dp_lim=_openapi_field_dp_lim,
        p_lim_inner=_openapi_field_p_lim_inner,
        t_pord=_openapi_field_t_pord,
        p_ref=_openapi_field_p_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::ActiveRenewableControllerAB)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.bus_control isa Absent ||
        (_openapi_output["bus_control"] = _encode_unvalidated(_openapi_value.bus_control))
    _openapi_value.from_branch_control isa Absent || (
        _openapi_output["from_branch_control"] =
            _encode_unvalidated(_openapi_value.from_branch_control)
    )
    _openapi_value.to_branch_control isa Absent || (
        _openapi_output["to_branch_control"] =
            _encode_unvalidated(_openapi_value.to_branch_control)
    )
    _openapi_value.branch_id_control isa Absent || (
        _openapi_output["branch_id_control"] =
            _encode_unvalidated(_openapi_value.branch_id_control)
    )
    _openapi_value.freq_flag isa Absent ||
        (_openapi_output["Freq_Flag"] = _encode_unvalidated(_openapi_value.freq_flag))
    _openapi_value.k_pg isa Absent ||
        (_openapi_output["K_pg"] = _encode_unvalidated(_openapi_value.k_pg))
    _openapi_value.k_ig isa Absent ||
        (_openapi_output["K_ig"] = _encode_unvalidated(_openapi_value.k_ig))
    _openapi_value.t_p isa Absent ||
        (_openapi_output["T_p"] = _encode_unvalidated(_openapi_value.t_p))
    _openapi_value.fdbd_pnts isa Absent ||
        (_openapi_output["fdbd_pnts"] = _encode_unvalidated(_openapi_value.fdbd_pnts))
    _openapi_value.fe_lim isa Absent ||
        (_openapi_output["fe_lim"] = _encode_unvalidated(_openapi_value.fe_lim))
    _openapi_value.p_lim isa Absent ||
        (_openapi_output["P_lim"] = _encode_unvalidated(_openapi_value.p_lim))
    _openapi_value.t_g isa Absent ||
        (_openapi_output["T_g"] = _encode_unvalidated(_openapi_value.t_g))
    _openapi_value.d_dn isa Absent ||
        (_openapi_output["D_dn"] = _encode_unvalidated(_openapi_value.d_dn))
    _openapi_value.d_up isa Absent ||
        (_openapi_output["D_up"] = _encode_unvalidated(_openapi_value.d_up))
    _openapi_value.dp_lim isa Absent ||
        (_openapi_output["dP_lim"] = _encode_unvalidated(_openapi_value.dp_lim))
    _openapi_value.p_lim_inner isa Absent ||
        (_openapi_output["P_lim_inner"] = _encode_unvalidated(_openapi_value.p_lim_inner))
    _openapi_value.t_pord isa Absent ||
        (_openapi_output["T_pord"] = _encode_unvalidated(_openapi_value.t_pord))
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
_encode(_openapi_value::ActiveRenewableControllerAB) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-bfda6a12a4739953b346.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding ActiveRenewableControllerAB";
    direction=:neutral,
)

function _form_fields(_openapi_value::ActiveRenewableControllerAB)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.bus_control isa Absent ||
        push!(_openapi_output, "bus_control" => _openapi_value.bus_control)
    _openapi_value.from_branch_control isa Absent ||
        push!(_openapi_output, "from_branch_control" => _openapi_value.from_branch_control)
    _openapi_value.to_branch_control isa Absent ||
        push!(_openapi_output, "to_branch_control" => _openapi_value.to_branch_control)
    _openapi_value.branch_id_control isa Absent ||
        push!(_openapi_output, "branch_id_control" => _openapi_value.branch_id_control)
    _openapi_value.freq_flag isa Absent ||
        push!(_openapi_output, "Freq_Flag" => _openapi_value.freq_flag)
    _openapi_value.k_pg isa Absent || push!(_openapi_output, "K_pg" => _openapi_value.k_pg)
    _openapi_value.k_ig isa Absent || push!(_openapi_output, "K_ig" => _openapi_value.k_ig)
    _openapi_value.t_p isa Absent || push!(_openapi_output, "T_p" => _openapi_value.t_p)
    _openapi_value.fdbd_pnts isa Absent ||
        push!(_openapi_output, "fdbd_pnts" => _openapi_value.fdbd_pnts)
    _openapi_value.fe_lim isa Absent ||
        push!(_openapi_output, "fe_lim" => _openapi_value.fe_lim)
    _openapi_value.p_lim isa Absent ||
        push!(_openapi_output, "P_lim" => _openapi_value.p_lim)
    _openapi_value.t_g isa Absent || push!(_openapi_output, "T_g" => _openapi_value.t_g)
    _openapi_value.d_dn isa Absent || push!(_openapi_output, "D_dn" => _openapi_value.d_dn)
    _openapi_value.d_up isa Absent || push!(_openapi_output, "D_up" => _openapi_value.d_up)
    _openapi_value.dp_lim isa Absent ||
        push!(_openapi_output, "dP_lim" => _openapi_value.dp_lim)
    _openapi_value.p_lim_inner isa Absent ||
        push!(_openapi_output, "P_lim_inner" => _openapi_value.p_lim_inner)
    _openapi_value.t_pord isa Absent ||
        push!(_openapi_output, "T_pord" => _openapi_value.t_pord)
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
