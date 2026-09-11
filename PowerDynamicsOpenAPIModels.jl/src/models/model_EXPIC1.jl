"""
    EXPIC1

Generic Proportional/Integral Excitation System

  - `e_sat`: Exciter output voltage for saturation factor
  - `efd_lim`: Field voltage regulator limits (regulator output)
  - `ka`: Voltage regulator gain
  - `kc`: Exciter regulator factor
  - `ke`: Exciter constant
  - `kf`: Rate feedback excitation system stabilizer gain
  - `kp`: Potential source gain
  - `se`: Exciter saturation factor at exciter output voltage
  - `ta`: Voltage regulator time constant
  - `ta_2`: Voltage regulator time constant
  - `ta_3`: Voltage regulator time constant
  - `ta_4`: Voltage regulator time constant
  - `te`: Exciter time constant
  - `tf_1`: Rate feedback time constant
  - `tf_2`: Rate feedback time constant
  - `tr`: Regulator input filter time constant
  - `v_ref`: Reference voltage set-point
  - `va_lim`: Limits for pi controller
  - `vr_lim`: Voltage regulator limits (regulator output)
  - `id`: Unique integer identifier for this component
"""
Base.@kwdef struct EXPIC1 <: APIModel
    e_sat::Vector{Float64}
    efd_lim::MinMax
    ka::Float64
    kc::Float64
    ke::Float64
    kf::Float64
    kp::Float64
    se::Vector{Float64}
    ta::Float64
    ta_2::Float64
    ta_3::Float64
    ta_4::Float64
    te::Float64
    tf_1::Float64
    tf_2::Float64
    tr::Float64
    v_ref::Union{Absent, Float64, Nothing} = ABSENT
    va_lim::MinMax
    vr_lim::MinMax
    id::Int64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{EXPIC1}, value) = _decode(EXPIC1, value, true)
