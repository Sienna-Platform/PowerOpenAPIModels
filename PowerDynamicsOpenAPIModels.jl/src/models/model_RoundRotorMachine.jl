"""
    RoundRotorMachine

Parameters of 4-states round-rotor synchronous machine with quadratic/exponential saturation: IEEE Std 1110 5.3.2 (Model 2.2). GENROU or GENROE model in PSSE and PSLF.

  - `id`: Unique integer identifier for this component.
  - `r`: Armature resistance.
  - `td0_p`: Time constant of transient d-axis voltage. Units: s.
  - `td0_pp`: Time constant of sub-transient d-axis voltage. Units: s.
  - `tq0_p`: Time constant of transient q-axis voltage. Units: s.
  - `tq0_pp`: Time constant of sub-transient q-axis voltage. Units: s.
  - `xd`: Reactance after EMF in d-axis.
  - `xq`: Reactance after EMF in q-axis.
  - `xd_p`: Transient reactance after EMF in d-axis.
  - `xq_p`: Transient reactance after EMF in q-axis.
  - `xd_pp`: Sub-Transient reactance after EMF in d-axis. Note: Xd_pp = Xq_pp.
  - `xl`: Stator leakage reactance.
  - `se`: Saturation factor at 1 and 1.2 pu flux: S(1.0) = B(|psi_pp|-A)^2.
  - `gamma_d1`: Do not modify
  - `gamma_q1`: Do not modify
  - `gamma_d2`: Do not modify
  - `gamma_q2`: Do not modify
  - `gamma_qd`: Do not modify
"""
Base.@kwdef struct RoundRotorMachine <: APIModel
    id::Int64
    r::Float64
    td0_p::Float64
    td0_pp::Float64
    tq0_p::Float64
    tq0_pp::Float64
    xd::Float64
    xq::Float64
    xd_p::Float64
    xq_p::Float64
    xd_pp::Float64
    xl::Float64
    se::Vector{Float64}
    gamma_d1::Float64
    gamma_q1::Float64
    gamma_d2::Float64
    gamma_q2::Float64
    gamma_qd::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{RoundRotorMachine}, value) = _decode(RoundRotorMachine, value, true)
