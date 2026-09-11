"""
    PSS2C

IEEE 421.5 2016 PSS2C IEEE Dual-Input Stabilizer Model

  - `ks1`: Gain before lead-lag blocks
  - `ks2`: Gain for low-pass filter for second input
  - `ks3`: Gain for second input
  - `m_rtf`: M parameter for ramp tracking filter
  - `n_rtf`: N parameter for ramp tracking filter
  - `pss_hysteresis_param`: PSS output hysteresis parameters (PSSOFF, PSSON)
  - `t1`: Time constant for first lead-lag block
  - `t10`: Time constant for third lead-lag block
  - `t11`: Time constant for third lead-lag block
  - `t12`: Time constant for fourth lead-lag block
  - `t13`: Time constant for fourth lead-lag block
  - `t2`: Time constant for first lead-lag block
  - `t3`: Time constant for second lead-lag block
  - `t4`: Time constant for second lead-lag block
  - `t6`: Time constant for low-pass filter for first input
  - `t7`: Time constant for low-pass filter for second input
  - `t8`: Time constant for ramp tracking filter
  - `t9`: Time constant for ramp tracking filter
  - `tcomp`: Time measured with compensated frequency
  - `tw1`: Time constant for first washout filter for first input
  - `tw2`: Time constant for second washout filter for first input
  - `tw3`: Time constant for first washout filter for second input
  - `tw4`: Time constant for second washout filter for second input
  - `vs1_lim`: First input limits (Vs1_min, Vs1_max)
  - `vs2_lim`: Second input limits (Vs2_min, Vs2_max)
  - `vst_lim`: PSS output limits (Vst_min, Vst_max)
  - `xcomp`: Stator leakage reactance
  - `hysteresis_binary_logic`: Hysteresis memory variable
  - `id`: Unique integer identifier for this component
  - `input_code_1`: First input code for stabilizer
  - `input_code_2`: Second input code for stabilizer
  - `remote_bus_control_1`: First input remote bus identification number for control. 0 identifies the local bus connected to this component
  - `remote_bus_control_2`: Second input remote bus identification number for control. 0 identifies the local bus connected to this component
"""
Base.@kwdef struct PSS2C <: APIModel
    ks1::Float64
    ks2::Float64
    ks3::Float64
    m_rtf::Int64
    n_rtf::Int64
    pss_hysteresis_param::Vector{Float64}
    t1::Float64
    t10::Float64
    t11::Float64
    t12::Float64
    t13::Float64
    t2::Float64
    t3::Float64
    t4::Float64
    t6::Float64
    t7::Float64
    t8::Float64
    t9::Float64
    tcomp::Float64
    tw1::Float64
    tw2::Float64
    tw3::Float64
    tw4::Float64
    vs1_lim::Vector{Float64}
    vs2_lim::Vector{Float64}
    vst_lim::Vector{Float64}
    xcomp::Float64
    hysteresis_binary_logic::Union{Absent, Int64, Nothing} = ABSENT
    id::Int64
    input_code_1::Int64
    input_code_2::Int64
    remote_bus_control_1::Int64
    remote_bus_control_2::Int64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{PSS2C}, value) = _decode(PSS2C, value, true)
