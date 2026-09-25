"""
    EXAC2

Modified AC2. This excitation systems consists of an alternator main exciter feeding its output via non-controlled rectifiers. The exciter does not employ self-excitation, and the voltage regulator power is taken from a source that is not affected by external transients. Parameters of IEEE Std 421.5 Type AC2A Excitacion System. The alternator main exciter is used, feeding its output via non-controlled rectifiers. The Type AC2C model is similar to that of Type AC1C except for the inclusion of exciter time constant compensation and exciter field current limiting elements. EXAC2 in PSSE and PSLF

  - `id`: Unique integer identifier for this component
  - `tr`: Regulator input filter time constant
  - `tb`: Regulator denominator (lag) time constant
  - `tc`: Regulator numerator (lead) time constant
  - `ka`: Regulator output gain
  - `ta`: Regulator output time constant
  - `va_lim`: A pair of values bounding a quantity from below (`min`) and from above (`max`).
  - `kb`: Second stage regulator gain
  - `vr_lim`: A pair of values bounding a quantity from below (`min`) and from above (`max`).
  - `te`: Exciter field time constant
  - `kl`: Exciter field current limiter gain
  - `kh`: Exciter field current regulator feedback gain
  - `kf`: Rate feedback excitation system stabilizer gain
  - `tf`: Rate feedback time constant
  - `kc`: Rectifier loading factor proportional to commutating reactance
  - `kd`: Demagnetizing factor, function of exciter alternator reactances
  - `ke`: Exciter field proportional constant
  - `v_lr`: Maximum exciter field current
  - `e_sat`: Exciter output voltage for saturation factor
  - `se`: Exciter saturation factor at exciter output voltage
  - `v_ref`: Reference voltage set-point
"""
Base.@kwdef struct EXAC2 <: APIModel
    id::Int64
    tr::Float64
    tb::Float64
    tc::Float64
    ka::Float64
    ta::Float64
    va_lim::MinMax
    kb::Float64
    vr_lim::MinMax
    te::Float64
    kl::Float64
    kh::Float64
    kf::Float64
    tf::Float64
    kc::Float64
    kd::Float64
    ke::Float64
    v_lr::Float64
    e_sat::Vector{Float64}
    se::Vector{Float64}
    v_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{EXAC2}, value) = _decode(EXAC2, value, true)