function _decode(::Type{RoundRotorMachine}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-7c84d2adb355e61940ad.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding RoundRotorMachine";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "RoundRotorMachine")
    _openapi_field_id = _decode(
        Int64,
        _required(_openapi_object, "id", "RoundRotorMachine"),
        _openapi_validate,
    )
    _openapi_field_r = _decode(
        Float64,
        _required(_openapi_object, "R", "RoundRotorMachine"),
        _openapi_validate,
    )
    _openapi_field_td0_p = _decode(
        Float64,
        _required(_openapi_object, "Td0_p", "RoundRotorMachine"),
        _openapi_validate,
    )
    _openapi_field_td0_pp = _decode(
        Float64,
        _required(_openapi_object, "Td0_pp", "RoundRotorMachine"),
        _openapi_validate,
    )
    _openapi_field_tq0_p = _decode(
        Float64,
        _required(_openapi_object, "Tq0_p", "RoundRotorMachine"),
        _openapi_validate,
    )
    _openapi_field_tq0_pp = _decode(
        Float64,
        _required(_openapi_object, "Tq0_pp", "RoundRotorMachine"),
        _openapi_validate,
    )
    _openapi_field_xd = _decode(
        Float64,
        _required(_openapi_object, "Xd", "RoundRotorMachine"),
        _openapi_validate,
    )
    _openapi_field_xq = _decode(
        Float64,
        _required(_openapi_object, "Xq", "RoundRotorMachine"),
        _openapi_validate,
    )
    _openapi_field_xd_p = _decode(
        Float64,
        _required(_openapi_object, "Xd_p", "RoundRotorMachine"),
        _openapi_validate,
    )
    _openapi_field_xq_p = _decode(
        Float64,
        _required(_openapi_object, "Xq_p", "RoundRotorMachine"),
        _openapi_validate,
    )
    _openapi_field_xd_pp = _decode(
        Float64,
        _required(_openapi_object, "Xd_pp", "RoundRotorMachine"),
        _openapi_validate,
    )
    _openapi_field_xl = _decode(
        Float64,
        _required(_openapi_object, "Xl", "RoundRotorMachine"),
        _openapi_validate,
    )
    _openapi_field_se = _decode(
        Vector{Float64},
        _required(_openapi_object, "Se", "RoundRotorMachine"),
        _openapi_validate,
    )
    _openapi_field_gamma_d1 = _decode(
        Float64,
        _required(_openapi_object, "gamma_d1", "RoundRotorMachine"),
        _openapi_validate,
    )
    _openapi_field_gamma_q1 = _decode(
        Float64,
        _required(_openapi_object, "gamma_q1", "RoundRotorMachine"),
        _openapi_validate,
    )
    _openapi_field_gamma_d2 = _decode(
        Float64,
        _required(_openapi_object, "gamma_d2", "RoundRotorMachine"),
        _openapi_validate,
    )
    _openapi_field_gamma_q2 = _decode(
        Float64,
        _required(_openapi_object, "gamma_q2", "RoundRotorMachine"),
        _openapi_validate,
    )
    _openapi_field_gamma_qd = _decode(
        Float64,
        _required(_openapi_object, "gamma_qd", "RoundRotorMachine"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "R",
            "Td0_p",
            "Td0_pp",
            "Tq0_p",
            "Tq0_pp",
            "Xd",
            "Xq",
            "Xd_p",
            "Xq_p",
            "Xd_pp",
            "Xl",
            "Se",
            "gamma_d1",
            "gamma_q1",
            "gamma_d2",
            "gamma_q2",
            "gamma_qd",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return RoundRotorMachine(;
        id=_openapi_field_id,
        r=_openapi_field_r,
        td0_p=_openapi_field_td0_p,
        td0_pp=_openapi_field_td0_pp,
        tq0_p=_openapi_field_tq0_p,
        tq0_pp=_openapi_field_tq0_pp,
        xd=_openapi_field_xd,
        xq=_openapi_field_xq,
        xd_p=_openapi_field_xd_p,
        xq_p=_openapi_field_xq_p,
        xd_pp=_openapi_field_xd_pp,
        xl=_openapi_field_xl,
        se=_openapi_field_se,
        gamma_d1=_openapi_field_gamma_d1,
        gamma_q1=_openapi_field_gamma_q1,
        gamma_d2=_openapi_field_gamma_d2,
        gamma_q2=_openapi_field_gamma_q2,
        gamma_qd=_openapi_field_gamma_qd,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::RoundRotorMachine)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.r isa Absent || (_openapi_output["R"] = _encode(_openapi_value.r))
    _openapi_value.td0_p isa Absent ||
        (_openapi_output["Td0_p"] = _encode(_openapi_value.td0_p))
    _openapi_value.td0_pp isa Absent ||
        (_openapi_output["Td0_pp"] = _encode(_openapi_value.td0_pp))
    _openapi_value.tq0_p isa Absent ||
        (_openapi_output["Tq0_p"] = _encode(_openapi_value.tq0_p))
    _openapi_value.tq0_pp isa Absent ||
        (_openapi_output["Tq0_pp"] = _encode(_openapi_value.tq0_pp))
    _openapi_value.xd isa Absent || (_openapi_output["Xd"] = _encode(_openapi_value.xd))
    _openapi_value.xq isa Absent || (_openapi_output["Xq"] = _encode(_openapi_value.xq))
    _openapi_value.xd_p isa Absent ||
        (_openapi_output["Xd_p"] = _encode(_openapi_value.xd_p))
    _openapi_value.xq_p isa Absent ||
        (_openapi_output["Xq_p"] = _encode(_openapi_value.xq_p))
    _openapi_value.xd_pp isa Absent ||
        (_openapi_output["Xd_pp"] = _encode(_openapi_value.xd_pp))
    _openapi_value.xl isa Absent || (_openapi_output["Xl"] = _encode(_openapi_value.xl))
    _openapi_value.se isa Absent || (_openapi_output["Se"] = _encode(_openapi_value.se))
    _openapi_value.gamma_d1 isa Absent ||
        (_openapi_output["gamma_d1"] = _encode(_openapi_value.gamma_d1))
    _openapi_value.gamma_q1 isa Absent ||
        (_openapi_output["gamma_q1"] = _encode(_openapi_value.gamma_q1))
    _openapi_value.gamma_d2 isa Absent ||
        (_openapi_output["gamma_d2"] = _encode(_openapi_value.gamma_d2))
    _openapi_value.gamma_q2 isa Absent ||
        (_openapi_output["gamma_q2"] = _encode(_openapi_value.gamma_q2))
    _openapi_value.gamma_qd isa Absent ||
        (_openapi_output["gamma_qd"] = _encode(_openapi_value.gamma_qd))
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
            resource="https://openapi.invalid/schema/external-7c84d2adb355e61940ad.json",
            pointer="",
        ),
        _openapi_output,
        "encoding RoundRotorMachine";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::RoundRotorMachine)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.r isa Absent || push!(_openapi_output, "R" => _openapi_value.r)
    _openapi_value.td0_p isa Absent ||
        push!(_openapi_output, "Td0_p" => _openapi_value.td0_p)
    _openapi_value.td0_pp isa Absent ||
        push!(_openapi_output, "Td0_pp" => _openapi_value.td0_pp)
    _openapi_value.tq0_p isa Absent ||
        push!(_openapi_output, "Tq0_p" => _openapi_value.tq0_p)
    _openapi_value.tq0_pp isa Absent ||
        push!(_openapi_output, "Tq0_pp" => _openapi_value.tq0_pp)
    _openapi_value.xd isa Absent || push!(_openapi_output, "Xd" => _openapi_value.xd)
    _openapi_value.xq isa Absent || push!(_openapi_output, "Xq" => _openapi_value.xq)
    _openapi_value.xd_p isa Absent || push!(_openapi_output, "Xd_p" => _openapi_value.xd_p)
    _openapi_value.xq_p isa Absent || push!(_openapi_output, "Xq_p" => _openapi_value.xq_p)
    _openapi_value.xd_pp isa Absent ||
        push!(_openapi_output, "Xd_pp" => _openapi_value.xd_pp)
    _openapi_value.xl isa Absent || push!(_openapi_output, "Xl" => _openapi_value.xl)
    _openapi_value.se isa Absent || push!(_openapi_output, "Se" => _openapi_value.se)
    _openapi_value.gamma_d1 isa Absent ||
        push!(_openapi_output, "gamma_d1" => _openapi_value.gamma_d1)
    _openapi_value.gamma_q1 isa Absent ||
        push!(_openapi_output, "gamma_q1" => _openapi_value.gamma_q1)
    _openapi_value.gamma_d2 isa Absent ||
        push!(_openapi_output, "gamma_d2" => _openapi_value.gamma_d2)
    _openapi_value.gamma_q2 isa Absent ||
        push!(_openapi_output, "gamma_q2" => _openapi_value.gamma_q2)
    _openapi_value.gamma_qd isa Absent ||
        push!(_openapi_output, "gamma_qd" => _openapi_value.gamma_qd)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
