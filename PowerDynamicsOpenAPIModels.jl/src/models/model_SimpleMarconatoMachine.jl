"""
    SimpleMarconatoMachine

Parameters of 4-states synchronous machine: Simplified Marconato model The derivative of stator fluxes (ψd and ψq) is neglected and ωψd = ψd and ωψq = ψq is assumed (i.e. ω=1.0). This is standard when transmission network dynamics is neglected

  - `id`: Unique integer identifier for this component
  - `r`: Resistance after EMF
  - `xd`: Reactance after EMF in d-axis
  - `xq`: Reactance after EMF in q-axis
  - `xd_p`: Transient reactance after EMF in d-axis
  - `xq_p`: Transient reactance after EMF in q-axis
  - `xd_pp`: Sub-Transient reactance after EMF in d-axis
  - `xq_pp`: Sub-Transient reactance after EMF in q-axis
  - `td0_p`: Time constant of transient d-axis voltage
  - `tq0_p`: Time constant of transient q-axis voltage
  - `td0_pp`: Time constant of sub-transient d-axis voltage
  - `tq0_pp`: Time constant of sub-transient q-axis voltage
  - `t_aa`: Time constant of d-axis additional leakage
"""
Base.@kwdef struct SimpleMarconatoMachine <: APIModel
    id::Int64
    r::Float64
    xd::Float64
    xq::Float64
    xd_p::Float64
    xq_p::Float64
    xd_pp::Float64
    xq_pp::Float64
    td0_p::Float64
    tq0_p::Float64
    td0_pp::Float64
    tq0_pp::Float64
    t_aa::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{SimpleMarconatoMachine}, value) =
    _decode(SimpleMarconatoMachine, value, true)
