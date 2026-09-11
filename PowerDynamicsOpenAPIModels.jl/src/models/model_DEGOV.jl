"""
    DEGOV

Parameters Woodward Diesel Governor Model. DEGOV in PowerWorld

  - `k`: Governor gain (reciproical of droop)
  - `p_ref`: Reference power set-point
  - `t1`: Governor mechanism time constant
  - `t2`: Turbine power time constant
  - `t3`: Turbine exhaust temperature time constant
  - `t4`: Governor lead time constant
  - `t5`: Governor lag time constant
  - `t6`: Actuator time constant
  - `td`: Engine time delay
  - `id`: Unique integer identifier for this component
"""
Base.@kwdef struct DEGOV <: APIModel
    k::Float64
    p_ref::Union{Absent, Float64, Nothing} = ABSENT
    t1::Float64
    t2::Float64
    t3::Float64
    t4::Float64
    t5::Float64
    t6::Float64
    td::Float64
    id::Int64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{DEGOV}, value) = _decode(DEGOV, value, true)
function _decode(::Type{DEGOV}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-d5d2d2b15ebff194ab18.json",
            pointer="/components/schemas/DEGOV",
        ),
        _openapi_raw,
        "decoding DEGOV";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "DEGOV")
    _openapi_field_k =
        _decode(Float64, _required(_openapi_object, "K", "DEGOV"), _openapi_validate)
    _openapi_field_p_ref =
        haskey(_openapi_object, "P_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["P_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_t1 =
        _decode(Float64, _required(_openapi_object, "T1", "DEGOV"), _openapi_validate)
    _openapi_field_t2 =
        _decode(Float64, _required(_openapi_object, "T2", "DEGOV"), _openapi_validate)
    _openapi_field_t3 =
        _decode(Float64, _required(_openapi_object, "T3", "DEGOV"), _openapi_validate)
    _openapi_field_t4 =
        _decode(Float64, _required(_openapi_object, "T4", "DEGOV"), _openapi_validate)
    _openapi_field_t5 =
        _decode(Float64, _required(_openapi_object, "T5", "DEGOV"), _openapi_validate)
    _openapi_field_t6 =
        _decode(Float64, _required(_openapi_object, "T6", "DEGOV"), _openapi_validate)
    _openapi_field_td =
        _decode(Float64, _required(_openapi_object, "Td", "DEGOV"), _openapi_validate)
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "DEGOV"), _openapi_validate)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in
        ("K", "P_ref", "T1", "T2", "T3", "T4", "T5", "T6", "Td", "id") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return DEGOV(;
        k=_openapi_field_k,
        p_ref=_openapi_field_p_ref,
        t1=_openapi_field_t1,
        t2=_openapi_field_t2,
        t3=_openapi_field_t3,
        t4=_openapi_field_t4,
        t5=_openapi_field_t5,
        t6=_openapi_field_t6,
        td=_openapi_field_td,
        id=_openapi_field_id,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::DEGOV)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.k isa Absent || (_openapi_output["K"] = _encode(_openapi_value.k))
    _openapi_value.p_ref isa Absent ||
        (_openapi_output["P_ref"] = _encode(_openapi_value.p_ref))
    _openapi_value.t1 isa Absent || (_openapi_output["T1"] = _encode(_openapi_value.t1))
    _openapi_value.t2 isa Absent || (_openapi_output["T2"] = _encode(_openapi_value.t2))
    _openapi_value.t3 isa Absent || (_openapi_output["T3"] = _encode(_openapi_value.t3))
    _openapi_value.t4 isa Absent || (_openapi_output["T4"] = _encode(_openapi_value.t4))
    _openapi_value.t5 isa Absent || (_openapi_output["T5"] = _encode(_openapi_value.t5))
    _openapi_value.t6 isa Absent || (_openapi_output["T6"] = _encode(_openapi_value.t6))
    _openapi_value.td isa Absent || (_openapi_output["Td"] = _encode(_openapi_value.td))
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
            pointer="/components/schemas/DEGOV",
        ),
        _openapi_output,
        "encoding DEGOV";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::DEGOV)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.k isa Absent || push!(_openapi_output, "K" => _openapi_value.k)
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    _openapi_value.t1 isa Absent || push!(_openapi_output, "T1" => _openapi_value.t1)
    _openapi_value.t2 isa Absent || push!(_openapi_output, "T2" => _openapi_value.t2)
    _openapi_value.t3 isa Absent || push!(_openapi_output, "T3" => _openapi_value.t3)
    _openapi_value.t4 isa Absent || push!(_openapi_output, "T4" => _openapi_value.t4)
    _openapi_value.t5 isa Absent || push!(_openapi_output, "T5" => _openapi_value.t5)
    _openapi_value.t6 isa Absent || push!(_openapi_output, "T6" => _openapi_value.t6)
    _openapi_value.td isa Absent || push!(_openapi_output, "Td" => _openapi_value.td)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