function _decode(::Type{PSS2C}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-d5d2d2b15ebff194ab18.json",
            pointer="/components/schemas/PSS2C",
        ),
        _openapi_raw,
        "decoding PSS2C";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "PSS2C")
    _openapi_field_ks1 =
        _decode(Float64, _required(_openapi_object, "Ks1", "PSS2C"), _openapi_validate)
    _openapi_field_ks2 =
        _decode(Float64, _required(_openapi_object, "Ks2", "PSS2C"), _openapi_validate)
    _openapi_field_ks3 =
        _decode(Float64, _required(_openapi_object, "Ks3", "PSS2C"), _openapi_validate)
    _openapi_field_m_rtf =
        _decode(Int64, _required(_openapi_object, "M_rtf", "PSS2C"), _openapi_validate)
    _openapi_field_n_rtf =
        _decode(Int64, _required(_openapi_object, "N_rtf", "PSS2C"), _openapi_validate)
    _openapi_field_pss_hysteresis_param = _decode(
        Vector{Float64},
        _required(_openapi_object, "PSS_Hysteresis_param", "PSS2C"),
        _openapi_validate,
    )
    _openapi_field_t1 =
        _decode(Float64, _required(_openapi_object, "T1", "PSS2C"), _openapi_validate)
    _openapi_field_t10 =
        _decode(Float64, _required(_openapi_object, "T10", "PSS2C"), _openapi_validate)
    _openapi_field_t11 =
        _decode(Float64, _required(_openapi_object, "T11", "PSS2C"), _openapi_validate)
    _openapi_field_t12 =
        _decode(Float64, _required(_openapi_object, "T12", "PSS2C"), _openapi_validate)
    _openapi_field_t13 =
        _decode(Float64, _required(_openapi_object, "T13", "PSS2C"), _openapi_validate)
    _openapi_field_t2 =
        _decode(Float64, _required(_openapi_object, "T2", "PSS2C"), _openapi_validate)
    _openapi_field_t3 =
        _decode(Float64, _required(_openapi_object, "T3", "PSS2C"), _openapi_validate)
    _openapi_field_t4 =
        _decode(Float64, _required(_openapi_object, "T4", "PSS2C"), _openapi_validate)
    _openapi_field_t6 =
        _decode(Float64, _required(_openapi_object, "T6", "PSS2C"), _openapi_validate)
    _openapi_field_t7 =
        _decode(Float64, _required(_openapi_object, "T7", "PSS2C"), _openapi_validate)
    _openapi_field_t8 =
        _decode(Float64, _required(_openapi_object, "T8", "PSS2C"), _openapi_validate)
    _openapi_field_t9 =
        _decode(Float64, _required(_openapi_object, "T9", "PSS2C"), _openapi_validate)
    _openapi_field_tcomp =
        _decode(Float64, _required(_openapi_object, "Tcomp", "PSS2C"), _openapi_validate)
    _openapi_field_tw1 =
        _decode(Float64, _required(_openapi_object, "Tw1", "PSS2C"), _openapi_validate)
    _openapi_field_tw2 =
        _decode(Float64, _required(_openapi_object, "Tw2", "PSS2C"), _openapi_validate)
    _openapi_field_tw3 =
        _decode(Float64, _required(_openapi_object, "Tw3", "PSS2C"), _openapi_validate)
    _openapi_field_tw4 =
        _decode(Float64, _required(_openapi_object, "Tw4", "PSS2C"), _openapi_validate)
    _openapi_field_vs1_lim = _decode(
        Vector{Float64},
        _required(_openapi_object, "Vs1_lim", "PSS2C"),
        _openapi_validate,
    )
    _openapi_field_vs2_lim = _decode(
        Vector{Float64},
        _required(_openapi_object, "Vs2_lim", "PSS2C"),
        _openapi_validate,
    )
    _openapi_field_vst_lim = _decode(
        Vector{Float64},
        _required(_openapi_object, "Vst_lim", "PSS2C"),
        _openapi_validate,
    )
    _openapi_field_xcomp =
        _decode(Float64, _required(_openapi_object, "Xcomp", "PSS2C"), _openapi_validate)
    _openapi_field_hysteresis_binary_logic =
        haskey(_openapi_object, "hysteresis_binary_logic") ?
        _decode(
            Union{Absent, Int64, Nothing},
            _openapi_object["hysteresis_binary_logic"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "PSS2C"), _openapi_validate)
    _openapi_field_input_code_1 = _decode(
        Int64,
        _required(_openapi_object, "input_code_1", "PSS2C"),
        _openapi_validate,
    )
    _openapi_field_input_code_2 = _decode(
        Int64,
        _required(_openapi_object, "input_code_2", "PSS2C"),
        _openapi_validate,
    )
    _openapi_field_remote_bus_control_1 = _decode(
        Int64,
        _required(_openapi_object, "remote_bus_control_1", "PSS2C"),
        _openapi_validate,
    )
    _openapi_field_remote_bus_control_2 = _decode(
        Int64,
        _required(_openapi_object, "remote_bus_control_2", "PSS2C"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "Ks1",
            "Ks2",
            "Ks3",
            "M_rtf",
            "N_rtf",
            "PSS_Hysteresis_param",
            "T1",
            "T10",
            "T11",
            "T12",
            "T13",
            "T2",
            "T3",
            "T4",
            "T6",
            "T7",
            "T8",
            "T9",
            "Tcomp",
            "Tw1",
            "Tw2",
            "Tw3",
            "Tw4",
            "Vs1_lim",
            "Vs2_lim",
            "Vst_lim",
            "Xcomp",
            "hysteresis_binary_logic",
            "id",
            "input_code_1",
            "input_code_2",
            "remote_bus_control_1",
            "remote_bus_control_2",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return PSS2C(;
        ks1=_openapi_field_ks1,
        ks2=_openapi_field_ks2,
        ks3=_openapi_field_ks3,
        m_rtf=_openapi_field_m_rtf,
        n_rtf=_openapi_field_n_rtf,
        pss_hysteresis_param=_openapi_field_pss_hysteresis_param,
        t1=_openapi_field_t1,
        t10=_openapi_field_t10,
        t11=_openapi_field_t11,
        t12=_openapi_field_t12,
        t13=_openapi_field_t13,
        t2=_openapi_field_t2,
        t3=_openapi_field_t3,
        t4=_openapi_field_t4,
        t6=_openapi_field_t6,
        t7=_openapi_field_t7,
        t8=_openapi_field_t8,
        t9=_openapi_field_t9,
        tcomp=_openapi_field_tcomp,
        tw1=_openapi_field_tw1,
        tw2=_openapi_field_tw2,
        tw3=_openapi_field_tw3,
        tw4=_openapi_field_tw4,
        vs1_lim=_openapi_field_vs1_lim,
        vs2_lim=_openapi_field_vs2_lim,
        vst_lim=_openapi_field_vst_lim,
        xcomp=_openapi_field_xcomp,
        hysteresis_binary_logic=_openapi_field_hysteresis_binary_logic,
        id=_openapi_field_id,
        input_code_1=_openapi_field_input_code_1,
        input_code_2=_openapi_field_input_code_2,
        remote_bus_control_1=_openapi_field_remote_bus_control_1,
        remote_bus_control_2=_openapi_field_remote_bus_control_2,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::PSS2C)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.ks1 isa Absent || (_openapi_output["Ks1"] = _encode(_openapi_value.ks1))
    _openapi_value.ks2 isa Absent || (_openapi_output["Ks2"] = _encode(_openapi_value.ks2))
    _openapi_value.ks3 isa Absent || (_openapi_output["Ks3"] = _encode(_openapi_value.ks3))
    _openapi_value.m_rtf isa Absent ||
        (_openapi_output["M_rtf"] = _encode(_openapi_value.m_rtf))
    _openapi_value.n_rtf isa Absent ||
        (_openapi_output["N_rtf"] = _encode(_openapi_value.n_rtf))
    _openapi_value.pss_hysteresis_param isa Absent || (
        _openapi_output["PSS_Hysteresis_param"] =
            _encode(_openapi_value.pss_hysteresis_param)
    )
    _openapi_value.t1 isa Absent || (_openapi_output["T1"] = _encode(_openapi_value.t1))
    _openapi_value.t10 isa Absent || (_openapi_output["T10"] = _encode(_openapi_value.t10))
    _openapi_value.t11 isa Absent || (_openapi_output["T11"] = _encode(_openapi_value.t11))
    _openapi_value.t12 isa Absent || (_openapi_output["T12"] = _encode(_openapi_value.t12))
    _openapi_value.t13 isa Absent || (_openapi_output["T13"] = _encode(_openapi_value.t13))
    _openapi_value.t2 isa Absent || (_openapi_output["T2"] = _encode(_openapi_value.t2))
    _openapi_value.t3 isa Absent || (_openapi_output["T3"] = _encode(_openapi_value.t3))
    _openapi_value.t4 isa Absent || (_openapi_output["T4"] = _encode(_openapi_value.t4))
    _openapi_value.t6 isa Absent || (_openapi_output["T6"] = _encode(_openapi_value.t6))
    _openapi_value.t7 isa Absent || (_openapi_output["T7"] = _encode(_openapi_value.t7))
    _openapi_value.t8 isa Absent || (_openapi_output["T8"] = _encode(_openapi_value.t8))
    _openapi_value.t9 isa Absent || (_openapi_output["T9"] = _encode(_openapi_value.t9))
    _openapi_value.tcomp isa Absent ||
        (_openapi_output["Tcomp"] = _encode(_openapi_value.tcomp))
    _openapi_value.tw1 isa Absent || (_openapi_output["Tw1"] = _encode(_openapi_value.tw1))
    _openapi_value.tw2 isa Absent || (_openapi_output["Tw2"] = _encode(_openapi_value.tw2))
    _openapi_value.tw3 isa Absent || (_openapi_output["Tw3"] = _encode(_openapi_value.tw3))
    _openapi_value.tw4 isa Absent || (_openapi_output["Tw4"] = _encode(_openapi_value.tw4))
    _openapi_value.vs1_lim isa Absent ||
        (_openapi_output["Vs1_lim"] = _encode(_openapi_value.vs1_lim))
    _openapi_value.vs2_lim isa Absent ||
        (_openapi_output["Vs2_lim"] = _encode(_openapi_value.vs2_lim))
    _openapi_value.vst_lim isa Absent ||
        (_openapi_output["Vst_lim"] = _encode(_openapi_value.vst_lim))
    _openapi_value.xcomp isa Absent ||
        (_openapi_output["Xcomp"] = _encode(_openapi_value.xcomp))
    _openapi_value.hysteresis_binary_logic isa Absent || (
        _openapi_output["hysteresis_binary_logic"] =
            _encode(_openapi_value.hysteresis_binary_logic)
    )
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.input_code_1 isa Absent ||
        (_openapi_output["input_code_1"] = _encode(_openapi_value.input_code_1))
    _openapi_value.input_code_2 isa Absent ||
        (_openapi_output["input_code_2"] = _encode(_openapi_value.input_code_2))
    _openapi_value.remote_bus_control_1 isa Absent || (
        _openapi_output["remote_bus_control_1"] =
            _encode(_openapi_value.remote_bus_control_1)
    )
    _openapi_value.remote_bus_control_2 isa Absent || (
        _openapi_output["remote_bus_control_2"] =
            _encode(_openapi_value.remote_bus_control_2)
    )
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
            pointer="/components/schemas/PSS2C",
        ),
        _openapi_output,
        "encoding PSS2C";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::PSS2C)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.ks1 isa Absent || push!(_openapi_output, "Ks1" => _openapi_value.ks1)
    _openapi_value.ks2 isa Absent || push!(_openapi_output, "Ks2" => _openapi_value.ks2)
    _openapi_value.ks3 isa Absent || push!(_openapi_output, "Ks3" => _openapi_value.ks3)
    _openapi_value.m_rtf isa Absent ||
        push!(_openapi_output, "M_rtf" => _openapi_value.m_rtf)
    _openapi_value.n_rtf isa Absent ||
        push!(_openapi_output, "N_rtf" => _openapi_value.n_rtf)
    _openapi_value.pss_hysteresis_param isa Absent || push!(
        _openapi_output,
        "PSS_Hysteresis_param" => _openapi_value.pss_hysteresis_param,
    )
    _openapi_value.t1 isa Absent || push!(_openapi_output, "T1" => _openapi_value.t1)
    _openapi_value.t10 isa Absent || push!(_openapi_output, "T10" => _openapi_value.t10)
    _openapi_value.t11 isa Absent || push!(_openapi_output, "T11" => _openapi_value.t11)
    _openapi_value.t12 isa Absent || push!(_openapi_output, "T12" => _openapi_value.t12)
    _openapi_value.t13 isa Absent || push!(_openapi_output, "T13" => _openapi_value.t13)
    _openapi_value.t2 isa Absent || push!(_openapi_output, "T2" => _openapi_value.t2)
    _openapi_value.t3 isa Absent || push!(_openapi_output, "T3" => _openapi_value.t3)
    _openapi_value.t4 isa Absent || push!(_openapi_output, "T4" => _openapi_value.t4)
    _openapi_value.t6 isa Absent || push!(_openapi_output, "T6" => _openapi_value.t6)
    _openapi_value.t7 isa Absent || push!(_openapi_output, "T7" => _openapi_value.t7)
    _openapi_value.t8 isa Absent || push!(_openapi_output, "T8" => _openapi_value.t8)
    _openapi_value.t9 isa Absent || push!(_openapi_output, "T9" => _openapi_value.t9)
    _openapi_value.tcomp isa Absent ||
        push!(_openapi_output, "Tcomp" => _openapi_value.tcomp)
    _openapi_value.tw1 isa Absent || push!(_openapi_output, "Tw1" => _openapi_value.tw1)
    _openapi_value.tw2 isa Absent || push!(_openapi_output, "Tw2" => _openapi_value.tw2)
    _openapi_value.tw3 isa Absent || push!(_openapi_output, "Tw3" => _openapi_value.tw3)
    _openapi_value.tw4 isa Absent || push!(_openapi_output, "Tw4" => _openapi_value.tw4)
    _openapi_value.vs1_lim isa Absent ||
        push!(_openapi_output, "Vs1_lim" => _openapi_value.vs1_lim)
    _openapi_value.vs2_lim isa Absent ||
        push!(_openapi_output, "Vs2_lim" => _openapi_value.vs2_lim)
    _openapi_value.vst_lim isa Absent ||
        push!(_openapi_output, "Vst_lim" => _openapi_value.vst_lim)
    _openapi_value.xcomp isa Absent ||
        push!(_openapi_output, "Xcomp" => _openapi_value.xcomp)
    _openapi_value.hysteresis_binary_logic isa Absent || push!(
        _openapi_output,
        "hysteresis_binary_logic" => _openapi_value.hysteresis_binary_logic,
    )
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.input_code_1 isa Absent ||
        push!(_openapi_output, "input_code_1" => _openapi_value.input_code_1)
    _openapi_value.input_code_2 isa Absent ||
        push!(_openapi_output, "input_code_2" => _openapi_value.input_code_2)
    _openapi_value.remote_bus_control_1 isa Absent || push!(
        _openapi_output,
        "remote_bus_control_1" => _openapi_value.remote_bus_control_1,
    )
    _openapi_value.remote_bus_control_2 isa Absent || push!(
        _openapi_output,
        "remote_bus_control_2" => _openapi_value.remote_bus_control_2,
    )
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
