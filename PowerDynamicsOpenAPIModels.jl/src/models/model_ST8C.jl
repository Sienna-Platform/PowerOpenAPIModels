"""
    ST8C

In these excitation systems, voltage (and also current in compounded systems) is transformed to an appropriate level. Rectifiers, either controlled or non-controlled, provide the necessary direct current for the generator field. Parameters of IEEE Std 421.5 Type ST8C Excitacion System. ST8C in PSSE and PSLF

  - `ifd_ref`: Reference field current set-point
  - `k_a`: Field current regulator proportional gain
  - `k_c1`: Rectifier loading factor proportional to commutating reactance
  - `k_c2`: Rectifier loading factor proportional to commutating reactance
  - `k_f`: Exciter field current feedback gain
  - `k_i1`: Potential circuit (current) gain coefficient
  - `k_i2`: Potential circuit (current) gain coefficient
  - `k_ia`: Field current regulator integral gain
  - `k_ir`: Regulator integral gain
  - `k_p`: Potential circuit (voltage) gain coefficient
  - `k_pa`: Field current regulator proportional gain
  - `k_pr`: Regulator proportional gain
  - `oel_flag`: OEL Flag for ST8C: <2: Summation at voltage error, 2: OEL takeover at gate
  - `scl_flag`: SCL Flag for ST8C: <2: Summation at voltage error, 2: SCL takeover at UEL and OEL gates
  - `sw1_flag`: SW1 Flag for power source selector for ST8C: <2: Source from generator terminal voltage, 2: Independent power source
  - `t_a`: Controlled rectifier bridge equivalent time constant
  - `t_f`: Field current feedback time constant
  - `tr`: Regulator input filter time constant
  - `uel_flag`: UEL Flag for ST8C: <2: Summation at voltage error, 2: UEL takeover at gate
  - `vb1_max`: Maximum available exciter voltage
  - `vb2_max`: Maximum available exciter voltage
  - `v_ref`: Reference voltage set-point
  - `va_lim`: Field current regulator output limits
  - `vpi_lim`: Regulator input limits
  - `vr_lim`: Voltage regulator limits
  - `x_l`: Reactance associated with potential source
  - `id`: Unique integer identifier for this component
  - `theta_p`: Potential circuit phase angle (degrees)
"""
Base.@kwdef struct ST8C <: APIModel
    ifd_ref::Union{Absent, Float64, Nothing} = ABSENT
    k_a::Float64
    k_c1::Float64
    k_c2::Float64
    k_f::Float64
    k_i1::Float64
    k_i2::Float64
    k_ia::Float64
    k_ir::Float64
    k_p::Float64
    k_pa::Float64
    k_pr::Float64
    oel_flag::Int64
    scl_flag::Int64
    sw1_flag::Int64
    t_a::Float64
    t_f::Float64
    tr::Float64
    uel_flag::Int64
    vb1_max::Float64
    vb2_max::Float64
    v_ref::Union{Absent, Float64, Nothing} = ABSENT
    va_lim::MinMax
    vpi_lim::MinMax
    vr_lim::MinMax
    x_l::Float64
    id::Int64
    theta_p::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ST8C}, value) = _decode(ST8C, value, true)
