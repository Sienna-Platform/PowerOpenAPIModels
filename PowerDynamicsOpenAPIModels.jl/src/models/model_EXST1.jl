"""
    EXST1

IEEE Type ST1 Excitation System (PTI version)

  - `ka`: Amplifier gain
  - `kc`: Current field constant limiter multiplier
  - `kf`: Excitation control system stabilizer gain
  - `ta`: Amplifier time constant
  - `tb`: Denominator lead-lag (lag) time constant
  - `tc`: Numerator lead-lag (lead) time constant
  - `tf`: Excitation control system stabilizer time constant
  - `tr`: Voltage measurement time constant
  - `v_ref`: Reference voltage set-point
  - `vi_lim`: Voltage input limits
  - `vr_lim`: Voltage regulator limits (regulator output)
  - `id`: Unique integer identifier for this component
"""
Base.@kwdef struct EXST1 <: APIModel
    ka::Float64
    kc::Float64
    kf::Float64
    ta::Float64
    tb::Float64
    tc::Float64
    tf::Float64
    tr::Float64
    v_ref::Union{Absent, Float64, Nothing} = ABSENT
    vi_lim::MinMax
    vr_lim::MinMax
    id::Int64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{EXST1}, value) = _decode(EXST1, value, true)
function _decode(::Type{EXST1}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-d5d2d2b15ebff194ab18.json",
            pointer="/components/schemas/EXST1",
        ),
        _openapi_raw,
        "decoding EXST1";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "EXST1")
    _openapi_field_ka =
        _decode(Float64, _required(_openapi_object, "Ka", "EXST1"), _openapi_validate)
    _openapi_field_kc =
        _decode(Float64, _required(_openapi_object, "Kc", "EXST1"), _openapi_validate)
    _openapi_field_kf =
        _decode(Float64, _required(_openapi_object, "Kf", "EXST1"), _openapi_validate)
    _openapi_field_ta =
        _decode(Float64, _required(_openapi_object, "Ta", "EXST1"), _openapi_validate)
    _openapi_field_tb =
        _decode(Float64, _required(_openapi_object, "Tb", "EXST1"), _openapi_validate)
    _openapi_field_tc =
        _decode(Float64, _required(_openapi_object, "Tc", "EXST1"), _openapi_validate)
    _openapi_field_tf =
        _decode(Float64, _required(_openapi_object, "Tf", "EXST1"), _openapi_validate)
    _openapi_field_tr =
        _decode(Float64, _required(_openapi_object, "Tr", "EXST1"), _openapi_validate)
    _openapi_field_v_ref =
        haskey(_openapi_object, "V_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["V_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_vi_lim =
        _decode(MinMax, _required(_openapi_object, "Vi_lim", "EXST1"), _openapi_validate)
    _openapi_field_vr_lim =
        _decode(MinMax, _required(_openapi_object, "Vr_lim", "EXST1"), _openapi_validate)
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "EXST1"), _openapi_validate)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "Ka",
            "Kc",
            "Kf",
            "Ta",
            "Tb",
            "Tc",
            "Tf",
            "Tr",
            "V_ref",
            "Vi_lim",
            "Vr_lim",
            "id",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return EXST1(;
        ka=_openapi_field_ka,
        kc=_openapi_field_kc,
        kf=_openapi_field_kf,
        ta=_openapi_field_ta,
        tb=_openapi_field_tb,
        tc=_openapi_field_tc,
        tf=_openapi_field_tf,
        tr=_openapi_field_tr,
        v_ref=_openapi_field_v_ref,
        vi_lim=_openapi_field_vi_lim,
        vr_lim=_openapi_field_vr_lim,
        id=_openapi_field_id,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::EXST1)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.ka isa Absent || (_openapi_output["Ka"] = _encode(_openapi_value.ka))
    _openapi_value.kc isa Absent || (_openapi_output["Kc"] = _encode(_openapi_value.kc))
    _openapi_value.kf isa Absent || (_openapi_output["Kf"] = _encode(_openapi_value.kf))
    _openapi_value.ta isa Absent || (_openapi_output["Ta"] = _encode(_openapi_value.ta))
    _openapi_value.tb isa Absent || (_openapi_output["Tb"] = _encode(_openapi_value.tb))
    _openapi_value.tc isa Absent || (_openapi_output["Tc"] = _encode(_openapi_value.tc))
    _openapi_value.tf isa Absent || (_openapi_output["Tf"] = _encode(_openapi_value.tf))
    _openapi_value.tr isa Absent || (_openapi_output["Tr"] = _encode(_openapi_value.tr))
    _openapi_value.v_ref isa Absent ||
        (_openapi_output["V_ref"] = _encode(_openapi_value.v_ref))
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
            pointer="/components/schemas/EXST1",
        ),
        _openapi_output,
        "encoding EXST1";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::EXST1)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.ka isa Absent || push!(_openapi_output, "Ka" => _openapi_value.ka)
    _openapi_value.kc isa Absent || push!(_openapi_output, "Kc" => _openapi_value.kc)
    _openapi_value.kf isa Absent || push!(_openapi_output, "Kf" => _openapi_value.kf)
    _openapi_value.ta isa Absent || push!(_openapi_output, "Ta" => _openapi_value.ta)
    _openapi_value.tb isa Absent || push!(_openapi_output, "Tb" => _openapi_value.tb)
    _openapi_value.tc isa Absent || push!(_openapi_output, "Tc" => _openapi_value.tc)
    _openapi_value.tf isa Absent || push!(_openapi_output, "Tf" => _openapi_value.tf)
    _openapi_value.tr isa Absent || push!(_openapi_output, "Tr" => _openapi_value.tr)
    _openapi_value.v_ref isa Absent ||
        push!(_openapi_output, "V_ref" => _openapi_value.v_ref)
    _openapi_value.vi_lim isa Absent ||
        push!(_openapi_output, "Vi_lim" => _openapi_value.vi_lim)
    _openapi_value.vr_lim isa Absent ||
        push!(_openapi_output, "Vr_lim" => _openapi_value.vr_lim)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