function _decode(::Type{EXPIC1}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-d5d2d2b15ebff194ab18.json",
            pointer="/components/schemas/EXPIC1",
        ),
        _openapi_raw,
        "decoding EXPIC1";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "EXPIC1")
    _openapi_field_e_sat = _decode(
        Vector{Float64},
        _required(_openapi_object, "E_sat", "EXPIC1"),
        _openapi_validate,
    )
    _openapi_field_efd_lim =
        _decode(MinMax, _required(_openapi_object, "Efd_lim", "EXPIC1"), _openapi_validate)
    _openapi_field_ka =
        _decode(Float64, _required(_openapi_object, "Ka", "EXPIC1"), _openapi_validate)
    _openapi_field_kc =
        _decode(Float64, _required(_openapi_object, "Kc", "EXPIC1"), _openapi_validate)
    _openapi_field_ke =
        _decode(Float64, _required(_openapi_object, "Ke", "EXPIC1"), _openapi_validate)
    _openapi_field_kf =
        _decode(Float64, _required(_openapi_object, "Kf", "EXPIC1"), _openapi_validate)
    _openapi_field_kp =
        _decode(Float64, _required(_openapi_object, "Kp", "EXPIC1"), _openapi_validate)
    _openapi_field_se = _decode(
        Vector{Float64},
        _required(_openapi_object, "Se", "EXPIC1"),
        _openapi_validate,
    )
    _openapi_field_ta =
        _decode(Float64, _required(_openapi_object, "Ta", "EXPIC1"), _openapi_validate)
    _openapi_field_ta_2 =
        _decode(Float64, _required(_openapi_object, "Ta_2", "EXPIC1"), _openapi_validate)
    _openapi_field_ta_3 =
        _decode(Float64, _required(_openapi_object, "Ta_3", "EXPIC1"), _openapi_validate)
    _openapi_field_ta_4 =
        _decode(Float64, _required(_openapi_object, "Ta_4", "EXPIC1"), _openapi_validate)
    _openapi_field_te =
        _decode(Float64, _required(_openapi_object, "Te", "EXPIC1"), _openapi_validate)
    _openapi_field_tf_1 =
        _decode(Float64, _required(_openapi_object, "Tf_1", "EXPIC1"), _openapi_validate)
    _openapi_field_tf_2 =
        _decode(Float64, _required(_openapi_object, "Tf_2", "EXPIC1"), _openapi_validate)
    _openapi_field_tr =
        _decode(Float64, _required(_openapi_object, "Tr", "EXPIC1"), _openapi_validate)
    _openapi_field_v_ref =
        haskey(_openapi_object, "V_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["V_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_va_lim =
        _decode(MinMax, _required(_openapi_object, "Va_lim", "EXPIC1"), _openapi_validate)
    _openapi_field_vr_lim =
        _decode(MinMax, _required(_openapi_object, "Vr_lim", "EXPIC1"), _openapi_validate)
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "EXPIC1"), _openapi_validate)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "E_sat",
            "Efd_lim",
            "Ka",
            "Kc",
            "Ke",
            "Kf",
            "Kp",
            "Se",
            "Ta",
            "Ta_2",
            "Ta_3",
            "Ta_4",
            "Te",
            "Tf_1",
            "Tf_2",
            "Tr",
            "V_ref",
            "Va_lim",
            "Vr_lim",
            "id",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return EXPIC1(;
        e_sat=_openapi_field_e_sat,
        efd_lim=_openapi_field_efd_lim,
        ka=_openapi_field_ka,
        kc=_openapi_field_kc,
        ke=_openapi_field_ke,
        kf=_openapi_field_kf,
        kp=_openapi_field_kp,
        se=_openapi_field_se,
        ta=_openapi_field_ta,
        ta_2=_openapi_field_ta_2,
        ta_3=_openapi_field_ta_3,
        ta_4=_openapi_field_ta_4,
        te=_openapi_field_te,
        tf_1=_openapi_field_tf_1,
        tf_2=_openapi_field_tf_2,
        tr=_openapi_field_tr,
        v_ref=_openapi_field_v_ref,
        va_lim=_openapi_field_va_lim,
        vr_lim=_openapi_field_vr_lim,
        id=_openapi_field_id,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::EXPIC1)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.e_sat isa Absent ||
        (_openapi_output["E_sat"] = _encode(_openapi_value.e_sat))
    _openapi_value.efd_lim isa Absent ||
        (_openapi_output["Efd_lim"] = _encode(_openapi_value.efd_lim))
    _openapi_value.ka isa Absent || (_openapi_output["Ka"] = _encode(_openapi_value.ka))
    _openapi_value.kc isa Absent || (_openapi_output["Kc"] = _encode(_openapi_value.kc))
    _openapi_value.ke isa Absent || (_openapi_output["Ke"] = _encode(_openapi_value.ke))
    _openapi_value.kf isa Absent || (_openapi_output["Kf"] = _encode(_openapi_value.kf))
    _openapi_value.kp isa Absent || (_openapi_output["Kp"] = _encode(_openapi_value.kp))
    _openapi_value.se isa Absent || (_openapi_output["Se"] = _encode(_openapi_value.se))
    _openapi_value.ta isa Absent || (_openapi_output["Ta"] = _encode(_openapi_value.ta))
    _openapi_value.ta_2 isa Absent ||
        (_openapi_output["Ta_2"] = _encode(_openapi_value.ta_2))
    _openapi_value.ta_3 isa Absent ||
        (_openapi_output["Ta_3"] = _encode(_openapi_value.ta_3))
    _openapi_value.ta_4 isa Absent ||
        (_openapi_output["Ta_4"] = _encode(_openapi_value.ta_4))
    _openapi_value.te isa Absent || (_openapi_output["Te"] = _encode(_openapi_value.te))
    _openapi_value.tf_1 isa Absent ||
        (_openapi_output["Tf_1"] = _encode(_openapi_value.tf_1))
    _openapi_value.tf_2 isa Absent ||
        (_openapi_output["Tf_2"] = _encode(_openapi_value.tf_2))
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
            pointer="/components/schemas/EXPIC1",
        ),
        _openapi_output,
        "encoding EXPIC1";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::EXPIC1)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.e_sat isa Absent ||
        push!(_openapi_output, "E_sat" => _openapi_value.e_sat)
    _openapi_value.efd_lim isa Absent ||
        push!(_openapi_output, "Efd_lim" => _openapi_value.efd_lim)
    _openapi_value.ka isa Absent || push!(_openapi_output, "Ka" => _openapi_value.ka)
    _openapi_value.kc isa Absent || push!(_openapi_output, "Kc" => _openapi_value.kc)
    _openapi_value.ke isa Absent || push!(_openapi_output, "Ke" => _openapi_value.ke)
    _openapi_value.kf isa Absent || push!(_openapi_output, "Kf" => _openapi_value.kf)
    _openapi_value.kp isa Absent || push!(_openapi_output, "Kp" => _openapi_value.kp)
    _openapi_value.se isa Absent || push!(_openapi_output, "Se" => _openapi_value.se)
    _openapi_value.ta isa Absent || push!(_openapi_output, "Ta" => _openapi_value.ta)
    _openapi_value.ta_2 isa Absent || push!(_openapi_output, "Ta_2" => _openapi_value.ta_2)
    _openapi_value.ta_3 isa Absent || push!(_openapi_output, "Ta_3" => _openapi_value.ta_3)
    _openapi_value.ta_4 isa Absent || push!(_openapi_output, "Ta_4" => _openapi_value.ta_4)
    _openapi_value.te isa Absent || push!(_openapi_output, "Te" => _openapi_value.te)
    _openapi_value.tf_1 isa Absent || push!(_openapi_output, "Tf_1" => _openapi_value.tf_1)
    _openapi_value.tf_2 isa Absent || push!(_openapi_output, "Tf_2" => _openapi_value.tf_2)
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
