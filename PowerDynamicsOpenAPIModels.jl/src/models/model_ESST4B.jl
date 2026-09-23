"""
    ESST4B

In these excitation systems, voltage (and also current in compounded systems) is transformed to an appropriate level. Rectifiers, either controlled or non-controlled, provide the necessary direct current for the generator field. Parameters of IEEE Std 421.5 Type ST4B Excitacion System. ESST4B in PSSE and PSLF

  - `id`: Unique integer identifier for this component
  - `k_pr`: Regulator proportional gain
  - `k_ir`: Regulator integral gain
  - `vr_lim`: A pair of values bounding a quantity from below (`min`) and from above (`max`).
  - `ta`: Voltage regulator time constant
  - `k_pm`: Voltage regulator proportional gain output
  - `k_im`: Voltage regulator integral gain output
  - `vm_lim`: A pair of values bounding a quantity from below (`min`) and from above (`max`).
  - `kg`: Feedback gain constant of the inner loop field regulator
  - `kp`: Potential circuit (voltage) gain coefficient
  - `ki`: Compound circuit (current) gain coefficient
  - `vb_max`: Maximum available exciter voltage
  - `kc`: Rectifier loading factor proportional to commutating reactance
  - `xl`: Reactance associated with potential source
  - `thetap`: Potential circuit phase angle (degrees)
  - `v_ref`: Reference voltage set-point
"""
Base.@kwdef struct ESST4B <: APIModel
    id::Int64
    k_pr::Float64
    k_ir::Float64
    vr_lim::MinMax
    ta::Float64
    k_pm::Float64
    k_im::Float64
    vm_lim::MinMax
    kg::Float64
    kp::Float64
    ki::Float64
    vb_max::Float64
    kc::Float64
    xl::Float64
    thetap::Float64
    v_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ESST4B}, value) = _decode(ESST4B, value, true)