function _decode(::Type{ST8C}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-d5d2d2b15ebff194ab18.json",
            pointer="/components/schemas/ST8C",
        ),
        _openapi_raw,
        "decoding ST8C";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ST8C")
    _openapi_field_ifd_ref =
        haskey(_openapi_object, "Ifd_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["Ifd_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_k_a =
        _decode(Float64, _required(_openapi_object, "K_a", "ST8C"), _openapi_validate)
    _openapi_field_k_c1 =
        _decode(Float64, _required(_openapi_object, "K_c1", "ST8C"), _openapi_validate)
    _openapi_field_k_c2 =
        _decode(Float64, _required(_openapi_object, "K_c2", "ST8C"), _openapi_validate)
    _openapi_field_k_f =
        _decode(Float64, _required(_openapi_object, "K_f", "ST8C"), _openapi_validate)
    _openapi_field_k_i1 =
        _decode(Float64, _required(_openapi_object, "K_i1", "ST8C"), _openapi_validate)
    _openapi_field_k_i2 =
        _decode(Float64, _required(_openapi_object, "K_i2", "ST8C"), _openapi_validate)
    _openapi_field_k_ia =
        _decode(Float64, _required(_openapi_object, "K_ia", "ST8C"), _openapi_validate)
    _openapi_field_k_ir =
        _decode(Float64, _required(_openapi_object, "K_ir", "ST8C"), _openapi_validate)
    _openapi_field_k_p =
        _decode(Float64, _required(_openapi_object, "K_p", "ST8C"), _openapi_validate)
    _openapi_field_k_pa =
        _decode(Float64, _required(_openapi_object, "K_pa", "ST8C"), _openapi_validate)
    _openapi_field_k_pr =
        _decode(Float64, _required(_openapi_object, "K_pr", "ST8C"), _openapi_validate)
    _openapi_field_oel_flag =
        _decode(Int64, _required(_openapi_object, "OEL_Flag", "ST8C"), _openapi_validate)
    _openapi_field_scl_flag =
        _decode(Int64, _required(_openapi_object, "SCL_Flag", "ST8C"), _openapi_validate)
    _openapi_field_sw1_flag =
        _decode(Int64, _required(_openapi_object, "SW1_Flag", "ST8C"), _openapi_validate)
    _openapi_field_t_a =
        _decode(Float64, _required(_openapi_object, "T_a", "ST8C"), _openapi_validate)
    _openapi_field_t_f =
        _decode(Float64, _required(_openapi_object, "T_f", "ST8C"), _openapi_validate)
    _openapi_field_tr =
        _decode(Float64, _required(_openapi_object, "Tr", "ST8C"), _openapi_validate)
    _openapi_field_uel_flag =
        _decode(Int64, _required(_openapi_object, "UEL_Flag", "ST8C"), _openapi_validate)
    _openapi_field_vb1_max =
        _decode(Float64, _required(_openapi_object, "VB1_max", "ST8C"), _openapi_validate)
    _openapi_field_vb2_max =
        _decode(Float64, _required(_openapi_object, "VB2_max", "ST8C"), _openapi_validate)
    _openapi_field_v_ref =
        haskey(_openapi_object, "V_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["V_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_va_lim =
        _decode(MinMax, _required(_openapi_object, "Va_lim", "ST8C"), _openapi_validate)
    _openapi_field_vpi_lim =
        _decode(MinMax, _required(_openapi_object, "Vpi_lim", "ST8C"), _openapi_validate)
    _openapi_field_vr_lim =
        _decode(MinMax, _required(_openapi_object, "Vr_lim", "ST8C"), _openapi_validate)
    _openapi_field_x_l =
        _decode(Float64, _required(_openapi_object, "X_l", "ST8C"), _openapi_validate)
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "ST8C"), _openapi_validate)
    _openapi_field_theta_p =
        _decode(Float64, _required(_openapi_object, "theta_p", "ST8C"), _openapi_validate)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "Ifd_ref",
            "K_a",
            "K_c1",
            "K_c2",
            "K_f",
            "K_i1",
            "K_i2",
            "K_ia",
            "K_ir",
            "K_p",
            "K_pa",
            "K_pr",
            "OEL_Flag",
            "SCL_Flag",
            "SW1_Flag",
            "T_a",
            "T_f",
            "Tr",
            "UEL_Flag",
            "VB1_max",
            "VB2_max",
            "V_ref",
            "Va_lim",
            "Vpi_lim",
            "Vr_lim",
            "X_l",
            "id",
            "theta_p",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return ST8C(;
        ifd_ref=_openapi_field_ifd_ref,
        k_a=_openapi_field_k_a,
        k_c1=_openapi_field_k_c1,
        k_c2=_openapi_field_k_c2,
        k_f=_openapi_field_k_f,
        k_i1=_openapi_field_k_i1,
        k_i2=_openapi_field_k_i2,
        k_ia=_openapi_field_k_ia,
        k_ir=_openapi_field_k_ir,
        k_p=_openapi_field_k_p,
        k_pa=_openapi_field_k_pa,
        k_pr=_openapi_field_k_pr,
        oel_flag=_openapi_field_oel_flag,
        scl_flag=_openapi_field_scl_flag,
        sw1_flag=_openapi_field_sw1_flag,
        t_a=_openapi_field_t_a,
        t_f=_openapi_field_t_f,
        tr=_openapi_field_tr,
        uel_flag=_openapi_field_uel_flag,
        vb1_max=_openapi_field_vb1_max,
        vb2_max=_openapi_field_vb2_max,
        v_ref=_openapi_field_v_ref,
        va_lim=_openapi_field_va_lim,
        vpi_lim=_openapi_field_vpi_lim,
        vr_lim=_openapi_field_vr_lim,
        x_l=_openapi_field_x_l,
        id=_openapi_field_id,
        theta_p=_openapi_field_theta_p,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::ST8C)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.ifd_ref isa Absent ||
        (_openapi_output["Ifd_ref"] = _encode(_openapi_value.ifd_ref))
    _openapi_value.k_a isa Absent || (_openapi_output["K_a"] = _encode(_openapi_value.k_a))
    _openapi_value.k_c1 isa Absent ||
        (_openapi_output["K_c1"] = _encode(_openapi_value.k_c1))
    _openapi_value.k_c2 isa Absent ||
        (_openapi_output["K_c2"] = _encode(_openapi_value.k_c2))
    _openapi_value.k_f isa Absent || (_openapi_output["K_f"] = _encode(_openapi_value.k_f))
    _openapi_value.k_i1 isa Absent ||
        (_openapi_output["K_i1"] = _encode(_openapi_value.k_i1))
    _openapi_value.k_i2 isa Absent ||
        (_openapi_output["K_i2"] = _encode(_openapi_value.k_i2))
    _openapi_value.k_ia isa Absent ||
        (_openapi_output["K_ia"] = _encode(_openapi_value.k_ia))
    _openapi_value.k_ir isa Absent ||
        (_openapi_output["K_ir"] = _encode(_openapi_value.k_ir))
    _openapi_value.k_p isa Absent || (_openapi_output["K_p"] = _encode(_openapi_value.k_p))
    _openapi_value.k_pa isa Absent ||
        (_openapi_output["K_pa"] = _encode(_openapi_value.k_pa))
    _openapi_value.k_pr isa Absent ||
        (_openapi_output["K_pr"] = _encode(_openapi_value.k_pr))
    _openapi_value.oel_flag isa Absent ||
        (_openapi_output["OEL_Flag"] = _encode(_openapi_value.oel_flag))
    _openapi_value.scl_flag isa Absent ||
        (_openapi_output["SCL_Flag"] = _encode(_openapi_value.scl_flag))
    _openapi_value.sw1_flag isa Absent ||
        (_openapi_output["SW1_Flag"] = _encode(_openapi_value.sw1_flag))
    _openapi_value.t_a isa Absent || (_openapi_output["T_a"] = _encode(_openapi_value.t_a))
    _openapi_value.t_f isa Absent || (_openapi_output["T_f"] = _encode(_openapi_value.t_f))
    _openapi_value.tr isa Absent || (_openapi_output["Tr"] = _encode(_openapi_value.tr))
    _openapi_value.uel_flag isa Absent ||
        (_openapi_output["UEL_Flag"] = _encode(_openapi_value.uel_flag))
    _openapi_value.vb1_max isa Absent ||
        (_openapi_output["VB1_max"] = _encode(_openapi_value.vb1_max))
    _openapi_value.vb2_max isa Absent ||
        (_openapi_output["VB2_max"] = _encode(_openapi_value.vb2_max))
    _openapi_value.v_ref isa Absent ||
        (_openapi_output["V_ref"] = _encode(_openapi_value.v_ref))
    _openapi_value.va_lim isa Absent ||
        (_openapi_output["Va_lim"] = _encode(_openapi_value.va_lim))
    _openapi_value.vpi_lim isa Absent ||
        (_openapi_output["Vpi_lim"] = _encode(_openapi_value.vpi_lim))
    _openapi_value.vr_lim isa Absent ||
        (_openapi_output["Vr_lim"] = _encode(_openapi_value.vr_lim))
    _openapi_value.x_l isa Absent || (_openapi_output["X_l"] = _encode(_openapi_value.x_l))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.theta_p isa Absent ||
        (_openapi_output["theta_p"] = _encode(_openapi_value.theta_p))
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
            pointer="/components/schemas/ST8C",
        ),
        _openapi_output,
        "encoding ST8C";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::ST8C)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.ifd_ref isa Absent ||
        push!(_openapi_output, "Ifd_ref" => _openapi_value.ifd_ref)
    _openapi_value.k_a isa Absent || push!(_openapi_output, "K_a" => _openapi_value.k_a)
    _openapi_value.k_c1 isa Absent || push!(_openapi_output, "K_c1" => _openapi_value.k_c1)
    _openapi_value.k_c2 isa Absent || push!(_openapi_output, "K_c2" => _openapi_value.k_c2)
    _openapi_value.k_f isa Absent || push!(_openapi_output, "K_f" => _openapi_value.k_f)
    _openapi_value.k_i1 isa Absent || push!(_openapi_output, "K_i1" => _openapi_value.k_i1)
    _openapi_value.k_i2 isa Absent || push!(_openapi_output, "K_i2" => _openapi_value.k_i2)
    _openapi_value.k_ia isa Absent || push!(_openapi_output, "K_ia" => _openapi_value.k_ia)
    _openapi_value.k_ir isa Absent || push!(_openapi_output, "K_ir" => _openapi_value.k_ir)
    _openapi_value.k_p isa Absent || push!(_openapi_output, "K_p" => _openapi_value.k_p)
    _openapi_value.k_pa isa Absent || push!(_openapi_output, "K_pa" => _openapi_value.k_pa)
    _openapi_value.k_pr isa Absent || push!(_openapi_output, "K_pr" => _openapi_value.k_pr)
    _openapi_value.oel_flag isa Absent ||
        push!(_openapi_output, "OEL_Flag" => _openapi_value.oel_flag)
    _openapi_value.scl_flag isa Absent ||
        push!(_openapi_output, "SCL_Flag" => _openapi_value.scl_flag)
    _openapi_value.sw1_flag isa Absent ||
        push!(_openapi_output, "SW1_Flag" => _openapi_value.sw1_flag)
    _openapi_value.t_a isa Absent || push!(_openapi_output, "T_a" => _openapi_value.t_a)
    _openapi_value.t_f isa Absent || push!(_openapi_output, "T_f" => _openapi_value.t_f)
    _openapi_value.tr isa Absent || push!(_openapi_output, "Tr" => _openapi_value.tr)
    _openapi_value.uel_flag isa Absent ||
        push!(_openapi_output, "UEL_Flag" => _openapi_value.uel_flag)
    _openapi_value.vb1_max isa Absent ||
        push!(_openapi_output, "VB1_max" => _openapi_value.vb1_max)
    _openapi_value.vb2_max isa Absent ||
        push!(_openapi_output, "VB2_max" => _openapi_value.vb2_max)
    _openapi_value.v_ref isa Absent ||
        push!(_openapi_output, "V_ref" => _openapi_value.v_ref)
    _openapi_value.va_lim isa Absent ||
        push!(_openapi_output, "Va_lim" => _openapi_value.va_lim)
    _openapi_value.vpi_lim isa Absent ||
        push!(_openapi_output, "Vpi_lim" => _openapi_value.vpi_lim)
    _openapi_value.vr_lim isa Absent ||
        push!(_openapi_output, "Vr_lim" => _openapi_value.vr_lim)
    _openapi_value.x_l isa Absent || push!(_openapi_output, "X_l" => _openapi_value.x_l)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.theta_p isa Absent ||
        push!(_openapi_output, "theta_p" => _openapi_value.theta_p)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
