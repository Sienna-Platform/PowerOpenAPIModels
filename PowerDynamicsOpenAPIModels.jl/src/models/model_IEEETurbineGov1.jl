"""
    IEEETurbineGov1

IEEE Type 1 Speed-Governing Model

  - `id`: Unique integer identifier for this component
  - `k`: Governor gain
  - `t1`: Input filter lag
  - `t2`: Input filter lead
  - `t3`: Valve position time constant
  - `u0`: Maximum valve opening rate
  - `u_c`: Maximum valve closing rate
  - `valve_position_limits`: A pair of values bounding a quantity from below (`min`) and from above (`max`).
  - `t4`: Time constant inlet steam
  - `k1`: Fraction of high pressure shaft power
  - `k2`: Fraction of low pressure shaft power
  - `t5`: Time constant for second boiler pass
  - `k3`: Fraction of high pressure shaft power second boiler pass
  - `k4`: Fraction of low pressure shaft power second boiler pass
  - `t6`: Time constant for third boiler pass
  - `k5`: Fraction of high pressure shaft power third boiler pass
  - `k6`: Fraction of low pressure shaft power third boiler pass
  - `t7`: Time constant for fourth boiler pass
  - `k7`: Fraction of high pressure shaft power fourth boiler pass
  - `k8`: Fraction of low pressure shaft power fourth boiler pass
  - `p_ref`: Reference power set-point
"""
Base.@kwdef struct IEEETurbineGov1 <: APIModel
    id::Int64
    k::Int64
    t1::Int64
    t2::Float64
    t3::Float64
    u0::Float64
    u_c::Float64
    valve_position_limits::MinMax
    t4::Float64
    k1::Float64
    k2::Float64
    t5::Float64
    k3::Float64
    k4::Float64
    t6::Float64
    k5::Float64
    k6::Float64
    t7::Float64
    k7::Float64
    k8::Float64
    p_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{IEEETurbineGov1}, value) = _decode(IEEETurbineGov1, value, true)
