@doc "    SteamTurbineGov1\n\nSteam Turbine-Governor. This model considers both TGOV1 or TGOV1DU in PSS/E.\n\n- `db_h`: Deadband for overspeed.\n- `db_l`: Deadband for underspeed.\n- `d_t`: Turbine Damping.\n- `p_ref`: Reference Power Set-point.\n- `r`: Droop parameter.\n- `t1`: Governor time constant. Units: s.\n- `t2`: Lead Lag Lead Time constant. Units: s.\n- `t3`: Lead Lag Lag Time constant. Units: s.\n- `t_rate`: Turbine Rate. If zero, generator base is used. Units: MW.\n- `id`: Unique integer identifier for this component.\n- `valve_position_limits`: Valve position limits."
Base.@kwdef struct SteamTurbineGov1
    db_h::Float64
    db_l::Float64
    d_t::Float64
    p_ref::Union{Absent,Float64,Nothing} = ABSENT
    r::Float64
    t1::Float64
    t2::Float64
    t3::Float64
    t_rate::Float64
    id::Int64
    valve_position_limits::SteamTurbineGov1ValvePositionLimits
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{SteamTurbineGov1}, value) = _decode(SteamTurbineGov1, value, true)
function _decode(::Type{SteamTurbineGov1}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-832ddeca7e6e67b0c295.json", pointer = "/components/schemas/SteamTurbineGov1"), _openapi_raw, "decoding SteamTurbineGov1"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "SteamTurbineGov1")
    _openapi_field_db_h = _decode(Float64, _required(_openapi_object, "DB_h", "SteamTurbineGov1"), _openapi_validate)
    _openapi_field_db_l = _decode(Float64, _required(_openapi_object, "DB_l", "SteamTurbineGov1"), _openapi_validate)
    _openapi_field_d_t = _decode(Float64, _required(_openapi_object, "D_T", "SteamTurbineGov1"), _openapi_validate)
    _openapi_field_p_ref = haskey(_openapi_object, "P_ref") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["P_ref"], _openapi_validate) : ABSENT
    _openapi_field_r = _decode(Float64, _required(_openapi_object, "R", "SteamTurbineGov1"), _openapi_validate)
    _openapi_field_t1 = _decode(Float64, _required(_openapi_object, "T1", "SteamTurbineGov1"), _openapi_validate)
    _openapi_field_t2 = _decode(Float64, _required(_openapi_object, "T2", "SteamTurbineGov1"), _openapi_validate)
    _openapi_field_t3 = _decode(Float64, _required(_openapi_object, "T3", "SteamTurbineGov1"), _openapi_validate)
    _openapi_field_t_rate = _decode(Float64, _required(_openapi_object, "T_rate", "SteamTurbineGov1"), _openapi_validate)
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "SteamTurbineGov1"), _openapi_validate)
    _openapi_field_valve_position_limits = _decode(SteamTurbineGov1ValvePositionLimits, _required(_openapi_object, "valve_position_limits", "SteamTurbineGov1"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("DB_h","DB_l","D_T","P_ref","R","T1","T2","T3","T_rate","id","valve_position_limits") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return SteamTurbineGov1(; db_h = _openapi_field_db_h, db_l = _openapi_field_db_l, d_t = _openapi_field_d_t, p_ref = _openapi_field_p_ref, r = _openapi_field_r, t1 = _openapi_field_t1, t2 = _openapi_field_t2, t3 = _openapi_field_t3, t_rate = _openapi_field_t_rate, id = _openapi_field_id, valve_position_limits = _openapi_field_valve_position_limits, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::SteamTurbineGov1)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.db_h isa Absent || (_openapi_output["DB_h"] = _encode(_openapi_value.db_h))
    _openapi_value.db_l isa Absent || (_openapi_output["DB_l"] = _encode(_openapi_value.db_l))
    _openapi_value.d_t isa Absent || (_openapi_output["D_T"] = _encode(_openapi_value.d_t))
    _openapi_value.p_ref isa Absent || (_openapi_output["P_ref"] = _encode(_openapi_value.p_ref))
    _openapi_value.r isa Absent || (_openapi_output["R"] = _encode(_openapi_value.r))
    _openapi_value.t1 isa Absent || (_openapi_output["T1"] = _encode(_openapi_value.t1))
    _openapi_value.t2 isa Absent || (_openapi_output["T2"] = _encode(_openapi_value.t2))
    _openapi_value.t3 isa Absent || (_openapi_output["T3"] = _encode(_openapi_value.t3))
    _openapi_value.t_rate isa Absent || (_openapi_output["T_rate"] = _encode(_openapi_value.t_rate))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.valve_position_limits isa Absent || (_openapi_output["valve_position_limits"] = _encode(_openapi_value.valve_position_limits))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-832ddeca7e6e67b0c295.json", pointer = "/components/schemas/SteamTurbineGov1"), _openapi_output, "encoding SteamTurbineGov1"; direction = :neutral)
end

function _form_fields(_openapi_value::SteamTurbineGov1)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.db_h isa Absent || push!(_openapi_output, "DB_h" => _openapi_value.db_h)
    _openapi_value.db_l isa Absent || push!(_openapi_output, "DB_l" => _openapi_value.db_l)
    _openapi_value.d_t isa Absent || push!(_openapi_output, "D_T" => _openapi_value.d_t)
    _openapi_value.p_ref isa Absent || push!(_openapi_output, "P_ref" => _openapi_value.p_ref)
    _openapi_value.r isa Absent || push!(_openapi_output, "R" => _openapi_value.r)
    _openapi_value.t1 isa Absent || push!(_openapi_output, "T1" => _openapi_value.t1)
    _openapi_value.t2 isa Absent || push!(_openapi_output, "T2" => _openapi_value.t2)
    _openapi_value.t3 isa Absent || push!(_openapi_output, "T3" => _openapi_value.t3)
    _openapi_value.t_rate isa Absent || push!(_openapi_output, "T_rate" => _openapi_value.t_rate)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.valve_position_limits isa Absent || push!(_openapi_output, "valve_position_limits" => _openapi_value.valve_position_limits)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
