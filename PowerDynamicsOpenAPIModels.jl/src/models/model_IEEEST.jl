"""
    IEEEST

IEEE stabilizing model PSS

  - `id`: Unique integer identifier for this component
  - `input_code`: Code input for stabilizer
  - `remote_bus_control`: ACBus identification number for control. 0 identifies the bus connected to this component
  - `a1`: Filter coefficient
  - `a2`: Filter coefficient
  - `a3`: Filter coefficient
  - `a4`: Filter coefficient
  - `a5`: Filter coefficient
  - `a6`: Filter coefficient
  - `t1`: Time constant
  - `t2`: Time constant
  - `t3`: Time constant
  - `t4`: Time constant
  - `t5`: Time constant
  - `t6`: Time constant
  - `ks`: Proportional gain
  - `ls_lim`: PSS output limits for regulator output (Ls_min, Ls_max)
  - `vcu`: Cutoff limiter upper bound
  - `vcl`: Cutoff limiter lower bound
"""
Base.@kwdef struct IEEEST <: APIModel
    id::Int64
    input_code::Int64
    remote_bus_control::Int64
    a1::Float64
    a2::Float64
    a3::Float64
    a4::Float64
    a5::Float64
    a6::Float64
    t1::Float64
    t2::Float64
    t3::Float64
    t4::Float64
    t5::Float64
    t6::Float64
    ks::Float64
    ls_lim::Vector{Float64}
    vcu::Float64
    vcl::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{IEEEST}, value) = _decode(IEEEST, value, true)