function _decode(::Type{IEEETurbineGov1}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-cdf5e56e3fc6e79f7a91.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding IEEETurbineGov1";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "IEEETurbineGov1")
    _openapi_field_id = _decode(
        Int64,
        _required(_openapi_object, "id", "IEEETurbineGov1"),
        _openapi_validate,
    )
    _openapi_field_k = _decode(
        Int64,
        _required(_openapi_object, "K", "IEEETurbineGov1"),
        _openapi_validate,
    )
    _openapi_field_t1 = _decode(
        Int64,
        _required(_openapi_object, "T1", "IEEETurbineGov1"),
        _openapi_validate,
    )
    _openapi_field_t2 = _decode(
        Float64,
        _required(_openapi_object, "T2", "IEEETurbineGov1"),
        _openapi_validate,
    )
    _openapi_field_t3 = _decode(
        Float64,
        _required(_openapi_object, "T3", "IEEETurbineGov1"),
        _openapi_validate,
    )
    _openapi_field_u0 = _decode(
        Float64,
        _required(_openapi_object, "U0", "IEEETurbineGov1"),
        _openapi_validate,
    )
    _openapi_field_u_c = _decode(
        Float64,
        _required(_openapi_object, "U_c", "IEEETurbineGov1"),
        _openapi_validate,
    )
    _openapi_field_valve_position_limits = _decode(
        MinMax,
        _required(_openapi_object, "valve_position_limits", "IEEETurbineGov1"),
        _openapi_validate,
    )
    _openapi_field_t4 = _decode(
        Float64,
        _required(_openapi_object, "T4", "IEEETurbineGov1"),
        _openapi_validate,
    )
    _openapi_field_k1 = _decode(
        Float64,
        _required(_openapi_object, "K1", "IEEETurbineGov1"),
        _openapi_validate,
    )
    _openapi_field_k2 = _decode(
        Float64,
        _required(_openapi_object, "K2", "IEEETurbineGov1"),
        _openapi_validate,
    )
    _openapi_field_t5 = _decode(
        Float64,
        _required(_openapi_object, "T5", "IEEETurbineGov1"),
        _openapi_validate,
    )
    _openapi_field_k3 = _decode(
        Float64,
        _required(_openapi_object, "K3", "IEEETurbineGov1"),
        _openapi_validate,
    )
    _openapi_field_k4 = _decode(
        Float64,
        _required(_openapi_object, "K4", "IEEETurbineGov1"),
        _openapi_validate,
    )
    _openapi_field_t6 = _decode(
        Float64,
        _required(_openapi_object, "T6", "IEEETurbineGov1"),
        _openapi_validate,
    )
    _openapi_field_k5 = _decode(
        Float64,
        _required(_openapi_object, "K5", "IEEETurbineGov1"),
        _openapi_validate,
    )
    _openapi_field_k6 = _decode(
        Float64,
        _required(_openapi_object, "K6", "IEEETurbineGov1"),
        _openapi_validate,
    )
    _openapi_field_t7 = _decode(
        Float64,
        _required(_openapi_object, "T7", "IEEETurbineGov1"),
        _openapi_validate,
    )
    _openapi_field_k7 = _decode(
        Float64,
        _required(_openapi_object, "K7", "IEEETurbineGov1"),
        _openapi_validate,
    )
    _openapi_field_k8 = _decode(
        Float64,
        _required(_openapi_object, "K8", "IEEETurbineGov1"),
        _openapi_validate,
    )
    _openapi_field_p_ref =
        haskey(_openapi_object, "P_ref") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["P_ref"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "K",
            "T1",
            "T2",
            "T3",
            "U0",
            "U_c",
            "valve_position_limits",
            "T4",
            "K1",
            "K2",
            "T5",
            "K3",
            "K4",
            "T6",
            "K5",
            "K6",
            "T7",
            "K7",
            "K8",
            "P_ref",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return IEEETurbineGov1(;
        id=_openapi_field_id,
        k=_openapi_field_k,
        t1=_openapi_field_t1,
        t2=_openapi_field_t2,
        t3=_openapi_field_t3,
        u0=_openapi_field_u0,
        u_c=_openapi_field_u_c,
        valve_position_limits=_openapi_field_valve_position_limits,
        t4=_openapi_field_t4,
        k1=_openapi_field_k1,
        k2=_openapi_field_k2,
        t5=_openapi_field_t5,
        k3=_openapi_field_k3,
        k4=_openapi_field_k4,
        t6=_openapi_field_t6,
        k5=_openapi_field_k5,
        k6=_openapi_field_k6,
        t7=_openapi_field_t7,
        k7=_openapi_field_k7,
        k8=_openapi_field_k8,
        p_ref=_openapi_field_p_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::IEEETurbineGov1)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.k isa Absent || (_openapi_output["K"] = _encode(_openapi_value.k))
    _openapi_value.t1 isa Absent || (_openapi_output["T1"] = _encode(_openapi_value.t1))
    _openapi_value.t2 isa Absent || (_openapi_output["T2"] = _encode(_openapi_value.t2))
    _openapi_value.t3 isa Absent || (_openapi_output["T3"] = _encode(_openapi_value.t3))
    _openapi_value.u0 isa Absent || (_openapi_output["U0"] = _encode(_openapi_value.u0))
    _openapi_value.u_c isa Absent || (_openapi_output["U_c"] = _encode(_openapi_value.u_c))
    _openapi_value.valve_position_limits isa Absent || (
        _openapi_output["valve_position_limits"] =
            _encode(_openapi_value.valve_position_limits)
    )
    _openapi_value.t4 isa Absent || (_openapi_output["T4"] = _encode(_openapi_value.t4))
    _openapi_value.k1 isa Absent || (_openapi_output["K1"] = _encode(_openapi_value.k1))
    _openapi_value.k2 isa Absent || (_openapi_output["K2"] = _encode(_openapi_value.k2))
    _openapi_value.t5 isa Absent || (_openapi_output["T5"] = _encode(_openapi_value.t5))
    _openapi_value.k3 isa Absent || (_openapi_output["K3"] = _encode(_openapi_value.k3))
    _openapi_value.k4 isa Absent || (_openapi_output["K4"] = _encode(_openapi_value.k4))
    _openapi_value.t6 isa Absent || (_openapi_output["T6"] = _encode(_openapi_value.t6))
    _openapi_value.k5 isa Absent || (_openapi_output["K5"] = _encode(_openapi_value.k5))
    _openapi_value.k6 isa Absent || (_openapi_output["K6"] = _encode(_openapi_value.k6))
    _openapi_value.t7 isa Absent || (_openapi_output["T7"] = _encode(_openapi_value.t7))
    _openapi_value.k7 isa Absent || (_openapi_output["K7"] = _encode(_openapi_value.k7))
    _openapi_value.k8 isa Absent || (_openapi_output["K8"] = _encode(_openapi_value.k8))
    _openapi_value.p_ref isa Absent ||
        (_openapi_output["P_ref"] = _encode(_openapi_value.p_ref))
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
            resource="https://openapi.invalid/schema/external-cdf5e56e3fc6e79f7a91.json",
            pointer="",
        ),
        _openapi_output,
        "encoding IEEETurbineGov1";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::IEEETurbineGov1)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.k isa Absent || push!(_openapi_output, "K" => _openapi_value.k)
    _openapi_value.t1 isa Absent || push!(_openapi_output, "T1" => _openapi_value.t1)
    _openapi_value.t2 isa Absent || push!(_openapi_output, "T2" => _openapi_value.t2)
    _openapi_value.t3 isa Absent || push!(_openapi_output, "T3" => _openapi_value.t3)
    _openapi_value.u0 isa Absent || push!(_openapi_output, "U0" => _openapi_value.u0)
    _openapi_value.u_c isa Absent || push!(_openapi_output, "U_c" => _openapi_value.u_c)
    _openapi_value.valve_position_limits isa Absent || push!(
        _openapi_output,
        "valve_position_limits" => _openapi_value.valve_position_limits,
    )
    _openapi_value.t4 isa Absent || push!(_openapi_output, "T4" => _openapi_value.t4)
    _openapi_value.k1 isa Absent || push!(_openapi_output, "K1" => _openapi_value.k1)
    _openapi_value.k2 isa Absent || push!(_openapi_output, "K2" => _openapi_value.k2)
    _openapi_value.t5 isa Absent || push!(_openapi_output, "T5" => _openapi_value.t5)
    _openapi_value.k3 isa Absent || push!(_openapi_output, "K3" => _openapi_value.k3)
    _openapi_value.k4 isa Absent || push!(_openapi_output, "K4" => _openapi_value.k4)
    _openapi_value.t6 isa Absent || push!(_openapi_output, "T6" => _openapi_value.t6)
    _openapi_value.k5 isa Absent || push!(_openapi_output, "K5" => _openapi_value.k5)
    _openapi_value.k6 isa Absent || push!(_openapi_output, "K6" => _openapi_value.k6)
    _openapi_value.t7 isa Absent || push!(_openapi_output, "T7" => _openapi_value.t7)
    _openapi_value.k7 isa Absent || push!(_openapi_output, "K7" => _openapi_value.k7)
    _openapi_value.k8 isa Absent || push!(_openapi_output, "K8" => _openapi_value.k8)
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
