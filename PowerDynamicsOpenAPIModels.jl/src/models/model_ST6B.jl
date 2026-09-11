"""
    ST6B

In these excitation systems, voltage (and also current in compounded systems) is transformed to an appropriate level. Rectifiers, either controlled or non-controlled, provide the necessary direct current for the generator field. Parameters of IEEE Std 421.5 Type ST6B Excitacion System. ST6B in PSSE and PSLF

  - `i_lr`: Exciter current limiter reference
  - `k_ci`: Exciter output current limit adjustment gain
  - `k_da`: Regulator derivative gain
  - `k_ff`: Pre-control gain of the inner loop field regulator
  - `k_ia`: Regulator integral gain
  - `k_lr`: Exciter output current limiter gain
  - `k_m`: Forward gain of the inner loop field regulator
  - `k_pa`: Regulator proportional gain
  - `kg`: Feedback gain constant of the inner loop field regulator
  - `oel_flag`: OEL Flag for ST6B: 1: before HV gate, 2: after HV gate
  - `t_da`: Voltage regulator derivative channel time constant
  - `tg`: Feedback time constant of the inner loop field voltage regulator
  - `tr`: Regulator input filter time constant
  - `v_ref`: Reference voltage set-point
  - `va_lim`: Regulator output limits
  - `vr_lim`: Voltage regulator limits
  - `id`: Unique integer identifier for this component
"""
Base.@kwdef struct ST6B <: APIModel
    i_lr::Float64
    k_ci::Float64
    k_da::Float64
    k_ff::Float64
    k_ia::Float64
    k_lr::Float64
    k_m::Float64
    k_pa::Float64
    kg::Float64
    oel_flag::Int64
    t_da::Float64
    tg::Float64
    tr::Float64
    v_ref::Union{Absent, Float64, Nothing} = ABSENT
    va_lim::MinMax
    vr_lim::MinMax
    id::Int64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ST6B}, value) = _decode(ST6B, value, true)
