"""
    IEEET1

1968 IEEE type 1 excitation system model

  - `id`: Unique integer identifier for this component
  - `tr`: Voltage measurement time constant
  - `ka`: Amplifier gain
  - `ta`: Amplifier time constant
  - `vr_lim`: A pair of values bounding a quantity from below (`min`) and from above (`max`).
  - `ke`: Exciter constant related to self-excited field
  - `te`: Exciter time constant, integration rate associated with exciter control
  - `kf`: Excitation control system stabilizer gain
  - `tf`: Excitation control system stabilizer time constant
  - `switch`: Switch
  - `e_sat`: Exciter output voltage for saturation factor
  - `se`: Exciter saturation factor at exciter output voltage
  - `v_ref`: Reference voltage set-point
"""
Base.@kwdef struct IEEET1 <: APIModel
    id::Int64
    tr::Float64
    ka::Float64
    ta::Float64
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
_decode(::Type{IEEET1}, value) = _decode(IEEET1, value, true)
function _decode(::Type{IEEET1}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-2da63d7b98c428733453.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding IEEET1";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "IEEET1")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "IEEET1"), _openapi_validate)
    _openapi_field_tr =
        _decode(Float64, _required(_openapi_object, "Tr", "IEEET1"), _openapi_validate)
    _openapi_field_ka =
        _decode(Float64, _required(_openapi_object, "Ka", "IEEET1"), _openapi_validate)
    _openapi_field_ta =
        _decode(Float64, _required(_openapi_object, "Ta", "IEEET1"), _openapi_validate)
    _openapi_field_vr_lim =
        _decode(MinMax, _required(_openapi_object, "Vr_lim", "IEEET1"), _openapi_validate)
    _openapi_field_ke =
        _decode(Float64, _required(_openapi_object, "Ke", "IEEET1"), _openapi_validate)
    _openapi_field_te =
        _decode(Float64, _required(_openapi_object, "Te", "IEEET1"), _openapi_validate)
    _openapi_field_kf =
        _decode(Float64, _required(_openapi_object, "Kf", "IEEET1"), _openapi_validate)
    _openapi_field_tf =
        _decode(Float64, _required(_openapi_object, "Tf", "IEEET1"), _openapi_validate)
    _openapi_field_switch =
        _decode(Int64, _required(_openapi_object, "switch", "IEEET1"), _openapi_validate)
    _openapi_field_e_sat = _decode(
        Vector{Float64},
        _required(_openapi_object, "E_sat", "IEEET1"),
        _openapi_validate,
    )
    _openapi_field_se = _decode(
        Vector{Float64},
        _required(_openapi_object, "Se", "IEEET1"),
        _openapi_validate,
    )
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
            "Tr",
            "Ka",
            "Ta",
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
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return IEEET1(;
        id=_openapi_field_id,
        tr=_openapi_field_tr,
        ka=_openapi_field_ka,
        ta=_openapi_field_ta,
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
function _encode(_openapi_value::IEEET1)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.tr isa Absent || (_openapi_output["Tr"] = _encode(_openapi_value.tr))
    _openapi_value.ka isa Absent || (_openapi_output["Ka"] = _encode(_openapi_value.ka))
    _openapi_value.ta isa Absent || (_openapi_output["Ta"] = _encode(_openapi_value.ta))
    _openapi_value.vr_lim isa Absent ||
        (_openapi_output["Vr_lim"] = _encode(_openapi_value.vr_lim))
    _openapi_value.ke isa Absent || (_openapi_output["Ke"] = _encode(_openapi_value.ke))
    _openapi_value.te isa Absent || (_openapi_output["Te"] = _encode(_openapi_value.te))
    _openapi_value.kf isa Absent || (_openapi_output["Kf"] = _encode(_openapi_value.kf))
    _openapi_value.tf isa Absent || (_openapi_output["Tf"] = _encode(_openapi_value.tf))
    _openapi_value.switch isa Absent ||
        (_openapi_output["switch"] = _encode(_openapi_value.switch))
    _openapi_value.e_sat isa Absent ||
        (_openapi_output["E_sat"] = _encode(_openapi_value.e_sat))
    _openapi_value.se isa Absent || (_openapi_output["Se"] = _encode(_openapi_value.se))
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
            resource="https://openapi.invalid/schema/external-2da63d7b98c428733453.json",
            pointer="",
        ),
        _openapi_output,
        "encoding IEEET1";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::IEEET1)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.tr isa Absent || push!(_openapi_output, "Tr" => _openapi_value.tr)
    _openapi_value.ka isa Absent || push!(_openapi_output, "Ka" => _openapi_value.ka)
    _openapi_value.ta isa Absent || push!(_openapi_output, "Ta" => _openapi_value.ta)
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
