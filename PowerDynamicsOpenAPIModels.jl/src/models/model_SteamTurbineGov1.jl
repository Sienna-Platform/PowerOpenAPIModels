"""
    SteamTurbineGov1

Steam Turbine-Governor. This model considers both TGOV1 or TGOV1DU in PSS/E

  - `id`: Unique integer identifier for this component
  - `r`: Droop parameter
  - `t1`: Governor time constant. Units: s
  - `valve_position_limits`: A pair of values bounding a quantity from below (`min`) and from above (`max`).
  - `t2`: Lead-lag lead time constant. Units: s
  - `t3`: Lead-lag lag time constant. Units: s
  - `d_t`: Turbine damping
  - `db_h`: Deadband for overspeed
  - `db_l`: Deadband for underspeed
  - `t_rate`: Turbine Rate. If zero, generator base is used. Units: MW
  - `p_ref`: Reference power set-point
"""
Base.@kwdef struct SteamTurbineGov1 <: APIModel
    id::Int64
    r::Float64
    t1::Float64
    valve_position_limits::MinMax
    t2::Float64
    t3::Float64
    d_t::Float64
    db_h::Float64
    db_l::Float64
    t_rate::Float64
    p_ref::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{SteamTurbineGov1}, value) = _decode(SteamTurbineGov1, value, true)
function _decode(::Type{SteamTurbineGov1}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-be9d9c9bea8cb70b4fe5.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding SteamTurbineGov1";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "SteamTurbineGov1")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "SteamTurbineGov1"), false)
    _openapi_field_r =
        _decode(Float64, _required(_openapi_object, "R", "SteamTurbineGov1"), false)
    _openapi_field_t1 =
        _decode(Float64, _required(_openapi_object, "T1", "SteamTurbineGov1"), false)
    _openapi_field_valve_position_limits = _decode(
        MinMax,
        _required(_openapi_object, "valve_position_limits", "SteamTurbineGov1"),
        false,
    )
    _openapi_field_t2 =
        _decode(Float64, _required(_openapi_object, "T2", "SteamTurbineGov1"), false)
    _openapi_field_t3 =
        _decode(Float64, _required(_openapi_object, "T3", "SteamTurbineGov1"), false)
    _openapi_field_d_t =
        _decode(Float64, _required(_openapi_object, "D_T", "SteamTurbineGov1"), false)
    _openapi_field_db_h =
        _decode(Float64, _required(_openapi_object, "DB_h", "SteamTurbineGov1"), false)
    _openapi_field_db_l =
        _decode(Float64, _required(_openapi_object, "DB_l", "SteamTurbineGov1"), false)
    _openapi_field_t_rate =
        _decode(Float64, _required(_openapi_object, "T_rate", "SteamTurbineGov1"), false)
    _openapi_field_p_ref =
        haskey(_openapi_object, "P_ref") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["P_ref"], false) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "R",
            "T1",
            "valve_position_limits",
            "T2",
            "T3",
            "D_T",
            "DB_h",
            "DB_l",
            "T_rate",
            "P_ref",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return SteamTurbineGov1(;
        id=_openapi_field_id,
        r=_openapi_field_r,
        t1=_openapi_field_t1,
        valve_position_limits=_openapi_field_valve_position_limits,
        t2=_openapi_field_t2,
        t3=_openapi_field_t3,
        d_t=_openapi_field_d_t,
        db_h=_openapi_field_db_h,
        db_l=_openapi_field_db_l,
        t_rate=_openapi_field_t_rate,
        p_ref=_openapi_field_p_ref,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::SteamTurbineGov1)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.r isa Absent ||
        (_openapi_output["R"] = _encode_unvalidated(_openapi_value.r))
    _openapi_value.t1 isa Absent ||
        (_openapi_output["T1"] = _encode_unvalidated(_openapi_value.t1))
    _openapi_value.valve_position_limits isa Absent || (
        _openapi_output["valve_position_limits"] =
            _encode_unvalidated(_openapi_value.valve_position_limits)
    )
    _openapi_value.t2 isa Absent ||
        (_openapi_output["T2"] = _encode_unvalidated(_openapi_value.t2))
    _openapi_value.t3 isa Absent ||
        (_openapi_output["T3"] = _encode_unvalidated(_openapi_value.t3))
    _openapi_value.d_t isa Absent ||
        (_openapi_output["D_T"] = _encode_unvalidated(_openapi_value.d_t))
    _openapi_value.db_h isa Absent ||
        (_openapi_output["DB_h"] = _encode_unvalidated(_openapi_value.db_h))
    _openapi_value.db_l isa Absent ||
        (_openapi_output["DB_l"] = _encode_unvalidated(_openapi_value.db_l))
    _openapi_value.t_rate isa Absent ||
        (_openapi_output["T_rate"] = _encode_unvalidated(_openapi_value.t_rate))
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
_encode(_openapi_value::SteamTurbineGov1) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-be9d9c9bea8cb70b4fe5.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding SteamTurbineGov1";
    direction=:neutral,
)

function _form_fields(_openapi_value::SteamTurbineGov1)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.r isa Absent || push!(_openapi_output, "R" => _openapi_value.r)
    _openapi_value.t1 isa Absent || push!(_openapi_output, "T1" => _openapi_value.t1)
    _openapi_value.valve_position_limits isa Absent || push!(
        _openapi_output,
        "valve_position_limits" => _openapi_value.valve_position_limits,
    )
    _openapi_value.t2 isa Absent || push!(_openapi_output, "T2" => _openapi_value.t2)
    _openapi_value.t3 isa Absent || push!(_openapi_output, "T3" => _openapi_value.t3)
    _openapi_value.d_t isa Absent || push!(_openapi_output, "D_T" => _openapi_value.d_t)
    _openapi_value.db_h isa Absent || push!(_openapi_output, "DB_h" => _openapi_value.db_h)
    _openapi_value.db_l isa Absent || push!(_openapi_output, "DB_l" => _openapi_value.db_l)
    _openapi_value.t_rate isa Absent ||
        push!(_openapi_output, "T_rate" => _openapi_value.t_rate)
    _openapi_value.p_ref isa Absent ||
        push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
