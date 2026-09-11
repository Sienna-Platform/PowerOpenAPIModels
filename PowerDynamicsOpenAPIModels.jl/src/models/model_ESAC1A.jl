"""
    ESAC1A

This excitation systems consists of an alternator main exciter feeding its output via non-controlled rectifiers. The exciter does not employ self-excitation, and the voltage regulator power is taken from a source that is not affected by external transients. Parameters of IEEE Std 421.5 Type AC1A Excitacion System. This model corresponds to ESAC1A in PSSE and PSLF

  - `e_sat`: Exciter output voltage for saturation factor
  - `ka`: Regulator output gain
  - `kc`: Rectifier loading factor proportional to commutating reactance
  - `kd`: Demagnetizing factor, function of exciter alternator reactances
  - `ke`: Exciter field proportional constant
  - `kf`: Rate feedback excitation system stabilizer gain
  - `se`: Exciter saturation factor at exciter output voltage
  - `ta`: Regulator output time constant
  - `tb`: Regulator denominator (lag) time constant
  - `tc`: Regulator numerator (lead) time constant
  - `te`: Exciter field time constant
  - `tf`: Rate feedback time constant
  - `tr`: Regulator input filter time constant
  - `v_ref`: Reference voltage set-point
  - `va_lim`: Limits for regulator output
  - `vr_lim`: Limits for excitor field voltage
  - `id`: Unique integer identifier for this component
"""
Base.@kwdef struct ESAC1A <: APIModel
    e_sat::Vector{Float64}
    ka::Float64
    kc::Float64
    kd::Float64
    ke::Float64
    kf::Float64
    se::Vector{Float64}
    ta::Float64
    tb::Float64
    tc::Float64
    te::Float64
    tf::Float64
    tr::Float64
    v_ref::Union{Absent, Float64, Nothing} = ABSENT
    va_lim::MinMax
    vr_lim::MinMax
    id::Int64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ESAC1A}, value) = _decode(ESAC1A, value, true)
