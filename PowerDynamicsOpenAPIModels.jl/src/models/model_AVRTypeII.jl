"""
    AVRTypeII

Parameters of an Automatic Voltage Regulator Type II - Typical static exciter model

  - `ae`: 1st ceiling coefficient
  - `be`: 2nd ceiling coefficient
  - `k0`: Regulator gain
  - `t1`: First pole in s
  - `t2`: First zero in s
  - `t3`: First pole in s
  - `t4`: First zero in s
  - `te`: Field circuit time constant
  - `tr`: Voltage measurement time constant
  - `v_ref`: Reference voltage set-point
  - `va_lim`: Limits for pi controller
  - `id`: Unique integer identifier for this component
"""
Base.@kwdef struct AVRTypeII <: APIModel
    ae::Float64
    be::Float64
    k0::Float64
    t1::Float64
    t2::Float64
    t3::Float64
    t4::Union{Absent, Float64, Nothing} = ABSENT
    te::Float64
    tr::Float64
    v_ref::Union{Absent, Float64, Nothing} = ABSENT
    va_lim::MinMax
    id::Int64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{AVRTypeII}, value) = _decode(AVRTypeII, value, true)
function _decode(::Type{AVRTypeII}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-d5d2d2b15ebff194ab18.json",
            pointer="/components/schemas/AVRTypeII",
        ),
        _openapi_raw,
        "decoding AVRTypeII";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "AVRTypeII")
    _openapi_field_ae =
        _decode(Float64, _required(_openapi_object, "Ae", "AVRTypeII"), _openapi_validate)
    _openapi_field_be =
        _decode(Float64, _required(_openapi_object, "Be", "AVRTypeII"), _openapi_validate)
    _openapi_field_k0 =
        _decode(Float64, _required(_openapi_object, "K0", "AVRTypeII"), _openapi_validate)
    _openapi_field_t1 =
        _decode(Float64, _required(_openapi_object, "T1", "AVRTypeII"), _openapi_validate)
    _openapi_field_t2 =
        _decode(Float64, _required(_openapi_object, "T2", "AVRTypeII"), _openapi_validate)
    _openapi_field_t3 =
        _decode(Float64, _required(_openapi_object, "T3", "AVRTypeII"), _openapi_validate)
    _openapi_field_t4 =
        haskey(_openapi_object, "T4") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["T4"], _openapi_validate) :
        ABSENT
    _openapi_field_te =
        _decode(Float64, _required(_openapi_object, "Te", "AVRTypeII"), _openapi_validate)
    _openapi_field_tr =
        _decode(Float64, _required(_openapi_object, "Tr", "AVRTypeII"), _openapi_validate)
    _openapi_field_v_ref =
        haskey(_openapi_object, "V_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["V_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_va_lim = _decode(
        MinMax,
        _required(_openapi_object, "Va_lim", "AVRTypeII"),
        _openapi_validate,
    )
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "AVRTypeII"), _openapi_validate)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in
        ("Ae", "Be", "K0", "T1", "T2", "T3", "T4", "Te", "Tr", "V_ref", "Va_lim", "id") &&
            continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return AVRTypeII(;
        ae=_openapi_field_ae,
        be=_openapi_field_be,
        k0=_openapi_field_k0,
        t1=_openapi_field_t1,
        t2=_openapi_field_t2,
        t3=_openapi_field_t3,
        t4=_openapi_field_t4,
        te=_openapi_field_te,
        tr=_openapi_field_tr,
        v_ref=_openapi_field_v_ref,
        va_lim=_openapi_field_va_lim,
        id=_openapi_field_id,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::AVRTypeII)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.ae isa Absent || (_openapi_output["Ae"] = _encode(_openapi_value.ae))
    _openapi_value.be isa Absent || (_openapi_output["Be"] = _encode(_openapi_value.be))
    _openapi_value.k0 isa Absent || (_openapi_output["K0"] = _encode(_openapi_value.k0))
    _openapi_value.t1 isa Absent || (_openapi_output["T1"] = _encode(_openapi_value.t1))
    _openapi_value.t2 isa Absent || (_openapi_output["T2"] = _encode(_openapi_value.t2))
    _openapi_value.t3 isa Absent || (_openapi_output["T3"] = _encode(_openapi_value.t3))
    _openapi_value.t4 isa Absent || (_openapi_output["T4"] = _encode(_openapi_value.t4))
    _openapi_value.te isa Absent || (_openapi_output["Te"] = _encode(_openapi_value.te))
    _openapi_value.tr isa Absent || (_openapi_output["Tr"] = _encode(_openapi_value.tr))
    _openapi_value.v_ref isa Absent ||
        (_openapi_output["V_ref"] = _encode(_openapi_value.v_ref))
    _openapi_value.va_lim isa Absent ||
        (_openapi_output["Va_lim"] = _encode(_openapi_value.va_lim))
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
            pointer="/components/schemas/AVRTypeII",
        ),
        _openapi_output,
        "encoding AVRTypeII";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::AVRTypeII)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.ae isa Absent || push!(_openapi_output, "Ae" => _openapi_value.ae)
    _openapi_value.be isa Absent || push!(_openapi_output, "Be" => _openapi_value.be)
    _openapi_value.k0 isa Absent || push!(_openapi_output, "K0" => _openapi_value.k0)
    _openapi_value.t1 isa Absent || push!(_openapi_output, "T1" => _openapi_value.t1)
    _openapi_value.t2 isa Absent || push!(_openapi_output, "T2" => _openapi_value.t2)
    _openapi_value.t3 isa Absent || push!(_openapi_output, "T3" => _openapi_value.t3)
    _openapi_value.t4 isa Absent || push!(_openapi_output, "T4" => _openapi_value.t4)
    _openapi_value.te isa Absent || push!(_openapi_output, "Te" => _openapi_value.te)
    _openapi_value.tr isa Absent || push!(_openapi_output, "Tr" => _openapi_value.tr)
    _openapi_value.v_ref isa Absent ||
        push!(_openapi_output, "V_ref" => _openapi_value.v_ref)
    _openapi_value.va_lim isa Absent ||
        push!(_openapi_output, "Va_lim" => _openapi_value.va_lim)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