function _decode(::Type{ESST4B}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0e5a761f657281501d60.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding ESST4B";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ESST4B")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "ESST4B"), _openapi_validate)
    _openapi_field_k_pr =
        _decode(Float64, _required(_openapi_object, "K_pr", "ESST4B"), _openapi_validate)
    _openapi_field_k_ir =
        _decode(Float64, _required(_openapi_object, "K_ir", "ESST4B"), _openapi_validate)
    _openapi_field_vr_lim =
        _decode(MinMax, _required(_openapi_object, "Vr_lim", "ESST4B"), _openapi_validate)
    _openapi_field_ta =
        _decode(Float64, _required(_openapi_object, "Ta", "ESST4B"), _openapi_validate)
    _openapi_field_k_pm =
        _decode(Float64, _required(_openapi_object, "K_pm", "ESST4B"), _openapi_validate)
    _openapi_field_k_im =
        _decode(Float64, _required(_openapi_object, "K_im", "ESST4B"), _openapi_validate)
    _openapi_field_vm_lim =
        _decode(MinMax, _required(_openapi_object, "Vm_lim", "ESST4B"), _openapi_validate)
    _openapi_field_kg =
        _decode(Float64, _required(_openapi_object, "Kg", "ESST4B"), _openapi_validate)
    _openapi_field_kp =
        _decode(Float64, _required(_openapi_object, "Kp", "ESST4B"), _openapi_validate)
    _openapi_field_ki =
        _decode(Float64, _required(_openapi_object, "Ki", "ESST4B"), _openapi_validate)
    _openapi_field_vb_max =
        _decode(Float64, _required(_openapi_object, "VB_max", "ESST4B"), _openapi_validate)
    _openapi_field_kc =
        _decode(Float64, _required(_openapi_object, "Kc", "ESST4B"), _openapi_validate)
    _openapi_field_xl =
        _decode(Float64, _required(_openapi_object, "Xl", "ESST4B"), _openapi_validate)
    _openapi_field_thetap =
        _decode(Float64, _required(_openapi_object, "thetap", "ESST4B"), _openapi_validate)
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
            "K_pr",
            "K_ir",
            "Vr_lim",
            "Ta",
            "K_pm",
            "K_im",
            "Vm_lim",
            "Kg",
            "Kp",
            "Ki",
            "VB_max",
            "Kc",
            "Xl",
            "thetap",
            "V_ref",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return ESST4B(;
        id=_openapi_field_id,
        k_pr=_openapi_field_k_pr,
        k_ir=_openapi_field_k_ir,
        vr_lim=_openapi_field_vr_lim,
        ta=_openapi_field_ta,
        k_pm=_openapi_field_k_pm,
        k_im=_openapi_field_k_im,
        vm_lim=_openapi_field_vm_lim,
        kg=_openapi_field_kg,
        kp=_openapi_field_kp,
        ki=_openapi_field_ki,
        vb_max=_openapi_field_vb_max,
        kc=_openapi_field_kc,
        xl=_openapi_field_xl,
        thetap=_openapi_field_thetap,
        v_ref=_openapi_field_v_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::ESST4B)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.k_pr isa Absent ||
        (_openapi_output["K_pr"] = _encode(_openapi_value.k_pr))
    _openapi_value.k_ir isa Absent ||
        (_openapi_output["K_ir"] = _encode(_openapi_value.k_ir))
    _openapi_value.vr_lim isa Absent ||
        (_openapi_output["Vr_lim"] = _encode(_openapi_value.vr_lim))
    _openapi_value.ta isa Absent || (_openapi_output["Ta"] = _encode(_openapi_value.ta))
    _openapi_value.k_pm isa Absent ||
        (_openapi_output["K_pm"] = _encode(_openapi_value.k_pm))
    _openapi_value.k_im isa Absent ||
        (_openapi_output["K_im"] = _encode(_openapi_value.k_im))
    _openapi_value.vm_lim isa Absent ||
        (_openapi_output["Vm_lim"] = _encode(_openapi_value.vm_lim))
    _openapi_value.kg isa Absent || (_openapi_output["Kg"] = _encode(_openapi_value.kg))
    _openapi_value.kp isa Absent || (_openapi_output["Kp"] = _encode(_openapi_value.kp))
    _openapi_value.ki isa Absent || (_openapi_output["Ki"] = _encode(_openapi_value.ki))
    _openapi_value.vb_max isa Absent ||
        (_openapi_output["VB_max"] = _encode(_openapi_value.vb_max))
    _openapi_value.kc isa Absent || (_openapi_output["Kc"] = _encode(_openapi_value.kc))
    _openapi_value.xl isa Absent || (_openapi_output["Xl"] = _encode(_openapi_value.xl))
    _openapi_value.thetap isa Absent ||
        (_openapi_output["thetap"] = _encode(_openapi_value.thetap))
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
            resource="https://openapi.invalid/schema/external-0e5a761f657281501d60.json",
            pointer="",
        ),
        _openapi_output,
        "encoding ESST4B";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::ESST4B)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.k_pr isa Absent || push!(_openapi_output, "K_pr" => _openapi_value.k_pr)
    _openapi_value.k_ir isa Absent || push!(_openapi_output, "K_ir" => _openapi_value.k_ir)
    _openapi_value.vr_lim isa Absent ||
        push!(_openapi_output, "Vr_lim" => _openapi_value.vr_lim)
    _openapi_value.ta isa Absent || push!(_openapi_output, "Ta" => _openapi_value.ta)
    _openapi_value.k_pm isa Absent || push!(_openapi_output, "K_pm" => _openapi_value.k_pm)
    _openapi_value.k_im isa Absent || push!(_openapi_output, "K_im" => _openapi_value.k_im)
    _openapi_value.vm_lim isa Absent ||
        push!(_openapi_output, "Vm_lim" => _openapi_value.vm_lim)
    _openapi_value.kg isa Absent || push!(_openapi_output, "Kg" => _openapi_value.kg)
    _openapi_value.kp isa Absent || push!(_openapi_output, "Kp" => _openapi_value.kp)
    _openapi_value.ki isa Absent || push!(_openapi_output, "Ki" => _openapi_value.ki)
    _openapi_value.vb_max isa Absent ||
        push!(_openapi_output, "VB_max" => _openapi_value.vb_max)
    _openapi_value.kc isa Absent || push!(_openapi_output, "Kc" => _openapi_value.kc)
    _openapi_value.xl isa Absent || push!(_openapi_output, "Xl" => _openapi_value.xl)
    _openapi_value.thetap isa Absent ||
        push!(_openapi_output, "thetap" => _openapi_value.thetap)
    _openapi_value.v_ref isa Absent ||
        push!(_openapi_output, "V_ref" => _openapi_value.v_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
