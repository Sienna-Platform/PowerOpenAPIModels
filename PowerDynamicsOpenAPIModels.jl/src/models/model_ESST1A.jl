"""
    ESST1A

This excitation system supplies power through a transformer from the generator terminals and its regulated by a controlled rectifier (via thyristors). Parameters of IEEE Std 421.5 Type ST1A Excitacion System. ESST1A in PSSE and PSLF

  - `i_lr`: Exciter output current limit reference
  - `k_lr`: Exciter output current limiter gain
  - `ka`: Voltage regulator gain
  - `kc`: Rectifier loading factor proportional to commutating reactance
  - `kf`: Rate feedback gain
  - `pss_flags`: Code input for Power System Stabilizer (PSS) or (VOS) entry
  - `ta`: Voltage regulator time constant
  - `tb`: First regulator denominator (lag) time constant
  - `tb1`: Second regulator denominator (lag) time constant
  - `tc`: First regulator numerator (lead) time constant
  - `tc1`: Second regulator numerator (lead) time constant
  - `tf`: Rate feedback time constant
  - `tr`: Regulator input filter time constant
  - `uel_flags`: Code input for Underexcitization limiter (UEL) entry
  - `v_ref`: Reference voltage set-point
  - `va_lim`: Limits for regulator output
  - `vi_lim`: Voltage error limits (regulator input)
  - `vr_lim`: Limits for excitor output
  - `id`: Unique integer identifier for this component
"""
Base.@kwdef struct ESST1A <: APIModel
    i_lr::Float64
    k_lr::Float64
    ka::Float64
    kc::Float64
    kf::Float64
    pss_flags::Int64
    ta::Float64
    tb::Float64
    tb1::Float64
    tc::Float64
    tc1::Float64
    tf::Float64
    tr::Float64
    uel_flags::Int64
    v_ref::Union{Absent, Float64, Nothing} = ABSENT
    va_lim::MinMax
    vi_lim::Vector{Float64}
    vr_lim::MinMax
    id::Int64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ESST1A}, value) = _decode(ESST1A, value, true)
