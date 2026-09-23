"""
    ESST1A

This excitation system supplies power through a transformer from the generator terminals and its regulated by a controlled rectifier (via thyristors). Parameters of IEEE Std 421.5 Type ST1A Excitacion System. ESST1A in PSSE and PSLF

  - `id`: Unique integer identifier for this component
  - `uel_flags`: Code input for Underexcitization limiter (UEL) entry
  - `pss_flags`: Code input for Power System Stabilizer (PSS) or (VOS) entry
  - `tr`: Regulator input filter time constant
  - `vi_lim`: Voltage error limits (regulator input)
  - `tc`: First regulator numerator (lead) time constant
  - `tb`: First regulator denominator (lag) time constant
  - `tc1`: Second regulator numerator (lead) time constant
  - `tb1`: Second regulator denominator (lag) time constant
  - `ka`: Voltage regulator gain
  - `ta`: Voltage regulator time constant
  - `va_lim`: A pair of values bounding a quantity from below (`min`) and from above (`max`).
  - `vr_lim`: A pair of values bounding a quantity from below (`min`) and from above (`max`).
  - `kc`: Rectifier loading factor proportional to commutating reactance
  - `kf`: Rate feedback gain
  - `tf`: Rate feedback time constant
  - `k_lr`: Exciter output current limiter gain
  - `i_lr`: Exciter output current limit reference
  - `v_ref`: Reference voltage set-point
"""
Base.@kwdef struct ESST1A <: APIModel
    id::Int64
    uel_flags::Int64
    pss_flags::Int64
    tr::Float64
    vi_lim::Vector{Float64}
    tc::Float64
    tb::Float64
    tc1::Float64
    tb1::Float64
    ka::Float64
    ta::Float64
    va_lim::MinMax
    vr_lim::MinMax
    kc::Float64
    kf::Float64
    tf::Float64
    k_lr::Float64
    i_lr::Float64
    v_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ESST1A}, value) = _decode(ESST1A, value, true)
