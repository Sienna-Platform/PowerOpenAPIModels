"""
    STAB1

Speed-sensitive stabilizing model

  - `h_lim`: PSS output limit
  - `kt`: K/T for washout filter
  - `t`: Time constant for washout filter
  - `t1t3`: Time constant division T1/T3
  - `t2t4`: Time constant division T2/T4
  - `t3`: Time constant
  - `t4`: Time constant
  - `id`: Unique integer identifier for this component
"""
Base.@kwdef struct STAB1 <: APIModel
    h_lim::Float64
    kt::Float64
    t::Float64
    t1t3::Float64
    t2t4::Float64
    t3::Float64
    t4::Float64
    id::Int64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{STAB1}, value) = _decode(STAB1, value, true)
function _decode(::Type{STAB1}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-d5d2d2b15ebff194ab18.json",
            pointer="/components/schemas/STAB1",
        ),
        _openapi_raw,
        "decoding STAB1";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "STAB1")
    _openapi_field_h_lim =
        _decode(Float64, _required(_openapi_object, "H_lim", "STAB1"), _openapi_validate)
    _openapi_field_kt =
        _decode(Float64, _required(_openapi_object, "KT", "STAB1"), _openapi_validate)
    _openapi_field_t =
        _decode(Float64, _required(_openapi_object, "T", "STAB1"), _openapi_validate)
    _openapi_field_t1t3 =
        _decode(Float64, _required(_openapi_object, "T1T3", "STAB1"), _openapi_validate)
    _openapi_field_t2t4 =
        _decode(Float64, _required(_openapi_object, "T2T4", "STAB1"), _openapi_validate)
    _openapi_field_t3 =
        _decode(Float64, _required(_openapi_object, "T3", "STAB1"), _openapi_validate)
    _openapi_field_t4 =
        _decode(Float64, _required(_openapi_object, "T4", "STAB1"), _openapi_validate)
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "STAB1"), _openapi_validate)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("H_lim", "KT", "T", "T1T3", "T2T4", "T3", "T4", "id") &&
            continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return STAB1(;
        h_lim=_openapi_field_h_lim,
        kt=_openapi_field_kt,
        t=_openapi_field_t,
        t1t3=_openapi_field_t1t3,
        t2t4=_openapi_field_t2t4,
        t3=_openapi_field_t3,
        t4=_openapi_field_t4,
        id=_openapi_field_id,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::STAB1)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.h_lim isa Absent ||
        (_openapi_output["H_lim"] = _encode(_openapi_value.h_lim))
    _openapi_value.kt isa Absent || (_openapi_output["KT"] = _encode(_openapi_value.kt))
    _openapi_value.t isa Absent || (_openapi_output["T"] = _encode(_openapi_value.t))
    _openapi_value.t1t3 isa Absent ||
        (_openapi_output["T1T3"] = _encode(_openapi_value.t1t3))
    _openapi_value.t2t4 isa Absent ||
        (_openapi_output["T2T4"] = _encode(_openapi_value.t2t4))
    _openapi_value.t3 isa Absent || (_openapi_output["T3"] = _encode(_openapi_value.t3))
    _openapi_value.t4 isa Absent || (_openapi_output["T4"] = _encode(_openapi_value.t4))
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
            pointer="/components/schemas/STAB1",
        ),
        _openapi_output,
        "encoding STAB1";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::STAB1)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.h_lim isa Absent ||
        push!(_openapi_output, "H_lim" => _openapi_value.h_lim)
    _openapi_value.kt isa Absent || push!(_openapi_output, "KT" => _openapi_value.kt)
    _openapi_value.t isa Absent || push!(_openapi_output, "T" => _openapi_value.t)
    _openapi_value.t1t3 isa Absent || push!(_openapi_output, "T1T3" => _openapi_value.t1t3)
    _openapi_value.t2t4 isa Absent || push!(_openapi_output, "T2T4" => _openapi_value.t2t4)
    _openapi_value.t3 isa Absent || push!(_openapi_output, "T3" => _openapi_value.t3)
    _openapi_value.t4 isa Absent || push!(_openapi_output, "T4" => _openapi_value.t4)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