function _decode(::Type{ESST1A}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-d5d2d2b15ebff194ab18.json",
            pointer="/components/schemas/ESST1A",
        ),
        _openapi_raw,
        "decoding ESST1A";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ESST1A")
    _openapi_field_i_lr =
        _decode(Float64, _required(_openapi_object, "I_lr", "ESST1A"), _openapi_validate)
    _openapi_field_k_lr =
        _decode(Float64, _required(_openapi_object, "K_lr", "ESST1A"), _openapi_validate)
    _openapi_field_ka =
        _decode(Float64, _required(_openapi_object, "Ka", "ESST1A"), _openapi_validate)
    _openapi_field_kc =
        _decode(Float64, _required(_openapi_object, "Kc", "ESST1A"), _openapi_validate)
    _openapi_field_kf =
        _decode(Float64, _required(_openapi_object, "Kf", "ESST1A"), _openapi_validate)
    _openapi_field_pss_flags =
        _decode(Int64, _required(_openapi_object, "PSS_flags", "ESST1A"), _openapi_validate)
    _openapi_field_ta =
        _decode(Float64, _required(_openapi_object, "Ta", "ESST1A"), _openapi_validate)
    _openapi_field_tb =
        _decode(Float64, _required(_openapi_object, "Tb", "ESST1A"), _openapi_validate)
    _openapi_field_tb1 =
        _decode(Float64, _required(_openapi_object, "Tb1", "ESST1A"), _openapi_validate)
    _openapi_field_tc =
        _decode(Float64, _required(_openapi_object, "Tc", "ESST1A"), _openapi_validate)
    _openapi_field_tc1 =
        _decode(Float64, _required(_openapi_object, "Tc1", "ESST1A"), _openapi_validate)
    _openapi_field_tf =
        _decode(Float64, _required(_openapi_object, "Tf", "ESST1A"), _openapi_validate)
    _openapi_field_tr =
        _decode(Float64, _required(_openapi_object, "Tr", "ESST1A"), _openapi_validate)
    _openapi_field_uel_flags =
        _decode(Int64, _required(_openapi_object, "UEL_flags", "ESST1A"), _openapi_validate)
    _openapi_field_v_ref =
        haskey(_openapi_object, "V_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["V_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_va_lim =
        _decode(MinMax, _required(_openapi_object, "Va_lim", "ESST1A"), _openapi_validate)
    _openapi_field_vi_lim = _decode(
        Vector{Float64},
        _required(_openapi_object, "Vi_lim", "ESST1A"),
        _openapi_validate,
    )
    _openapi_field_vr_lim =
        _decode(MinMax, _required(_openapi_object, "Vr_lim", "ESST1A"), _openapi_validate)
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "ESST1A"), _openapi_validate)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "I_lr",
            "K_lr",
            "Ka",
            "Kc",
            "Kf",
            "PSS_flags",
            "Ta",
            "Tb",
            "Tb1",
            "Tc",
            "Tc1",
            "Tf",
            "Tr",
            "UEL_flags",
            "V_ref",
            "Va_lim",
            "Vi_lim",
            "Vr_lim",
            "id",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return ESST1A(;
        i_lr=_openapi_field_i_lr,
        k_lr=_openapi_field_k_lr,
        ka=_openapi_field_ka,
        kc=_openapi_field_kc,
        kf=_openapi_field_kf,
        pss_flags=_openapi_field_pss_flags,
        ta=_openapi_field_ta,
        tb=_openapi_field_tb,
        tb1=_openapi_field_tb1,
        tc=_openapi_field_tc,
        tc1=_openapi_field_tc1,
        tf=_openapi_field_tf,
        tr=_openapi_field_tr,
        uel_flags=_openapi_field_uel_flags,
        v_ref=_openapi_field_v_ref,
        va_lim=_openapi_field_va_lim,
        vi_lim=_openapi_field_vi_lim,
        vr_lim=_openapi_field_vr_lim,
        id=_openapi_field_id,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::ESST1A)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.i_lr isa Absent ||
        (_openapi_output["I_lr"] = _encode(_openapi_value.i_lr))
    _openapi_value.k_lr isa Absent ||
        (_openapi_output["K_lr"] = _encode(_openapi_value.k_lr))
    _openapi_value.ka isa Absent || (_openapi_output["Ka"] = _encode(_openapi_value.ka))
    _openapi_value.kc isa Absent || (_openapi_output["Kc"] = _encode(_openapi_value.kc))
    _openapi_value.kf isa Absent || (_openapi_output["Kf"] = _encode(_openapi_value.kf))
    _openapi_value.pss_flags isa Absent ||
        (_openapi_output["PSS_flags"] = _encode(_openapi_value.pss_flags))
    _openapi_value.ta isa Absent || (_openapi_output["Ta"] = _encode(_openapi_value.ta))
    _openapi_value.tb isa Absent || (_openapi_output["Tb"] = _encode(_openapi_value.tb))
    _openapi_value.tb1 isa Absent || (_openapi_output["Tb1"] = _encode(_openapi_value.tb1))
    _openapi_value.tc isa Absent || (_openapi_output["Tc"] = _encode(_openapi_value.tc))
    _openapi_value.tc1 isa Absent || (_openapi_output["Tc1"] = _encode(_openapi_value.tc1))
    _openapi_value.tf isa Absent || (_openapi_output["Tf"] = _encode(_openapi_value.tf))
    _openapi_value.tr isa Absent || (_openapi_output["Tr"] = _encode(_openapi_value.tr))
    _openapi_value.uel_flags isa Absent ||
        (_openapi_output["UEL_flags"] = _encode(_openapi_value.uel_flags))
    _openapi_value.v_ref isa Absent ||
        (_openapi_output["V_ref"] = _encode(_openapi_value.v_ref))
    _openapi_value.va_lim isa Absent ||
        (_openapi_output["Va_lim"] = _encode(_openapi_value.va_lim))
    _openapi_value.vi_lim isa Absent ||
        (_openapi_output["Vi_lim"] = _encode(_openapi_value.vi_lim))
    _openapi_value.vr_lim isa Absent ||
        (_openapi_output["Vr_lim"] = _encode(_openapi_value.vr_lim))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
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
            pointer="/components/schemas/ESST1A",
        ),
        _openapi_output,
        "encoding ESST1A";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::ESST1A)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.i_lr isa Absent || push!(_openapi_output, "I_lr" => _openapi_value.i_lr)
    _openapi_value.k_lr isa Absent || push!(_openapi_output, "K_lr" => _openapi_value.k_lr)
    _openapi_value.ka isa Absent || push!(_openapi_output, "Ka" => _openapi_value.ka)
    _openapi_value.kc isa Absent || push!(_openapi_output, "Kc" => _openapi_value.kc)
    _openapi_value.kf isa Absent || push!(_openapi_output, "Kf" => _openapi_value.kf)
    _openapi_value.pss_flags isa Absent ||
        push!(_openapi_output, "PSS_flags" => _openapi_value.pss_flags)
    _openapi_value.ta isa Absent || push!(_openapi_output, "Ta" => _openapi_value.ta)
    _openapi_value.tb isa Absent || push!(_openapi_output, "Tb" => _openapi_value.tb)
    _openapi_value.tb1 isa Absent || push!(_openapi_output, "Tb1" => _openapi_value.tb1)
    _openapi_value.tc isa Absent || push!(_openapi_output, "Tc" => _openapi_value.tc)
    _openapi_value.tc1 isa Absent || push!(_openapi_output, "Tc1" => _openapi_value.tc1)
    _openapi_value.tf isa Absent || push!(_openapi_output, "Tf" => _openapi_value.tf)
    _openapi_value.tr isa Absent || push!(_openapi_output, "Tr" => _openapi_value.tr)
    _openapi_value.uel_flags isa Absent ||
        push!(_openapi_output, "UEL_flags" => _openapi_value.uel_flags)
    _openapi_value.v_ref isa Absent ||
        push!(_openapi_output, "V_ref" => _openapi_value.v_ref)
    _openapi_value.va_lim isa Absent ||
        push!(_openapi_output, "Va_lim" => _openapi_value.va_lim)
    _openapi_value.vi_lim isa Absent ||
        push!(_openapi_output, "Vi_lim" => _openapi_value.vi_lim)
    _openapi_value.vr_lim isa Absent ||
        push!(_openapi_output, "Vr_lim" => _openapi_value.vr_lim)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