function _decode(::Type{ESST1A}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-affdbb875e1d74cb8a0c.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding ESST1A";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ESST1A")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "ESST1A"), _openapi_validate)
    _openapi_field_uel_flags =
        _decode(Int64, _required(_openapi_object, "UEL_flags", "ESST1A"), _openapi_validate)
    _openapi_field_pss_flags =
        _decode(Int64, _required(_openapi_object, "PSS_flags", "ESST1A"), _openapi_validate)
    _openapi_field_tr =
        _decode(Float64, _required(_openapi_object, "Tr", "ESST1A"), _openapi_validate)
    _openapi_field_vi_lim = _decode(
        Vector{Float64},
        _required(_openapi_object, "Vi_lim", "ESST1A"),
        _openapi_validate,
    )
    _openapi_field_tc =
        _decode(Float64, _required(_openapi_object, "Tc", "ESST1A"), _openapi_validate)
    _openapi_field_tb =
        _decode(Float64, _required(_openapi_object, "Tb", "ESST1A"), _openapi_validate)
    _openapi_field_tc1 =
        _decode(Float64, _required(_openapi_object, "Tc1", "ESST1A"), _openapi_validate)
    _openapi_field_tb1 =
        _decode(Float64, _required(_openapi_object, "Tb1", "ESST1A"), _openapi_validate)
    _openapi_field_ka =
        _decode(Float64, _required(_openapi_object, "Ka", "ESST1A"), _openapi_validate)
    _openapi_field_ta =
        _decode(Float64, _required(_openapi_object, "Ta", "ESST1A"), _openapi_validate)
    _openapi_field_va_lim =
        _decode(MinMax, _required(_openapi_object, "Va_lim", "ESST1A"), _openapi_validate)
    _openapi_field_vr_lim =
        _decode(MinMax, _required(_openapi_object, "Vr_lim", "ESST1A"), _openapi_validate)
    _openapi_field_kc =
        _decode(Float64, _required(_openapi_object, "Kc", "ESST1A"), _openapi_validate)
    _openapi_field_kf =
        _decode(Float64, _required(_openapi_object, "Kf", "ESST1A"), _openapi_validate)
    _openapi_field_tf =
        _decode(Float64, _required(_openapi_object, "Tf", "ESST1A"), _openapi_validate)
    _openapi_field_k_lr =
        _decode(Float64, _required(_openapi_object, "K_lr", "ESST1A"), _openapi_validate)
    _openapi_field_i_lr =
        _decode(Float64, _required(_openapi_object, "I_lr", "ESST1A"), _openapi_validate)
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
            "id",
            "UEL_flags",
            "PSS_flags",
            "Tr",
            "Vi_lim",
            "Tc",
            "Tb",
            "Tc1",
            "Tb1",
            "Ka",
            "Ta",
            "Va_lim",
            "Vr_lim",
            "Kc",
            "Kf",
            "Tf",
            "K_lr",
            "I_lr",
            "V_ref",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return ESST1A(;
        id=_openapi_field_id,
        uel_flags=_openapi_field_uel_flags,
        pss_flags=_openapi_field_pss_flags,
        tr=_openapi_field_tr,
        vi_lim=_openapi_field_vi_lim,
        tc=_openapi_field_tc,
        tb=_openapi_field_tb,
        tc1=_openapi_field_tc1,
        tb1=_openapi_field_tb1,
        ka=_openapi_field_ka,
        ta=_openapi_field_ta,
        va_lim=_openapi_field_va_lim,
        vr_lim=_openapi_field_vr_lim,
        kc=_openapi_field_kc,
        kf=_openapi_field_kf,
        tf=_openapi_field_tf,
        k_lr=_openapi_field_k_lr,
        i_lr=_openapi_field_i_lr,
        v_ref=_openapi_field_v_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::ESST1A)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.uel_flags isa Absent ||
        (_openapi_output["UEL_flags"] = _encode(_openapi_value.uel_flags))
    _openapi_value.pss_flags isa Absent ||
        (_openapi_output["PSS_flags"] = _encode(_openapi_value.pss_flags))
    _openapi_value.tr isa Absent || (_openapi_output["Tr"] = _encode(_openapi_value.tr))
    _openapi_value.vi_lim isa Absent ||
        (_openapi_output["Vi_lim"] = _encode(_openapi_value.vi_lim))
    _openapi_value.tc isa Absent || (_openapi_output["Tc"] = _encode(_openapi_value.tc))
    _openapi_value.tb isa Absent || (_openapi_output["Tb"] = _encode(_openapi_value.tb))
    _openapi_value.tc1 isa Absent || (_openapi_output["Tc1"] = _encode(_openapi_value.tc1))
    _openapi_value.tb1 isa Absent || (_openapi_output["Tb1"] = _encode(_openapi_value.tb1))
    _openapi_value.ka isa Absent || (_openapi_output["Ka"] = _encode(_openapi_value.ka))
    _openapi_value.ta isa Absent || (_openapi_output["Ta"] = _encode(_openapi_value.ta))
    _openapi_value.va_lim isa Absent ||
        (_openapi_output["Va_lim"] = _encode(_openapi_value.va_lim))
    _openapi_value.vr_lim isa Absent ||
        (_openapi_output["Vr_lim"] = _encode(_openapi_value.vr_lim))
    _openapi_value.kc isa Absent || (_openapi_output["Kc"] = _encode(_openapi_value.kc))
    _openapi_value.kf isa Absent || (_openapi_output["Kf"] = _encode(_openapi_value.kf))
    _openapi_value.tf isa Absent || (_openapi_output["Tf"] = _encode(_openapi_value.tf))
    _openapi_value.k_lr isa Absent ||
        (_openapi_output["K_lr"] = _encode(_openapi_value.k_lr))
    _openapi_value.i_lr isa Absent ||
        (_openapi_output["I_lr"] = _encode(_openapi_value.i_lr))
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
            resource="https://openapi.invalid/schema/external-affdbb875e1d74cb8a0c.json",
            pointer="",
        ),
        _openapi_output,
        "encoding ESST1A";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::ESST1A)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.uel_flags isa Absent ||
        push!(_openapi_output, "UEL_flags" => _openapi_value.uel_flags)
    _openapi_value.pss_flags isa Absent ||
        push!(_openapi_output, "PSS_flags" => _openapi_value.pss_flags)
    _openapi_value.tr isa Absent || push!(_openapi_output, "Tr" => _openapi_value.tr)
    _openapi_value.vi_lim isa Absent ||
        push!(_openapi_output, "Vi_lim" => _openapi_value.vi_lim)
    _openapi_value.tc isa Absent || push!(_openapi_output, "Tc" => _openapi_value.tc)
    _openapi_value.tb isa Absent || push!(_openapi_output, "Tb" => _openapi_value.tb)
    _openapi_value.tc1 isa Absent || push!(_openapi_output, "Tc1" => _openapi_value.tc1)
    _openapi_value.tb1 isa Absent || push!(_openapi_output, "Tb1" => _openapi_value.tb1)
    _openapi_value.ka isa Absent || push!(_openapi_output, "Ka" => _openapi_value.ka)
    _openapi_value.ta isa Absent || push!(_openapi_output, "Ta" => _openapi_value.ta)
    _openapi_value.va_lim isa Absent ||
        push!(_openapi_output, "Va_lim" => _openapi_value.va_lim)
    _openapi_value.vr_lim isa Absent ||
        push!(_openapi_output, "Vr_lim" => _openapi_value.vr_lim)
    _openapi_value.kc isa Absent || push!(_openapi_output, "Kc" => _openapi_value.kc)
    _openapi_value.kf isa Absent || push!(_openapi_output, "Kf" => _openapi_value.kf)
    _openapi_value.tf isa Absent || push!(_openapi_output, "Tf" => _openapi_value.tf)
    _openapi_value.k_lr isa Absent || push!(_openapi_output, "K_lr" => _openapi_value.k_lr)
    _openapi_value.i_lr isa Absent || push!(_openapi_output, "I_lr" => _openapi_value.i_lr)
    _openapi_value.v_ref isa Absent ||
        push!(_openapi_output, "V_ref" => _openapi_value.v_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