function _decode(::Type{EXAC2}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-d4abf7880359b4fa07ae.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding EXAC2";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "EXAC2")
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "EXAC2"), false)
    _openapi_field_tr = _decode(Float64, _required(_openapi_object, "Tr", "EXAC2"), false)
    _openapi_field_tb = _decode(Float64, _required(_openapi_object, "Tb", "EXAC2"), false)
    _openapi_field_tc = _decode(Float64, _required(_openapi_object, "Tc", "EXAC2"), false)
    _openapi_field_ka = _decode(Float64, _required(_openapi_object, "Ka", "EXAC2"), false)
    _openapi_field_ta = _decode(Float64, _required(_openapi_object, "Ta", "EXAC2"), false)
    _openapi_field_va_lim =
        _decode(MinMax, _required(_openapi_object, "Va_lim", "EXAC2"), false)
    _openapi_field_kb = _decode(Float64, _required(_openapi_object, "Kb", "EXAC2"), false)
    _openapi_field_vr_lim =
        _decode(MinMax, _required(_openapi_object, "Vr_lim", "EXAC2"), false)
    _openapi_field_te = _decode(Float64, _required(_openapi_object, "Te", "EXAC2"), false)
    _openapi_field_kl = _decode(Float64, _required(_openapi_object, "Kl", "EXAC2"), false)
    _openapi_field_kh = _decode(Float64, _required(_openapi_object, "Kh", "EXAC2"), false)
    _openapi_field_kf = _decode(Float64, _required(_openapi_object, "Kf", "EXAC2"), false)
    _openapi_field_tf = _decode(Float64, _required(_openapi_object, "Tf", "EXAC2"), false)
    _openapi_field_kc = _decode(Float64, _required(_openapi_object, "Kc", "EXAC2"), false)
    _openapi_field_kd = _decode(Float64, _required(_openapi_object, "Kd", "EXAC2"), false)
    _openapi_field_ke = _decode(Float64, _required(_openapi_object, "Ke", "EXAC2"), false)
    _openapi_field_v_lr =
        _decode(Float64, _required(_openapi_object, "V_lr", "EXAC2"), false)
    _openapi_field_e_sat =
        _decode(Vector{Float64}, _required(_openapi_object, "E_sat", "EXAC2"), false)
    _openapi_field_se =
        _decode(Vector{Float64}, _required(_openapi_object, "Se", "EXAC2"), false)
    _openapi_field_v_ref =
        haskey(_openapi_object, "V_ref") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["V_ref"], false) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "Tr",
            "Tb",
            "Tc",
            "Ka",
            "Ta",
            "Va_lim",
            "Kb",
            "Vr_lim",
            "Te",
            "Kl",
            "Kh",
            "Kf",
            "Tf",
            "Kc",
            "Kd",
            "Ke",
            "V_lr",
            "E_sat",
            "Se",
            "V_ref",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return EXAC2(;
        id=_openapi_field_id,
        tr=_openapi_field_tr,
        tb=_openapi_field_tb,
        tc=_openapi_field_tc,
        ka=_openapi_field_ka,
        ta=_openapi_field_ta,
        va_lim=_openapi_field_va_lim,
        kb=_openapi_field_kb,
        vr_lim=_openapi_field_vr_lim,
        te=_openapi_field_te,
        kl=_openapi_field_kl,
        kh=_openapi_field_kh,
        kf=_openapi_field_kf,
        tf=_openapi_field_tf,
        kc=_openapi_field_kc,
        kd=_openapi_field_kd,
        ke=_openapi_field_ke,
        v_lr=_openapi_field_v_lr,
        e_sat=_openapi_field_e_sat,
        se=_openapi_field_se,
        v_ref=_openapi_field_v_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::EXAC2)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.tr isa Absent ||
        (_openapi_output["Tr"] = _encode_unvalidated(_openapi_value.tr))
    _openapi_value.tb isa Absent ||
        (_openapi_output["Tb"] = _encode_unvalidated(_openapi_value.tb))
    _openapi_value.tc isa Absent ||
        (_openapi_output["Tc"] = _encode_unvalidated(_openapi_value.tc))
    _openapi_value.ka isa Absent ||
        (_openapi_output["Ka"] = _encode_unvalidated(_openapi_value.ka))
    _openapi_value.ta isa Absent ||
        (_openapi_output["Ta"] = _encode_unvalidated(_openapi_value.ta))
    _openapi_value.va_lim isa Absent ||
        (_openapi_output["Va_lim"] = _encode_unvalidated(_openapi_value.va_lim))
    _openapi_value.kb isa Absent ||
        (_openapi_output["Kb"] = _encode_unvalidated(_openapi_value.kb))
    _openapi_value.vr_lim isa Absent ||
        (_openapi_output["Vr_lim"] = _encode_unvalidated(_openapi_value.vr_lim))
    _openapi_value.te isa Absent ||
        (_openapi_output["Te"] = _encode_unvalidated(_openapi_value.te))
    _openapi_value.kl isa Absent ||
        (_openapi_output["Kl"] = _encode_unvalidated(_openapi_value.kl))
    _openapi_value.kh isa Absent ||
        (_openapi_output["Kh"] = _encode_unvalidated(_openapi_value.kh))
    _openapi_value.kf isa Absent ||
        (_openapi_output["Kf"] = _encode_unvalidated(_openapi_value.kf))
    _openapi_value.tf isa Absent ||
        (_openapi_output["Tf"] = _encode_unvalidated(_openapi_value.tf))
    _openapi_value.kc isa Absent ||
        (_openapi_output["Kc"] = _encode_unvalidated(_openapi_value.kc))
    _openapi_value.kd isa Absent ||
        (_openapi_output["Kd"] = _encode_unvalidated(_openapi_value.kd))
    _openapi_value.ke isa Absent ||
        (_openapi_output["Ke"] = _encode_unvalidated(_openapi_value.ke))
    _openapi_value.v_lr isa Absent ||
        (_openapi_output["V_lr"] = _encode_unvalidated(_openapi_value.v_lr))
    _openapi_value.e_sat isa Absent ||
        (_openapi_output["E_sat"] = _encode_unvalidated(_openapi_value.e_sat))
    _openapi_value.se isa Absent ||
        (_openapi_output["Se"] = _encode_unvalidated(_openapi_value.se))
    _openapi_value.v_ref isa Absent ||
        (_openapi_output["V_ref"] = _encode_unvalidated(_openapi_value.v_ref))
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
_encode(_openapi_value::EXAC2) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-d4abf7880359b4fa07ae.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding EXAC2";
    direction=:neutral,
)

function _form_fields(_openapi_value::EXAC2)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.tr isa Absent || push!(_openapi_output, "Tr" => _openapi_value.tr)
    _openapi_value.tb isa Absent || push!(_openapi_output, "Tb" => _openapi_value.tb)
    _openapi_value.tc isa Absent || push!(_openapi_output, "Tc" => _openapi_value.tc)
    _openapi_value.ka isa Absent || push!(_openapi_output, "Ka" => _openapi_value.ka)
    _openapi_value.ta isa Absent || push!(_openapi_output, "Ta" => _openapi_value.ta)
    _openapi_value.va_lim isa Absent ||
        push!(_openapi_output, "Va_lim" => _openapi_value.va_lim)
    _openapi_value.kb isa Absent || push!(_openapi_output, "Kb" => _openapi_value.kb)
    _openapi_value.vr_lim isa Absent ||
        push!(_openapi_output, "Vr_lim" => _openapi_value.vr_lim)
    _openapi_value.te isa Absent || push!(_openapi_output, "Te" => _openapi_value.te)
    _openapi_value.kl isa Absent || push!(_openapi_output, "Kl" => _openapi_value.kl)
    _openapi_value.kh isa Absent || push!(_openapi_output, "Kh" => _openapi_value.kh)
    _openapi_value.kf isa Absent || push!(_openapi_output, "Kf" => _openapi_value.kf)
    _openapi_value.tf isa Absent || push!(_openapi_output, "Tf" => _openapi_value.tf)
    _openapi_value.kc isa Absent || push!(_openapi_output, "Kc" => _openapi_value.kc)
    _openapi_value.kd isa Absent || push!(_openapi_output, "Kd" => _openapi_value.kd)
    _openapi_value.ke isa Absent || push!(_openapi_output, "Ke" => _openapi_value.ke)
    _openapi_value.v_lr isa Absent || push!(_openapi_output, "V_lr" => _openapi_value.v_lr)
    _openapi_value.e_sat isa Absent ||
        push!(_openapi_output, "E_sat" => _openapi_value.e_sat)
    _openapi_value.se isa Absent || push!(_openapi_output, "Se" => _openapi_value.se)
    _openapi_value.v_ref isa Absent ||
        push!(_openapi_output, "V_ref" => _openapi_value.v_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
