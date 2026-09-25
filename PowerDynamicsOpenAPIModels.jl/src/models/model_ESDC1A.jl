"""
    ESDC1A

Self-excited shunt fields with the voltage regulator operating in a mode commonly termed buck-boost. Parameters of IEEE Std 421.5 Type DC1A Excitacion System. This model corresponds to ESDC1A in PSSE and PSLF

  - `id`: Unique integer identifier for this component
  - `tr`: Voltage measurement time constant
  - `ka`: Amplifier gain
  - `ta`: Amplifier time constant
  - `tb`: Regulator input time constant
  - `tc`: Regulator input time constant
  - `vr_lim`: A pair of values bounding a quantity from below (`min`) and from above (`max`).
  - `ke`: Exciter constant related to self-excited field
  - `te`: Exciter time constant, integration rate associated with exciter control
  - `kf`: Excitation control system stabilizer gain
  - `tf`: Excitation control system stabilizer time constant
  - `switch`: switch
  - `e_sat`: Exciter output voltage for saturation factor
  - `se`: Exciter saturation factor at exciter output voltage
  - `v_ref`: Reference voltage set-point
"""
Base.@kwdef struct ESDC1A <: APIModel
    id::Int64
    tr::Float64
    ka::Float64
    ta::Float64
    tb::Float64
    tc::Float64
    vr_lim::MinMax
    ke::Float64
    te::Float64
    kf::Float64
    tf::Float64
    switch::Int64
    e_sat::Vector{Float64}
    se::Vector{Float64}
    v_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ESDC1A}, value) = _decode(ESDC1A, value, true)
function _decode(::Type{ESDC1A}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-2802e46827a07fd99143.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding ESDC1A";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ESDC1A")
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "ESDC1A"), false)
    _openapi_field_tr = _decode(Float64, _required(_openapi_object, "Tr", "ESDC1A"), false)
    _openapi_field_ka = _decode(Float64, _required(_openapi_object, "Ka", "ESDC1A"), false)
    _openapi_field_ta = _decode(Float64, _required(_openapi_object, "Ta", "ESDC1A"), false)
    _openapi_field_tb = _decode(Float64, _required(_openapi_object, "Tb", "ESDC1A"), false)
    _openapi_field_tc = _decode(Float64, _required(_openapi_object, "Tc", "ESDC1A"), false)
    _openapi_field_vr_lim =
        _decode(MinMax, _required(_openapi_object, "Vr_lim", "ESDC1A"), false)
    _openapi_field_ke = _decode(Float64, _required(_openapi_object, "Ke", "ESDC1A"), false)
    _openapi_field_te = _decode(Float64, _required(_openapi_object, "Te", "ESDC1A"), false)
    _openapi_field_kf = _decode(Float64, _required(_openapi_object, "Kf", "ESDC1A"), false)
    _openapi_field_tf = _decode(Float64, _required(_openapi_object, "Tf", "ESDC1A"), false)
    _openapi_field_switch =
        _decode(Int64, _required(_openapi_object, "switch", "ESDC1A"), false)
    _openapi_field_e_sat =
        _decode(Vector{Float64}, _required(_openapi_object, "E_sat", "ESDC1A"), false)
    _openapi_field_se =
        _decode(Vector{Float64}, _required(_openapi_object, "Se", "ESDC1A"), false)
    _openapi_field_v_ref =
        haskey(_openapi_object, "V_ref") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["V_ref"], false) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "Tr",
            "Ka",
            "Ta",
            "Tb",
            "Tc",
            "Vr_lim",
            "Ke",
            "Te",
            "Kf",
            "Tf",
            "switch",
            "E_sat",
            "Se",
            "V_ref",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return ESDC1A(;
        id=_openapi_field_id,
        tr=_openapi_field_tr,
        ka=_openapi_field_ka,
        ta=_openapi_field_ta,
        tb=_openapi_field_tb,
        tc=_openapi_field_tc,
        vr_lim=_openapi_field_vr_lim,
        ke=_openapi_field_ke,
        te=_openapi_field_te,
        kf=_openapi_field_kf,
        tf=_openapi_field_tf,
        switch=_openapi_field_switch,
        e_sat=_openapi_field_e_sat,
        se=_openapi_field_se,
        v_ref=_openapi_field_v_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::ESDC1A)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.tr isa Absent ||
        (_openapi_output["Tr"] = _encode_unvalidated(_openapi_value.tr))
    _openapi_value.ka isa Absent ||
        (_openapi_output["Ka"] = _encode_unvalidated(_openapi_value.ka))
    _openapi_value.ta isa Absent ||
        (_openapi_output["Ta"] = _encode_unvalidated(_openapi_value.ta))
    _openapi_value.tb isa Absent ||
        (_openapi_output["Tb"] = _encode_unvalidated(_openapi_value.tb))
    _openapi_value.tc isa Absent ||
        (_openapi_output["Tc"] = _encode_unvalidated(_openapi_value.tc))
    _openapi_value.vr_lim isa Absent ||
        (_openapi_output["Vr_lim"] = _encode_unvalidated(_openapi_value.vr_lim))
    _openapi_value.ke isa Absent ||
        (_openapi_output["Ke"] = _encode_unvalidated(_openapi_value.ke))
    _openapi_value.te isa Absent ||
        (_openapi_output["Te"] = _encode_unvalidated(_openapi_value.te))
    _openapi_value.kf isa Absent ||
        (_openapi_output["Kf"] = _encode_unvalidated(_openapi_value.kf))
    _openapi_value.tf isa Absent ||
        (_openapi_output["Tf"] = _encode_unvalidated(_openapi_value.tf))
    _openapi_value.switch isa Absent ||
        (_openapi_output["switch"] = _encode_unvalidated(_openapi_value.switch))
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
_encode(_openapi_value::ESDC1A) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-2802e46827a07fd99143.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding ESDC1A";
    direction=:neutral,
)

function _form_fields(_openapi_value::ESDC1A)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.tr isa Absent || push!(_openapi_output, "Tr" => _openapi_value.tr)
    _openapi_value.ka isa Absent || push!(_openapi_output, "Ka" => _openapi_value.ka)
    _openapi_value.ta isa Absent || push!(_openapi_output, "Ta" => _openapi_value.ta)
    _openapi_value.tb isa Absent || push!(_openapi_output, "Tb" => _openapi_value.tb)
    _openapi_value.tc isa Absent || push!(_openapi_output, "Tc" => _openapi_value.tc)
    _openapi_value.vr_lim isa Absent ||
        push!(_openapi_output, "Vr_lim" => _openapi_value.vr_lim)
    _openapi_value.ke isa Absent || push!(_openapi_output, "Ke" => _openapi_value.ke)
    _openapi_value.te isa Absent || push!(_openapi_output, "Te" => _openapi_value.te)
    _openapi_value.kf isa Absent || push!(_openapi_output, "Kf" => _openapi_value.kf)
    _openapi_value.tf isa Absent || push!(_openapi_output, "Tf" => _openapi_value.tf)
    _openapi_value.switch isa Absent ||
        push!(_openapi_output, "switch" => _openapi_value.switch)
    _openapi_value.e_sat isa Absent ||
        push!(_openapi_output, "E_sat" => _openapi_value.e_sat)
    _openapi_value.se isa Absent || push!(_openapi_output, "Se" => _openapi_value.se)
    _openapi_value.v_ref isa Absent ||
        push!(_openapi_output, "V_ref" => _openapi_value.v_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
