"""
    DEGOV1

Parameters Woodward Diesel Governor Model. DEGOV1 in PSSE

  - `id`: Unique integer identifier for this component
  - `droop_flag`: Droop control Flag. 0 for throttle feedback and 1 for electric power feedback
  - `t1`: Governor mechanism time constant
  - `t2`: Turbine power time constant
  - `t3`: Turbine exhaust temperature time constant
  - `k`: Governor gain for actuator
  - `t4`: Governor lead time constant
  - `t5`: Governor lag time constant
  - `t6`: Actuator time constant
  - `td`: Engine time delay
  - `t_lim`: Operational control limits on actuator (Tmin, Tmax)
  - `r`: Steady state droop parameter
  - `te`: Power transducer time constant
  - `p_ref`: Reference power set-point
"""
Base.@kwdef struct DEGOV1 <: APIModel
    id::Int64
    droop_flag::Union{Absent, Int64, Nothing} = ABSENT
    t1::Float64
    t2::Float64
    t3::Float64
    k::Float64
    t4::Float64
    t5::Float64
    t6::Float64
    td::Float64
    t_lim::Vector{Float64}
    r::Float64
    te::Float64
    p_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{DEGOV1}, value) = _decode(DEGOV1, value, true)
function _decode(::Type{DEGOV1}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-082288bf9477fcf3ac85.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding DEGOV1";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "DEGOV1")
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "DEGOV1"), false)
    _openapi_field_droop_flag =
        haskey(_openapi_object, "droop_flag") ?
        _decode(Union{Absent, Int64, Nothing}, _openapi_object["droop_flag"], false) :
        ABSENT
    _openapi_field_t1 = _decode(Float64, _required(_openapi_object, "T1", "DEGOV1"), false)
    _openapi_field_t2 = _decode(Float64, _required(_openapi_object, "T2", "DEGOV1"), false)
    _openapi_field_t3 = _decode(Float64, _required(_openapi_object, "T3", "DEGOV1"), false)
    _openapi_field_k = _decode(Float64, _required(_openapi_object, "K", "DEGOV1"), false)
    _openapi_field_t4 = _decode(Float64, _required(_openapi_object, "T4", "DEGOV1"), false)
    _openapi_field_t5 = _decode(Float64, _required(_openapi_object, "T5", "DEGOV1"), false)
    _openapi_field_t6 = _decode(Float64, _required(_openapi_object, "T6", "DEGOV1"), false)
    _openapi_field_td = _decode(Float64, _required(_openapi_object, "Td", "DEGOV1"), false)
    _openapi_field_t_lim =
        _decode(Vector{Float64}, _required(_openapi_object, "T_lim", "DEGOV1"), false)
    _openapi_field_r = _decode(Float64, _required(_openapi_object, "R", "DEGOV1"), false)
    _openapi_field_te = _decode(Float64, _required(_openapi_object, "Te", "DEGOV1"), false)
    _openapi_field_p_ref =
        haskey(_openapi_object, "P_ref") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["P_ref"], false) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "droop_flag",
            "T1",
            "T2",
            "T3",
            "K",
            "T4",
            "T5",
            "T6",
            "Td",
            "T_lim",
            "R",
            "Te",
            "P_ref",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return DEGOV1(;
        id=_openapi_field_id,
        droop_flag=_openapi_field_droop_flag,
        t1=_openapi_field_t1,
        t2=_openapi_field_t2,
        t3=_openapi_field_t3,
        k=_openapi_field_k,
        t4=_openapi_field_t4,
        t5=_openapi_field_t5,
        t6=_openapi_field_t6,
        td=_openapi_field_td,
        t_lim=_openapi_field_t_lim,
        r=_openapi_field_r,
        te=_openapi_field_te,
        p_ref=_openapi_field_p_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::DEGOV1)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.droop_flag isa Absent ||
        (_openapi_output["droop_flag"] = _encode_unvalidated(_openapi_value.droop_flag))
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
    _openapi_value.t_lim isa Absent ||
        (_openapi_output["T_lim"] = _encode_unvalidated(_openapi_value.t_lim))
    _openapi_value.r isa Absent ||
        (_openapi_output["R"] = _encode_unvalidated(_openapi_value.r))
    _openapi_value.te isa Absent ||
        (_openapi_output["Te"] = _encode_unvalidated(_openapi_value.te))
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
_encode(_openapi_value::DEGOV1) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-082288bf9477fcf3ac85.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding DEGOV1";
    direction=:neutral,
)

function _form_fields(_openapi_value::DEGOV1)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.droop_flag isa Absent ||
        push!(_openapi_output, "droop_flag" => _openapi_value.droop_flag)
    _openapi_value.t1 isa Absent || push!(_openapi_output, "T1" => _openapi_value.t1)
    _openapi_value.t2 isa Absent || push!(_openapi_output, "T2" => _openapi_value.t2)
    _openapi_value.t3 isa Absent || push!(_openapi_output, "T3" => _openapi_value.t3)
    _openapi_value.k isa Absent || push!(_openapi_output, "K" => _openapi_value.k)
    _openapi_value.t4 isa Absent || push!(_openapi_output, "T4" => _openapi_value.t4)
    _openapi_value.t5 isa Absent || push!(_openapi_output, "T5" => _openapi_value.t5)
    _openapi_value.t6 isa Absent || push!(_openapi_output, "T6" => _openapi_value.t6)
    _openapi_value.td isa Absent || push!(_openapi_output, "Td" => _openapi_value.td)
    _openapi_value.t_lim isa Absent ||
        push!(_openapi_output, "T_lim" => _openapi_value.t_lim)
    _openapi_value.r isa Absent || push!(_openapi_output, "R" => _openapi_value.r)
    _openapi_value.te isa Absent || push!(_openapi_output, "Te" => _openapi_value.te)
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