function _decode(::Type{IEEEST}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-1a5d1206035c78c9facc.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding IEEEST";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "IEEEST")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "IEEEST"), _openapi_validate)
    _openapi_field_input_code = _decode(
        Int64,
        _required(_openapi_object, "input_code", "IEEEST"),
        _openapi_validate,
    )
    _openapi_field_remote_bus_control = _decode(
        Int64,
        _required(_openapi_object, "remote_bus_control", "IEEEST"),
        _openapi_validate,
    )
    _openapi_field_a1 =
        _decode(Float64, _required(_openapi_object, "A1", "IEEEST"), _openapi_validate)
    _openapi_field_a2 =
        _decode(Float64, _required(_openapi_object, "A2", "IEEEST"), _openapi_validate)
    _openapi_field_a3 =
        _decode(Float64, _required(_openapi_object, "A3", "IEEEST"), _openapi_validate)
    _openapi_field_a4 =
        _decode(Float64, _required(_openapi_object, "A4", "IEEEST"), _openapi_validate)
    _openapi_field_a5 =
        _decode(Float64, _required(_openapi_object, "A5", "IEEEST"), _openapi_validate)
    _openapi_field_a6 =
        _decode(Float64, _required(_openapi_object, "A6", "IEEEST"), _openapi_validate)
    _openapi_field_t1 =
        _decode(Float64, _required(_openapi_object, "T1", "IEEEST"), _openapi_validate)
    _openapi_field_t2 =
        _decode(Float64, _required(_openapi_object, "T2", "IEEEST"), _openapi_validate)
    _openapi_field_t3 =
        _decode(Float64, _required(_openapi_object, "T3", "IEEEST"), _openapi_validate)
    _openapi_field_t4 =
        _decode(Float64, _required(_openapi_object, "T4", "IEEEST"), _openapi_validate)
    _openapi_field_t5 =
        _decode(Float64, _required(_openapi_object, "T5", "IEEEST"), _openapi_validate)
    _openapi_field_t6 =
        _decode(Float64, _required(_openapi_object, "T6", "IEEEST"), _openapi_validate)
    _openapi_field_ks =
        _decode(Float64, _required(_openapi_object, "Ks", "IEEEST"), _openapi_validate)
    _openapi_field_ls_lim = _decode(
        Vector{Float64},
        _required(_openapi_object, "Ls_lim", "IEEEST"),
        _openapi_validate,
    )
    _openapi_field_vcu =
        _decode(Float64, _required(_openapi_object, "Vcu", "IEEEST"), _openapi_validate)
    _openapi_field_vcl =
        _decode(Float64, _required(_openapi_object, "Vcl", "IEEEST"), _openapi_validate)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "input_code",
            "remote_bus_control",
            "A1",
            "A2",
            "A3",
            "A4",
            "A5",
            "A6",
            "T1",
            "T2",
            "T3",
            "T4",
            "T5",
            "T6",
            "Ks",
            "Ls_lim",
            "Vcu",
            "Vcl",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return IEEEST(;
        id=_openapi_field_id,
        input_code=_openapi_field_input_code,
        remote_bus_control=_openapi_field_remote_bus_control,
        a1=_openapi_field_a1,
        a2=_openapi_field_a2,
        a3=_openapi_field_a3,
        a4=_openapi_field_a4,
        a5=_openapi_field_a5,
        a6=_openapi_field_a6,
        t1=_openapi_field_t1,
        t2=_openapi_field_t2,
        t3=_openapi_field_t3,
        t4=_openapi_field_t4,
        t5=_openapi_field_t5,
        t6=_openapi_field_t6,
        ks=_openapi_field_ks,
        ls_lim=_openapi_field_ls_lim,
        vcu=_openapi_field_vcu,
        vcl=_openapi_field_vcl,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::IEEEST)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.input_code isa Absent ||
        (_openapi_output["input_code"] = _encode(_openapi_value.input_code))
    _openapi_value.remote_bus_control isa Absent ||
        (_openapi_output["remote_bus_control"] = _encode(_openapi_value.remote_bus_control))
    _openapi_value.a1 isa Absent || (_openapi_output["A1"] = _encode(_openapi_value.a1))
    _openapi_value.a2 isa Absent || (_openapi_output["A2"] = _encode(_openapi_value.a2))
    _openapi_value.a3 isa Absent || (_openapi_output["A3"] = _encode(_openapi_value.a3))
    _openapi_value.a4 isa Absent || (_openapi_output["A4"] = _encode(_openapi_value.a4))
    _openapi_value.a5 isa Absent || (_openapi_output["A5"] = _encode(_openapi_value.a5))
    _openapi_value.a6 isa Absent || (_openapi_output["A6"] = _encode(_openapi_value.a6))
    _openapi_value.t1 isa Absent || (_openapi_output["T1"] = _encode(_openapi_value.t1))
    _openapi_value.t2 isa Absent || (_openapi_output["T2"] = _encode(_openapi_value.t2))
    _openapi_value.t3 isa Absent || (_openapi_output["T3"] = _encode(_openapi_value.t3))
    _openapi_value.t4 isa Absent || (_openapi_output["T4"] = _encode(_openapi_value.t4))
    _openapi_value.t5 isa Absent || (_openapi_output["T5"] = _encode(_openapi_value.t5))
    _openapi_value.t6 isa Absent || (_openapi_output["T6"] = _encode(_openapi_value.t6))
    _openapi_value.ks isa Absent || (_openapi_output["Ks"] = _encode(_openapi_value.ks))
    _openapi_value.ls_lim isa Absent ||
        (_openapi_output["Ls_lim"] = _encode(_openapi_value.ls_lim))
    _openapi_value.vcu isa Absent || (_openapi_output["Vcu"] = _encode(_openapi_value.vcu))
    _openapi_value.vcl isa Absent || (_openapi_output["Vcl"] = _encode(_openapi_value.vcl))
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
            resource="https://openapi.invalid/schema/external-1a5d1206035c78c9facc.json",
            pointer="",
        ),
        _openapi_output,
        "encoding IEEEST";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::IEEEST)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.input_code isa Absent ||
        push!(_openapi_output, "input_code" => _openapi_value.input_code)
    _openapi_value.remote_bus_control isa Absent ||
        push!(_openapi_output, "remote_bus_control" => _openapi_value.remote_bus_control)
    _openapi_value.a1 isa Absent || push!(_openapi_output, "A1" => _openapi_value.a1)
    _openapi_value.a2 isa Absent || push!(_openapi_output, "A2" => _openapi_value.a2)
    _openapi_value.a3 isa Absent || push!(_openapi_output, "A3" => _openapi_value.a3)
    _openapi_value.a4 isa Absent || push!(_openapi_output, "A4" => _openapi_value.a4)
    _openapi_value.a5 isa Absent || push!(_openapi_output, "A5" => _openapi_value.a5)
    _openapi_value.a6 isa Absent || push!(_openapi_output, "A6" => _openapi_value.a6)
    _openapi_value.t1 isa Absent || push!(_openapi_output, "T1" => _openapi_value.t1)
    _openapi_value.t2 isa Absent || push!(_openapi_output, "T2" => _openapi_value.t2)
    _openapi_value.t3 isa Absent || push!(_openapi_output, "T3" => _openapi_value.t3)
    _openapi_value.t4 isa Absent || push!(_openapi_output, "T4" => _openapi_value.t4)
    _openapi_value.t5 isa Absent || push!(_openapi_output, "T5" => _openapi_value.t5)
    _openapi_value.t6 isa Absent || push!(_openapi_output, "T6" => _openapi_value.t6)
    _openapi_value.ks isa Absent || push!(_openapi_output, "Ks" => _openapi_value.ks)
    _openapi_value.ls_lim isa Absent ||
        push!(_openapi_output, "Ls_lim" => _openapi_value.ls_lim)
    _openapi_value.vcu isa Absent || push!(_openapi_output, "Vcu" => _openapi_value.vcu)
    _openapi_value.vcl isa Absent || push!(_openapi_output, "Vcl" => _openapi_value.vcl)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