function _decode(::Type{ESAC1A}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-d5d2d2b15ebff194ab18.json",
            pointer="/components/schemas/ESAC1A",
        ),
        _openapi_raw,
        "decoding ESAC1A";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ESAC1A")
    _openapi_field_e_sat = _decode(
        Vector{Float64},
        _required(_openapi_object, "E_sat", "ESAC1A"),
        _openapi_validate,
    )
    _openapi_field_ka =
        _decode(Float64, _required(_openapi_object, "Ka", "ESAC1A"), _openapi_validate)
    _openapi_field_kc =
        _decode(Float64, _required(_openapi_object, "Kc", "ESAC1A"), _openapi_validate)
    _openapi_field_kd =
        _decode(Float64, _required(_openapi_object, "Kd", "ESAC1A"), _openapi_validate)
    _openapi_field_ke =
        _decode(Float64, _required(_openapi_object, "Ke", "ESAC1A"), _openapi_validate)
    _openapi_field_kf =
        _decode(Float64, _required(_openapi_object, "Kf", "ESAC1A"), _openapi_validate)
    _openapi_field_se = _decode(
        Vector{Float64},
        _required(_openapi_object, "Se", "ESAC1A"),
        _openapi_validate,
    )
    _openapi_field_ta =
        _decode(Float64, _required(_openapi_object, "Ta", "ESAC1A"), _openapi_validate)
    _openapi_field_tb =
        _decode(Float64, _required(_openapi_object, "Tb", "ESAC1A"), _openapi_validate)
    _openapi_field_tc =
        _decode(Float64, _required(_openapi_object, "Tc", "ESAC1A"), _openapi_validate)
    _openapi_field_te =
        _decode(Float64, _required(_openapi_object, "Te", "ESAC1A"), _openapi_validate)
    _openapi_field_tf =
        _decode(Float64, _required(_openapi_object, "Tf", "ESAC1A"), _openapi_validate)
    _openapi_field_tr =
        _decode(Float64, _required(_openapi_object, "Tr", "ESAC1A"), _openapi_validate)
    _openapi_field_v_ref =
        haskey(_openapi_object, "V_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["V_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_va_lim =
        _decode(MinMax, _required(_openapi_object, "Va_lim", "ESAC1A"), _openapi_validate)
    _openapi_field_vr_lim =
        _decode(MinMax, _required(_openapi_object, "Vr_lim", "ESAC1A"), _openapi_validate)
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "ESAC1A"), _openapi_validate)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "E_sat",
            "Ka",
            "Kc",
            "Kd",
            "Ke",
            "Kf",
            "Se",
            "Ta",
            "Tb",
            "Tc",
            "Te",
            "Tf",
            "Tr",
            "V_ref",
            "Va_lim",
            "Vr_lim",
            "id",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return ESAC1A(;
        e_sat=_openapi_field_e_sat,
        ka=_openapi_field_ka,
        kc=_openapi_field_kc,
        kd=_openapi_field_kd,
        ke=_openapi_field_ke,
        kf=_openapi_field_kf,
        se=_openapi_field_se,
        ta=_openapi_field_ta,
        tb=_openapi_field_tb,
        tc=_openapi_field_tc,
        te=_openapi_field_te,
        tf=_openapi_field_tf,
        tr=_openapi_field_tr,
        v_ref=_openapi_field_v_ref,
        va_lim=_openapi_field_va_lim,
        vr_lim=_openapi_field_vr_lim,
        id=_openapi_field_id,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::ESAC1A)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.e_sat isa Absent ||
        (_openapi_output["E_sat"] = _encode(_openapi_value.e_sat))
    _openapi_value.ka isa Absent || (_openapi_output["Ka"] = _encode(_openapi_value.ka))
    _openapi_value.kc isa Absent || (_openapi_output["Kc"] = _encode(_openapi_value.kc))
    _openapi_value.kd isa Absent || (_openapi_output["Kd"] = _encode(_openapi_value.kd))
    _openapi_value.ke isa Absent || (_openapi_output["Ke"] = _encode(_openapi_value.ke))
    _openapi_value.kf isa Absent || (_openapi_output["Kf"] = _encode(_openapi_value.kf))
    _openapi_value.se isa Absent || (_openapi_output["Se"] = _encode(_openapi_value.se))
    _openapi_value.ta isa Absent || (_openapi_output["Ta"] = _encode(_openapi_value.ta))
    _openapi_value.tb isa Absent || (_openapi_output["Tb"] = _encode(_openapi_value.tb))
    _openapi_value.tc isa Absent || (_openapi_output["Tc"] = _encode(_openapi_value.tc))
    _openapi_value.te isa Absent || (_openapi_output["Te"] = _encode(_openapi_value.te))
    _openapi_value.tf isa Absent || (_openapi_output["Tf"] = _encode(_openapi_value.tf))
    _openapi_value.tr isa Absent || (_openapi_output["Tr"] = _encode(_openapi_value.tr))
    _openapi_value.v_ref isa Absent ||
        (_openapi_output["V_ref"] = _encode(_openapi_value.v_ref))
    _openapi_value.va_lim isa Absent ||
        (_openapi_output["Va_lim"] = _encode(_openapi_value.va_lim))
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
            pointer="/components/schemas/ESAC1A",
        ),
        _openapi_output,
        "encoding ESAC1A";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::ESAC1A)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.e_sat isa Absent ||
        push!(_openapi_output, "E_sat" => _openapi_value.e_sat)
    _openapi_value.ka isa Absent || push!(_openapi_output, "Ka" => _openapi_value.ka)
    _openapi_value.kc isa Absent || push!(_openapi_output, "Kc" => _openapi_value.kc)
    _openapi_value.kd isa Absent || push!(_openapi_output, "Kd" => _openapi_value.kd)
    _openapi_value.ke isa Absent || push!(_openapi_output, "Ke" => _openapi_value.ke)
    _openapi_value.kf isa Absent || push!(_openapi_output, "Kf" => _openapi_value.kf)
    _openapi_value.se isa Absent || push!(_openapi_output, "Se" => _openapi_value.se)
    _openapi_value.ta isa Absent || push!(_openapi_output, "Ta" => _openapi_value.ta)
    _openapi_value.tb isa Absent || push!(_openapi_output, "Tb" => _openapi_value.tb)
    _openapi_value.tc isa Absent || push!(_openapi_output, "Tc" => _openapi_value.tc)
    _openapi_value.te isa Absent || push!(_openapi_output, "Te" => _openapi_value.te)
    _openapi_value.tf isa Absent || push!(_openapi_output, "Tf" => _openapi_value.tf)
    _openapi_value.tr isa Absent || push!(_openapi_output, "Tr" => _openapi_value.tr)
    _openapi_value.v_ref isa Absent ||
        push!(_openapi_output, "V_ref" => _openapi_value.v_ref)
    _openapi_value.va_lim isa Absent ||
        push!(_openapi_output, "Va_lim" => _openapi_value.va_lim)
    _openapi_value.vr_lim isa Absent ||
        push!(_openapi_output, "Vr_lim" => _openapi_value.vr_lim)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
