"""
    SalientPoleMachine

Parameters of 3-states salient-pole synchronous machine with quadratic/exponential saturation: IEEE Std 1110 §5.3.1 (Model 2.1). GENSAL or GENSAE model in PSSE and PSLF

  - `id`: Unique integer identifier for this component
  - `r`: Armature resistance
  - `td0_p`: Time constant of transient d-axis voltage Units: s.
  - `td0_pp`: Time constant of sub-transient d-axis voltage Units: s.
  - `tq0_pp`: Time constant of sub-transient q-axis voltage Units: s.
  - `xd`: Reactance after EMF in d-axis
  - `xq`: Reactance after EMF in q-axis
  - `xd_p`: Transient reactance after EMF in d-axis
  - `xd_pp`: Sub-Transient reactance after EMF in d-axis. Note: Xd_pp = Xq_pp
  - `xl`: Stator leakage reactance
  - `se`: Saturation factor at 1 and 1.2 pu flux: Se(eqp) = B(eqp-A)^2
"""
Base.@kwdef struct SalientPoleMachine <: APIModel
    id::Int64
    r::Float64
    td0_p::Float64
    td0_pp::Float64
    tq0_pp::Float64
    xd::Float64
    xq::Float64
    xd_p::Float64
    xd_pp::Float64
    xl::Float64
    se::Vector{Float64}
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{SalientPoleMachine}, value) = _decode(SalientPoleMachine, value, true)
function _decode(::Type{SalientPoleMachine}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-17e7baaf5939b2a309ff.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding SalientPoleMachine";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "SalientPoleMachine")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "SalientPoleMachine"), false)
    _openapi_field_r =
        _decode(Float64, _required(_openapi_object, "R", "SalientPoleMachine"), false)
    _openapi_field_td0_p =
        _decode(Float64, _required(_openapi_object, "Td0_p", "SalientPoleMachine"), false)
    _openapi_field_td0_pp =
        _decode(Float64, _required(_openapi_object, "Td0_pp", "SalientPoleMachine"), false)
    _openapi_field_tq0_pp =
        _decode(Float64, _required(_openapi_object, "Tq0_pp", "SalientPoleMachine"), false)
    _openapi_field_xd =
        _decode(Float64, _required(_openapi_object, "Xd", "SalientPoleMachine"), false)
    _openapi_field_xq =
        _decode(Float64, _required(_openapi_object, "Xq", "SalientPoleMachine"), false)
    _openapi_field_xd_p =
        _decode(Float64, _required(_openapi_object, "Xd_p", "SalientPoleMachine"), false)
    _openapi_field_xd_pp =
        _decode(Float64, _required(_openapi_object, "Xd_pp", "SalientPoleMachine"), false)
    _openapi_field_xl =
        _decode(Float64, _required(_openapi_object, "Xl", "SalientPoleMachine"), false)
    _openapi_field_se = _decode(
        Vector{Float64},
        _required(_openapi_object, "Se", "SalientPoleMachine"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in
        ("id", "R", "Td0_p", "Td0_pp", "Tq0_pp", "Xd", "Xq", "Xd_p", "Xd_pp", "Xl", "Se") &&
            continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return SalientPoleMachine(;
        id=_openapi_field_id,
        r=_openapi_field_r,
        td0_p=_openapi_field_td0_p,
        td0_pp=_openapi_field_td0_pp,
        tq0_pp=_openapi_field_tq0_pp,
        xd=_openapi_field_xd,
        xq=_openapi_field_xq,
        xd_p=_openapi_field_xd_p,
        xd_pp=_openapi_field_xd_pp,
        xl=_openapi_field_xl,
        se=_openapi_field_se,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::SalientPoleMachine)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.r isa Absent ||
        (_openapi_output["R"] = _encode_unvalidated(_openapi_value.r))
    _openapi_value.td0_p isa Absent ||
        (_openapi_output["Td0_p"] = _encode_unvalidated(_openapi_value.td0_p))
    _openapi_value.td0_pp isa Absent ||
        (_openapi_output["Td0_pp"] = _encode_unvalidated(_openapi_value.td0_pp))
    _openapi_value.tq0_pp isa Absent ||
        (_openapi_output["Tq0_pp"] = _encode_unvalidated(_openapi_value.tq0_pp))
    _openapi_value.xd isa Absent ||
        (_openapi_output["Xd"] = _encode_unvalidated(_openapi_value.xd))
    _openapi_value.xq isa Absent ||
        (_openapi_output["Xq"] = _encode_unvalidated(_openapi_value.xq))
    _openapi_value.xd_p isa Absent ||
        (_openapi_output["Xd_p"] = _encode_unvalidated(_openapi_value.xd_p))
    _openapi_value.xd_pp isa Absent ||
        (_openapi_output["Xd_pp"] = _encode_unvalidated(_openapi_value.xd_pp))
    _openapi_value.xl isa Absent ||
        (_openapi_output["Xl"] = _encode_unvalidated(_openapi_value.xl))
    _openapi_value.se isa Absent ||
        (_openapi_output["Se"] = _encode_unvalidated(_openapi_value.se))
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
_encode(_openapi_value::SalientPoleMachine) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-17e7baaf5939b2a309ff.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding SalientPoleMachine";
    direction=:neutral,
)

function _form_fields(_openapi_value::SalientPoleMachine)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.r isa Absent || push!(_openapi_output, "R" => _openapi_value.r)
    _openapi_value.td0_p isa Absent ||
        push!(_openapi_output, "Td0_p" => _openapi_value.td0_p)
    _openapi_value.td0_pp isa Absent ||
        push!(_openapi_output, "Td0_pp" => _openapi_value.td0_pp)
    _openapi_value.tq0_pp isa Absent ||
        push!(_openapi_output, "Tq0_pp" => _openapi_value.tq0_pp)
    _openapi_value.xd isa Absent || push!(_openapi_output, "Xd" => _openapi_value.xd)
    _openapi_value.xq isa Absent || push!(_openapi_output, "Xq" => _openapi_value.xq)
    _openapi_value.xd_p isa Absent || push!(_openapi_output, "Xd_p" => _openapi_value.xd_p)
    _openapi_value.xd_pp isa Absent ||
        push!(_openapi_output, "Xd_pp" => _openapi_value.xd_pp)
    _openapi_value.xl isa Absent || push!(_openapi_output, "Xl" => _openapi_value.xl)
    _openapi_value.se isa Absent || push!(_openapi_output, "Se" => _openapi_value.se)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
