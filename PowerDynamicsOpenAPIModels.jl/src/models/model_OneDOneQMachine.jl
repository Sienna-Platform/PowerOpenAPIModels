"""
    OneDOneQMachine

Parameters of 4-states synchronous machine: Simplified Marconato model The derivative of stator fluxes (ψd and ψq) is neglected and ωψd = ψd and ωψq = ψq is assumed (i.e. ω=1.0). This is standard when transmission network dynamics is neglected

  - `r`: Resistance after EMF
  - `td0_p`: Time constant of transient d-axis voltage
  - `tq0_p`: Time constant of transient q-axis voltage
  - `xd`: Reactance after EMF in d-axis
  - `xd_p`: Transient reactance after EMF in d-axis
  - `xq`: Reactance after EMF in q-axis
  - `xq_p`: Transient reactance after EMF in q-axis
  - `id`: Unique integer identifier for this component
"""
Base.@kwdef struct OneDOneQMachine <: APIModel
    r::Float64
    td0_p::Float64
    tq0_p::Float64
    xd::Float64
    xd_p::Float64
    xq::Float64
    xq_p::Float64
    id::Int64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{OneDOneQMachine}, value) = _decode(OneDOneQMachine, value, true)
function _decode(::Type{OneDOneQMachine}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-d5d2d2b15ebff194ab18.json",
            pointer="/components/schemas/OneDOneQMachine",
        ),
        _openapi_raw,
        "decoding OneDOneQMachine";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "OneDOneQMachine")
    _openapi_field_r = _decode(
        Float64,
        _required(_openapi_object, "R", "OneDOneQMachine"),
        _openapi_validate,
    )
    _openapi_field_td0_p = _decode(
        Float64,
        _required(_openapi_object, "Td0_p", "OneDOneQMachine"),
        _openapi_validate,
    )
    _openapi_field_tq0_p = _decode(
        Float64,
        _required(_openapi_object, "Tq0_p", "OneDOneQMachine"),
        _openapi_validate,
    )
    _openapi_field_xd = _decode(
        Float64,
        _required(_openapi_object, "Xd", "OneDOneQMachine"),
        _openapi_validate,
    )
    _openapi_field_xd_p = _decode(
        Float64,
        _required(_openapi_object, "Xd_p", "OneDOneQMachine"),
        _openapi_validate,
    )
    _openapi_field_xq = _decode(
        Float64,
        _required(_openapi_object, "Xq", "OneDOneQMachine"),
        _openapi_validate,
    )
    _openapi_field_xq_p = _decode(
        Float64,
        _required(_openapi_object, "Xq_p", "OneDOneQMachine"),
        _openapi_validate,
    )
    _openapi_field_id = _decode(
        Int64,
        _required(_openapi_object, "id", "OneDOneQMachine"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("R", "Td0_p", "Tq0_p", "Xd", "Xd_p", "Xq", "Xq_p", "id") &&
            continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return OneDOneQMachine(;
        r=_openapi_field_r,
        td0_p=_openapi_field_td0_p,
        tq0_p=_openapi_field_tq0_p,
        xd=_openapi_field_xd,
        xd_p=_openapi_field_xd_p,
        xq=_openapi_field_xq,
        xq_p=_openapi_field_xq_p,
        id=_openapi_field_id,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::OneDOneQMachine)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.r isa Absent || (_openapi_output["R"] = _encode(_openapi_value.r))
    _openapi_value.td0_p isa Absent ||
        (_openapi_output["Td0_p"] = _encode(_openapi_value.td0_p))
    _openapi_value.tq0_p isa Absent ||
        (_openapi_output["Tq0_p"] = _encode(_openapi_value.tq0_p))
    _openapi_value.xd isa Absent || (_openapi_output["Xd"] = _encode(_openapi_value.xd))
    _openapi_value.xd_p isa Absent ||
        (_openapi_output["Xd_p"] = _encode(_openapi_value.xd_p))
    _openapi_value.xq isa Absent || (_openapi_output["Xq"] = _encode(_openapi_value.xq))
    _openapi_value.xq_p isa Absent ||
        (_openapi_output["Xq_p"] = _encode(_openapi_value.xq_p))
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
            pointer="/components/schemas/OneDOneQMachine",
        ),
        _openapi_output,
        "encoding OneDOneQMachine";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::OneDOneQMachine)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.r isa Absent || push!(_openapi_output, "R" => _openapi_value.r)
    _openapi_value.td0_p isa Absent ||
        push!(_openapi_output, "Td0_p" => _openapi_value.td0_p)
    _openapi_value.tq0_p isa Absent ||
        push!(_openapi_output, "Tq0_p" => _openapi_value.tq0_p)
    _openapi_value.xd isa Absent || push!(_openapi_output, "Xd" => _openapi_value.xd)
    _openapi_value.xd_p isa Absent || push!(_openapi_output, "Xd_p" => _openapi_value.xd_p)
    _openapi_value.xq isa Absent || push!(_openapi_output, "Xq" => _openapi_value.xq)
    _openapi_value.xq_p isa Absent || push!(_openapi_output, "Xq_p" => _openapi_value.xq_p)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
