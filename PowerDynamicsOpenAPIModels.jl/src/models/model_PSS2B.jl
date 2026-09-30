"""
    PSS2B

IEEE 421.5 2005 PSS2B IEEE Dual-Input Stabilizer Model

  - `id`: Unique integer identifier for this component
  - `input_code_1`: First input code for stabilizer
  - `remote_bus_control_1`: First input remote bus identification number for control. 0 identifies the local bus connected to this component
  - `input_code_2`: Second input code for stabilizer
  - `remote_bus_control_2`: Second input remote bus identification number for control. 0 identifies the local bus connected to this component
  - `m_rtf`: M parameter for ramp tracking filter
  - `n_rtf`: N parameter for ramp tracking filter
  - `tw1`: Time constant for first washout filter for first input
  - `tw2`: Time constant for second washout filter for first input
  - `t6`: Time constant for low-pass filter for first input
  - `tw3`: Time constant for first washout filter for second input
  - `tw4`: Time constant for second washout filter for second input
  - `t7`: Time constant for low-pass filter for second input
  - `ks2`: Gain for low-pass filter for second input
  - `ks3`: Gain for second input
  - `t8`: Time constant for ramp tracking filter
  - `t9`: Time constant for ramp tracking filter
  - `ks1`: Gain before lead-lag blocks
  - `t1`: Time constant for first lead-lag block
  - `t2`: Time constant for first lead-lag block
  - `t3`: Time constant for second lead-lag block
  - `t4`: Time constant for second lead-lag block
  - `t10`: Time constant for third lead-lag block
  - `t11`: Time constant for third lead-lag block
  - `vs1_lim`: First input limits (Vs1_min, Vs1_max)
  - `vs2_lim`: Second input limits (Vs2_min, Vs2_max)
  - `vst_lim`: PSS output limits (Vst_min, Vst_max)
"""
Base.@kwdef struct PSS2B <: APIModel
    id::Int64
    input_code_1::Int64
    remote_bus_control_1::Int64
    input_code_2::Int64
    remote_bus_control_2::Int64
    m_rtf::Int64
    n_rtf::Int64
    tw1::Float64
    tw2::Float64
    t6::Float64
    tw3::Float64
    tw4::Float64
    t7::Float64
    ks2::Float64
    ks3::Float64
    t8::Float64
    t9::Float64
    ks1::Float64
    t1::Float64
    t2::Float64
    t3::Float64
    t4::Float64
    t10::Float64
    t11::Float64
    vs1_lim::Vector{Float64}
    vs2_lim::Vector{Float64}
    vst_lim::Vector{Float64}
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{PSS2B}, value) = _decode(PSS2B, value, true)
function _decode(::Type{PSS2B}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-60c042a3d7f901de4fc9.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding PSS2B";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "PSS2B")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "PSS2B"), _openapi_validate)
    _openapi_field_input_code_1 = _decode(
        Int64,
        _required(_openapi_object, "input_code_1", "PSS2B"),
        _openapi_validate,
    )
    _openapi_field_remote_bus_control_1 = _decode(
        Int64,
        _required(_openapi_object, "remote_bus_control_1", "PSS2B"),
        _openapi_validate,
    )
    _openapi_field_input_code_2 = _decode(
        Int64,
        _required(_openapi_object, "input_code_2", "PSS2B"),
        _openapi_validate,
    )
    _openapi_field_remote_bus_control_2 = _decode(
        Int64,
        _required(_openapi_object, "remote_bus_control_2", "PSS2B"),
        _openapi_validate,
    )
    _openapi_field_m_rtf =
        _decode(Int64, _required(_openapi_object, "M_rtf", "PSS2B"), _openapi_validate)
    _openapi_field_n_rtf =
        _decode(Int64, _required(_openapi_object, "N_rtf", "PSS2B"), _openapi_validate)
    _openapi_field_tw1 =
        _decode(Float64, _required(_openapi_object, "Tw1", "PSS2B"), _openapi_validate)
    _openapi_field_tw2 =
        _decode(Float64, _required(_openapi_object, "Tw2", "PSS2B"), _openapi_validate)
    _openapi_field_t6 =
        _decode(Float64, _required(_openapi_object, "T6", "PSS2B"), _openapi_validate)
    _openapi_field_tw3 =
        _decode(Float64, _required(_openapi_object, "Tw3", "PSS2B"), _openapi_validate)
    _openapi_field_tw4 =
        _decode(Float64, _required(_openapi_object, "Tw4", "PSS2B"), _openapi_validate)
    _openapi_field_t7 =
        _decode(Float64, _required(_openapi_object, "T7", "PSS2B"), _openapi_validate)
    _openapi_field_ks2 =
        _decode(Float64, _required(_openapi_object, "Ks2", "PSS2B"), _openapi_validate)
    _openapi_field_ks3 =
        _decode(Float64, _required(_openapi_object, "Ks3", "PSS2B"), _openapi_validate)
    _openapi_field_t8 =
        _decode(Float64, _required(_openapi_object, "T8", "PSS2B"), _openapi_validate)
    _openapi_field_t9 =
        _decode(Float64, _required(_openapi_object, "T9", "PSS2B"), _openapi_validate)
    _openapi_field_ks1 =
        _decode(Float64, _required(_openapi_object, "Ks1", "PSS2B"), _openapi_validate)
    _openapi_field_t1 =
        _decode(Float64, _required(_openapi_object, "T1", "PSS2B"), _openapi_validate)
    _openapi_field_t2 =
        _decode(Float64, _required(_openapi_object, "T2", "PSS2B"), _openapi_validate)
    _openapi_field_t3 =
        _decode(Float64, _required(_openapi_object, "T3", "PSS2B"), _openapi_validate)
    _openapi_field_t4 =
        _decode(Float64, _required(_openapi_object, "T4", "PSS2B"), _openapi_validate)
    _openapi_field_t10 =
        _decode(Float64, _required(_openapi_object, "T10", "PSS2B"), _openapi_validate)
    _openapi_field_t11 =
        _decode(Float64, _required(_openapi_object, "T11", "PSS2B"), _openapi_validate)
    _openapi_field_vs1_lim = _decode(
        Vector{Float64},
        _required(_openapi_object, "Vs1_lim", "PSS2B"),
        _openapi_validate,
    )
    _openapi_field_vs2_lim = _decode(
        Vector{Float64},
        _required(_openapi_object, "Vs2_lim", "PSS2B"),
        _openapi_validate,
    )
    _openapi_field_vst_lim = _decode(
        Vector{Float64},
        _required(_openapi_object, "Vst_lim", "PSS2B"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "input_code_1",
            "remote_bus_control_1",
            "input_code_2",
            "remote_bus_control_2",
            "M_rtf",
            "N_rtf",
            "Tw1",
            "Tw2",
            "T6",
            "Tw3",
            "Tw4",
            "T7",
            "Ks2",
            "Ks3",
            "T8",
            "T9",
            "Ks1",
            "T1",
            "T2",
            "T3",
            "T4",
            "T10",
            "T11",
            "Vs1_lim",
            "Vs2_lim",
            "Vst_lim",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return PSS2B(;
        id=_openapi_field_id,
        input_code_1=_openapi_field_input_code_1,
        remote_bus_control_1=_openapi_field_remote_bus_control_1,
        input_code_2=_openapi_field_input_code_2,
        remote_bus_control_2=_openapi_field_remote_bus_control_2,
        m_rtf=_openapi_field_m_rtf,
        n_rtf=_openapi_field_n_rtf,
        tw1=_openapi_field_tw1,
        tw2=_openapi_field_tw2,
        t6=_openapi_field_t6,
        tw3=_openapi_field_tw3,
        tw4=_openapi_field_tw4,
        t7=_openapi_field_t7,
        ks2=_openapi_field_ks2,
        ks3=_openapi_field_ks3,
        t8=_openapi_field_t8,
        t9=_openapi_field_t9,
        ks1=_openapi_field_ks1,
        t1=_openapi_field_t1,
        t2=_openapi_field_t2,
        t3=_openapi_field_t3,
        t4=_openapi_field_t4,
        t10=_openapi_field_t10,
        t11=_openapi_field_t11,
        vs1_lim=_openapi_field_vs1_lim,
        vs2_lim=_openapi_field_vs2_lim,
        vst_lim=_openapi_field_vst_lim,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::PSS2B)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.input_code_1 isa Absent ||
        (_openapi_output["input_code_1"] = _encode(_openapi_value.input_code_1))
    _openapi_value.remote_bus_control_1 isa Absent || (
        _openapi_output["remote_bus_control_1"] =
            _encode(_openapi_value.remote_bus_control_1)
    )
    _openapi_value.input_code_2 isa Absent ||
        (_openapi_output["input_code_2"] = _encode(_openapi_value.input_code_2))
    _openapi_value.remote_bus_control_2 isa Absent || (
        _openapi_output["remote_bus_control_2"] =
            _encode(_openapi_value.remote_bus_control_2)
    )
    _openapi_value.m_rtf isa Absent ||
        (_openapi_output["M_rtf"] = _encode(_openapi_value.m_rtf))
    _openapi_value.n_rtf isa Absent ||
        (_openapi_output["N_rtf"] = _encode(_openapi_value.n_rtf))
    _openapi_value.tw1 isa Absent || (_openapi_output["Tw1"] = _encode(_openapi_value.tw1))
    _openapi_value.tw2 isa Absent || (_openapi_output["Tw2"] = _encode(_openapi_value.tw2))
    _openapi_value.t6 isa Absent || (_openapi_output["T6"] = _encode(_openapi_value.t6))
    _openapi_value.tw3 isa Absent || (_openapi_output["Tw3"] = _encode(_openapi_value.tw3))
    _openapi_value.tw4 isa Absent || (_openapi_output["Tw4"] = _encode(_openapi_value.tw4))
    _openapi_value.t7 isa Absent || (_openapi_output["T7"] = _encode(_openapi_value.t7))
    _openapi_value.ks2 isa Absent || (_openapi_output["Ks2"] = _encode(_openapi_value.ks2))
    _openapi_value.ks3 isa Absent || (_openapi_output["Ks3"] = _encode(_openapi_value.ks3))
    _openapi_value.t8 isa Absent || (_openapi_output["T8"] = _encode(_openapi_value.t8))
    _openapi_value.t9 isa Absent || (_openapi_output["T9"] = _encode(_openapi_value.t9))
    _openapi_value.ks1 isa Absent || (_openapi_output["Ks1"] = _encode(_openapi_value.ks1))
    _openapi_value.t1 isa Absent || (_openapi_output["T1"] = _encode(_openapi_value.t1))
    _openapi_value.t2 isa Absent || (_openapi_output["T2"] = _encode(_openapi_value.t2))
    _openapi_value.t3 isa Absent || (_openapi_output["T3"] = _encode(_openapi_value.t3))
    _openapi_value.t4 isa Absent || (_openapi_output["T4"] = _encode(_openapi_value.t4))
    _openapi_value.t10 isa Absent || (_openapi_output["T10"] = _encode(_openapi_value.t10))
    _openapi_value.t11 isa Absent || (_openapi_output["T11"] = _encode(_openapi_value.t11))
    _openapi_value.vs1_lim isa Absent ||
        (_openapi_output["Vs1_lim"] = _encode(_openapi_value.vs1_lim))
    _openapi_value.vs2_lim isa Absent ||
        (_openapi_output["Vs2_lim"] = _encode(_openapi_value.vs2_lim))
    _openapi_value.vst_lim isa Absent ||
        (_openapi_output["Vst_lim"] = _encode(_openapi_value.vst_lim))
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
            resource="https://openapi.invalid/schema/external-60c042a3d7f901de4fc9.json",
            pointer="",
        ),
        _openapi_output,
        "encoding PSS2B";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::PSS2B)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.input_code_1 isa Absent ||
        push!(_openapi_output, "input_code_1" => _openapi_value.input_code_1)
    _openapi_value.remote_bus_control_1 isa Absent || push!(
        _openapi_output,
        "remote_bus_control_1" => _openapi_value.remote_bus_control_1,
    )
    _openapi_value.input_code_2 isa Absent ||
        push!(_openapi_output, "input_code_2" => _openapi_value.input_code_2)
    _openapi_value.remote_bus_control_2 isa Absent || push!(
        _openapi_output,
        "remote_bus_control_2" => _openapi_value.remote_bus_control_2,
    )
    _openapi_value.m_rtf isa Absent ||
        push!(_openapi_output, "M_rtf" => _openapi_value.m_rtf)
    _openapi_value.n_rtf isa Absent ||
        push!(_openapi_output, "N_rtf" => _openapi_value.n_rtf)
    _openapi_value.tw1 isa Absent || push!(_openapi_output, "Tw1" => _openapi_value.tw1)
    _openapi_value.tw2 isa Absent || push!(_openapi_output, "Tw2" => _openapi_value.tw2)
    _openapi_value.t6 isa Absent || push!(_openapi_output, "T6" => _openapi_value.t6)
    _openapi_value.tw3 isa Absent || push!(_openapi_output, "Tw3" => _openapi_value.tw3)
    _openapi_value.tw4 isa Absent || push!(_openapi_output, "Tw4" => _openapi_value.tw4)
    _openapi_value.t7 isa Absent || push!(_openapi_output, "T7" => _openapi_value.t7)
    _openapi_value.ks2 isa Absent || push!(_openapi_output, "Ks2" => _openapi_value.ks2)
    _openapi_value.ks3 isa Absent || push!(_openapi_output, "Ks3" => _openapi_value.ks3)
    _openapi_value.t8 isa Absent || push!(_openapi_output, "T8" => _openapi_value.t8)
    _openapi_value.t9 isa Absent || push!(_openapi_output, "T9" => _openapi_value.t9)
    _openapi_value.ks1 isa Absent || push!(_openapi_output, "Ks1" => _openapi_value.ks1)
    _openapi_value.t1 isa Absent || push!(_openapi_output, "T1" => _openapi_value.t1)
    _openapi_value.t2 isa Absent || push!(_openapi_output, "T2" => _openapi_value.t2)
    _openapi_value.t3 isa Absent || push!(_openapi_output, "T3" => _openapi_value.t3)
    _openapi_value.t4 isa Absent || push!(_openapi_output, "T4" => _openapi_value.t4)
    _openapi_value.t10 isa Absent || push!(_openapi_output, "T10" => _openapi_value.t10)
    _openapi_value.t11 isa Absent || push!(_openapi_output, "T11" => _openapi_value.t11)
    _openapi_value.vs1_lim isa Absent ||
        push!(_openapi_output, "Vs1_lim" => _openapi_value.vs1_lim)
    _openapi_value.vs2_lim isa Absent ||
        push!(_openapi_output, "Vs2_lim" => _openapi_value.vs2_lim)
    _openapi_value.vst_lim isa Absent ||
        push!(_openapi_output, "Vst_lim" => _openapi_value.vst_lim)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
