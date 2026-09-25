"""
    DEGOV

Parameters Woodward Diesel Governor Model. DEGOV in PowerWorld

  - `id`: Unique integer identifier for this component
  - `t1`: Governor mechanism time constant
  - `t2`: Turbine power time constant
  - `t3`: Turbine exhaust temperature time constant
  - `k`: Governor gain (reciproical of droop)
  - `t4`: Governor lead time constant
  - `t5`: Governor lag time constant
  - `t6`: Actuator time constant
  - `td`: Engine time delay
  - `p_ref`: Reference power set-point
"""
Base.@kwdef struct DEGOV <: APIModel
    id::Int64
    t1::Float64
    t2::Float64
    t3::Float64
    k::Float64
    t4::Float64
    t5::Float64
    t6::Float64
    td::Float64
    p_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{DEGOV}, value) = _decode(DEGOV, value, true)
function _decode(::Type{DEGOV}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-29e444382478113241cb.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding DEGOV";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "DEGOV")
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "DEGOV"), false)
    _openapi_field_t1 = _decode(Float64, _required(_openapi_object, "T1", "DEGOV"), false)
    _openapi_field_t2 = _decode(Float64, _required(_openapi_object, "T2", "DEGOV"), false)
    _openapi_field_t3 = _decode(Float64, _required(_openapi_object, "T3", "DEGOV"), false)
    _openapi_field_k = _decode(Float64, _required(_openapi_object, "K", "DEGOV"), false)
    _openapi_field_t4 = _decode(Float64, _required(_openapi_object, "T4", "DEGOV"), false)
    _openapi_field_t5 = _decode(Float64, _required(_openapi_object, "T5", "DEGOV"), false)
    _openapi_field_t6 = _decode(Float64, _required(_openapi_object, "T6", "DEGOV"), false)
    _openapi_field_td = _decode(Float64, _required(_openapi_object, "Td", "DEGOV"), false)
    _openapi_field_p_ref =
        haskey(_openapi_object, "P_ref") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["P_ref"], false) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in
        ("id", "T1", "T2", "T3", "K", "T4", "T5", "T6", "Td", "P_ref") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return DEGOV(;
        id=_openapi_field_id,
        t1=_openapi_field_t1,
        t2=_openapi_field_t2,
        t3=_openapi_field_t3,
        k=_openapi_field_k,
        t4=_openapi_field_t4,
        t5=_openapi_field_t5,
        t6=_openapi_field_t6,
        td=_openapi_field_td,
        p_ref=_openapi_field_p_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::DEGOV)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.t1 isa Absent ||
        (_openapi_output["T1"] = _encode_unvalidated(_openapi_value.t1))
    _openapi_value.t2 isa Absent ||
        (_openapi_output["T2"] = _encode_unvalidated(_openapi_value.t2))
    _openapi_value.t3 isa Absent ||
        (_openapi_output["T3"] = _encode_unvalidated(_openapi_value.t3))
    _openapi_value.k isa Absent ||
        (_openapi_output["K"] = _encode_unvalidated(_openapi_value.k))
    _openapi_value.t4 isa Absent ||
        (_openapi_output["T4"] = _encode_unvalidated(_openapi_value.t4))
    _openapi_value.t5 isa Absent ||
        (_openapi_output["T5"] = _encode_unvalidated(_openapi_value.t5))
    _openapi_value.t6 isa Absent ||
        (_openapi_output["T6"] = _encode_unvalidated(_openapi_value.t6))
    _openapi_value.td isa Absent ||
        (_openapi_output["Td"] = _encode_unvalidated(_openapi_value.td))
    _openapi_value.p_ref isa Absent ||
        (_openapi_output["P_ref"] = _encode_unvalidated(_openapi_value.p_ref))
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
_encode(_openapi_value::DEGOV) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-29e444382478113241cb.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding DEGOV";
    direction=:neutral,
)

function _form_fields(_openapi_value::DEGOV)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.t1 isa Absent || push!(_openapi_output, "T1" => _openapi_value.t1)
    _openapi_value.t2 isa Absent || push!(_openapi_output, "T2" => _openapi_value.t2)
    _openapi_value.t3 isa Absent || push!(_openapi_output, "T3" => _openapi_value.t3)
    _openapi_value.k isa Absent || push!(_openapi_output, "K" => _openapi_value.k)
    _openapi_value.t4 isa Absent || push!(_openapi_output, "T4" => _openapi_value.t4)
    _openapi_value.t5 isa Absent || push!(_openapi_output, "T5" => _openapi_value.t5)
    _openapi_value.t6 isa Absent || push!(_openapi_output, "T6" => _openapi_value.t6)
    _openapi_value.td isa Absent || push!(_openapi_output, "Td" => _openapi_value.td)
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