function _decode(::Type{ST6B}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-d5d2d2b15ebff194ab18.json",
            pointer="/components/schemas/ST6B",
        ),
        _openapi_raw,
        "decoding ST6B";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ST6B")
    _openapi_field_i_lr =
        _decode(Float64, _required(_openapi_object, "I_lr", "ST6B"), _openapi_validate)
    _openapi_field_k_ci =
        _decode(Float64, _required(_openapi_object, "K_ci", "ST6B"), _openapi_validate)
    _openapi_field_k_da =
        _decode(Float64, _required(_openapi_object, "K_da", "ST6B"), _openapi_validate)
    _openapi_field_k_ff =
        _decode(Float64, _required(_openapi_object, "K_ff", "ST6B"), _openapi_validate)
    _openapi_field_k_ia =
        _decode(Float64, _required(_openapi_object, "K_ia", "ST6B"), _openapi_validate)
    _openapi_field_k_lr =
        _decode(Float64, _required(_openapi_object, "K_lr", "ST6B"), _openapi_validate)
    _openapi_field_k_m =
        _decode(Float64, _required(_openapi_object, "K_m", "ST6B"), _openapi_validate)
    _openapi_field_k_pa =
        _decode(Float64, _required(_openapi_object, "K_pa", "ST6B"), _openapi_validate)
    _openapi_field_kg =
        _decode(Float64, _required(_openapi_object, "Kg", "ST6B"), _openapi_validate)
    _openapi_field_oel_flag =
        _decode(Int64, _required(_openapi_object, "OEL_Flag", "ST6B"), _openapi_validate)
    _openapi_field_t_da =
        _decode(Float64, _required(_openapi_object, "T_da", "ST6B"), _openapi_validate)
    _openapi_field_tg =
        _decode(Float64, _required(_openapi_object, "Tg", "ST6B"), _openapi_validate)
    _openapi_field_tr =
        _decode(Float64, _required(_openapi_object, "Tr", "ST6B"), _openapi_validate)
    _openapi_field_v_ref =
        haskey(_openapi_object, "V_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["V_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_va_lim =
        _decode(MinMax, _required(_openapi_object, "Va_lim", "ST6B"), _openapi_validate)
    _openapi_field_vr_lim =
        _decode(MinMax, _required(_openapi_object, "Vr_lim", "ST6B"), _openapi_validate)
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "ST6B"), _openapi_validate)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "I_lr",
            "K_ci",
            "K_da",
            "K_ff",
            "K_ia",
            "K_lr",
            "K_m",
            "K_pa",
            "Kg",
            "OEL_Flag",
            "T_da",
            "Tg",
            "Tr",
            "V_ref",
            "Va_lim",
            "Vr_lim",
            "id",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return ST6B(;
        i_lr=_openapi_field_i_lr,
        k_ci=_openapi_field_k_ci,
        k_da=_openapi_field_k_da,
        k_ff=_openapi_field_k_ff,
        k_ia=_openapi_field_k_ia,
        k_lr=_openapi_field_k_lr,
        k_m=_openapi_field_k_m,
        k_pa=_openapi_field_k_pa,
        kg=_openapi_field_kg,
        oel_flag=_openapi_field_oel_flag,
        t_da=_openapi_field_t_da,
        tg=_openapi_field_tg,
        tr=_openapi_field_tr,
        v_ref=_openapi_field_v_ref,
        va_lim=_openapi_field_va_lim,
        vr_lim=_openapi_field_vr_lim,
        id=_openapi_field_id,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::ST6B)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.i_lr isa Absent ||
        (_openapi_output["I_lr"] = _encode(_openapi_value.i_lr))
    _openapi_value.k_ci isa Absent ||
        (_openapi_output["K_ci"] = _encode(_openapi_value.k_ci))
    _openapi_value.k_da isa Absent ||
        (_openapi_output["K_da"] = _encode(_openapi_value.k_da))
    _openapi_value.k_ff isa Absent ||
        (_openapi_output["K_ff"] = _encode(_openapi_value.k_ff))
    _openapi_value.k_ia isa Absent ||
        (_openapi_output["K_ia"] = _encode(_openapi_value.k_ia))
    _openapi_value.k_lr isa Absent ||
        (_openapi_output["K_lr"] = _encode(_openapi_value.k_lr))
    _openapi_value.k_m isa Absent || (_openapi_output["K_m"] = _encode(_openapi_value.k_m))
    _openapi_value.k_pa isa Absent ||
        (_openapi_output["K_pa"] = _encode(_openapi_value.k_pa))
    _openapi_value.kg isa Absent || (_openapi_output["Kg"] = _encode(_openapi_value.kg))
    _openapi_value.oel_flag isa Absent ||
        (_openapi_output["OEL_Flag"] = _encode(_openapi_value.oel_flag))
    _openapi_value.t_da isa Absent ||
        (_openapi_output["T_da"] = _encode(_openapi_value.t_da))
    _openapi_value.tg isa Absent || (_openapi_output["Tg"] = _encode(_openapi_value.tg))
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
            pointer="/components/schemas/ST6B",
        ),
        _openapi_output,
        "encoding ST6B";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::ST6B)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.i_lr isa Absent || push!(_openapi_output, "I_lr" => _openapi_value.i_lr)
    _openapi_value.k_ci isa Absent || push!(_openapi_output, "K_ci" => _openapi_value.k_ci)
    _openapi_value.k_da isa Absent || push!(_openapi_output, "K_da" => _openapi_value.k_da)
    _openapi_value.k_ff isa Absent || push!(_openapi_output, "K_ff" => _openapi_value.k_ff)
    _openapi_value.k_ia isa Absent || push!(_openapi_output, "K_ia" => _openapi_value.k_ia)
    _openapi_value.k_lr isa Absent || push!(_openapi_output, "K_lr" => _openapi_value.k_lr)
    _openapi_value.k_m isa Absent || push!(_openapi_output, "K_m" => _openapi_value.k_m)
    _openapi_value.k_pa isa Absent || push!(_openapi_output, "K_pa" => _openapi_value.k_pa)
    _openapi_value.kg isa Absent || push!(_openapi_output, "Kg" => _openapi_value.kg)
    _openapi_value.oel_flag isa Absent ||
        push!(_openapi_output, "OEL_Flag" => _openapi_value.oel_flag)
    _openapi_value.t_da isa Absent || push!(_openapi_output, "T_da" => _openapi_value.t_da)
    _openapi_value.tg isa Absent || push!(_openapi_output, "Tg" => _openapi_value.tg)
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