function _decode(::Type{SimpleMarconatoMachine}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-fbd193e7333be11f10a3.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding SimpleMarconatoMachine";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "SimpleMarconatoMachine")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "SimpleMarconatoMachine"), false)
    _openapi_field_r =
        _decode(Float64, _required(_openapi_object, "R", "SimpleMarconatoMachine"), false)
    _openapi_field_xd =
        _decode(Float64, _required(_openapi_object, "Xd", "SimpleMarconatoMachine"), false)
    _openapi_field_xq =
        _decode(Float64, _required(_openapi_object, "Xq", "SimpleMarconatoMachine"), false)
    _openapi_field_xd_p = _decode(
        Float64,
        _required(_openapi_object, "Xd_p", "SimpleMarconatoMachine"),
        false,
    )
    _openapi_field_xq_p = _decode(
        Float64,
        _required(_openapi_object, "Xq_p", "SimpleMarconatoMachine"),
        false,
    )
    _openapi_field_xd_pp = _decode(
        Float64,
        _required(_openapi_object, "Xd_pp", "SimpleMarconatoMachine"),
        false,
    )
    _openapi_field_xq_pp = _decode(
        Float64,
        _required(_openapi_object, "Xq_pp", "SimpleMarconatoMachine"),
        false,
    )
    _openapi_field_td0_p = _decode(
        Float64,
        _required(_openapi_object, "Td0_p", "SimpleMarconatoMachine"),
        false,
    )
    _openapi_field_tq0_p = _decode(
        Float64,
        _required(_openapi_object, "Tq0_p", "SimpleMarconatoMachine"),
        false,
    )
    _openapi_field_td0_pp = _decode(
        Float64,
        _required(_openapi_object, "Td0_pp", "SimpleMarconatoMachine"),
        false,
    )
    _openapi_field_tq0_pp = _decode(
        Float64,
        _required(_openapi_object, "Tq0_pp", "SimpleMarconatoMachine"),
        false,
    )
    _openapi_field_t_aa = _decode(
        Float64,
        _required(_openapi_object, "T_AA", "SimpleMarconatoMachine"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "R",
            "Xd",
            "Xq",
            "Xd_p",
            "Xq_p",
            "Xd_pp",
            "Xq_pp",
            "Td0_p",
            "Tq0_p",
            "Td0_pp",
            "Tq0_pp",
            "T_AA",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return SimpleMarconatoMachine(;
        id=_openapi_field_id,
        r=_openapi_field_r,
        xd=_openapi_field_xd,
        xq=_openapi_field_xq,
        xd_p=_openapi_field_xd_p,
        xq_p=_openapi_field_xq_p,
        xd_pp=_openapi_field_xd_pp,
        xq_pp=_openapi_field_xq_pp,
        td0_p=_openapi_field_td0_p,
        tq0_p=_openapi_field_tq0_p,
        td0_pp=_openapi_field_td0_pp,
        tq0_pp=_openapi_field_tq0_pp,
        t_aa=_openapi_field_t_aa,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::SimpleMarconatoMachine)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.r isa Absent ||
        (_openapi_output["R"] = _encode_unvalidated(_openapi_value.r))
    _openapi_value.xd isa Absent ||
        (_openapi_output["Xd"] = _encode_unvalidated(_openapi_value.xd))
    _openapi_value.xq isa Absent ||
        (_openapi_output["Xq"] = _encode_unvalidated(_openapi_value.xq))
    _openapi_value.xd_p isa Absent ||
        (_openapi_output["Xd_p"] = _encode_unvalidated(_openapi_value.xd_p))
    _openapi_value.xq_p isa Absent ||
        (_openapi_output["Xq_p"] = _encode_unvalidated(_openapi_value.xq_p))
    _openapi_value.xd_pp isa Absent ||
        (_openapi_output["Xd_pp"] = _encode_unvalidated(_openapi_value.xd_pp))
    _openapi_value.xq_pp isa Absent ||
        (_openapi_output["Xq_pp"] = _encode_unvalidated(_openapi_value.xq_pp))
    _openapi_value.td0_p isa Absent ||
        (_openapi_output["Td0_p"] = _encode_unvalidated(_openapi_value.td0_p))
    _openapi_value.tq0_p isa Absent ||
        (_openapi_output["Tq0_p"] = _encode_unvalidated(_openapi_value.tq0_p))
    _openapi_value.td0_pp isa Absent ||
        (_openapi_output["Td0_pp"] = _encode_unvalidated(_openapi_value.td0_pp))
    _openapi_value.tq0_pp isa Absent ||
        (_openapi_output["Tq0_pp"] = _encode_unvalidated(_openapi_value.tq0_pp))
    _openapi_value.t_aa isa Absent ||
        (_openapi_output["T_AA"] = _encode_unvalidated(_openapi_value.t_aa))
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
_encode(_openapi_value::SimpleMarconatoMachine) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-fbd193e7333be11f10a3.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding SimpleMarconatoMachine";
    direction=:neutral,
)

function _form_fields(_openapi_value::SimpleMarconatoMachine)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.r isa Absent || push!(_openapi_output, "R" => _openapi_value.r)
    _openapi_value.xd isa Absent || push!(_openapi_output, "Xd" => _openapi_value.xd)
    _openapi_value.xq isa Absent || push!(_openapi_output, "Xq" => _openapi_value.xq)
    _openapi_value.xd_p isa Absent || push!(_openapi_output, "Xd_p" => _openapi_value.xd_p)
    _openapi_value.xq_p isa Absent || push!(_openapi_output, "Xq_p" => _openapi_value.xq_p)
    _openapi_value.xd_pp isa Absent ||
        push!(_openapi_output, "Xd_pp" => _openapi_value.xd_pp)
    _openapi_value.xq_pp isa Absent ||
        push!(_openapi_output, "Xq_pp" => _openapi_value.xq_pp)
    _openapi_value.td0_p isa Absent ||
        push!(_openapi_output, "Td0_p" => _openapi_value.td0_p)
    _openapi_value.tq0_p isa Absent ||
        push!(_openapi_output, "Tq0_p" => _openapi_value.tq0_p)
    _openapi_value.td0_pp isa Absent ||
        push!(_openapi_output, "Td0_pp" => _openapi_value.td0_pp)
    _openapi_value.tq0_pp isa Absent ||
        push!(_openapi_output, "Tq0_pp" => _openapi_value.tq0_pp)
    _openapi_value.t_aa isa Absent || push!(_openapi_output, "T_AA" => _openapi_value.t_aa)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
