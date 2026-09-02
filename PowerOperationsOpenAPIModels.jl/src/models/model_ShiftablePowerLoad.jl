@doc "    ShiftablePowerLoad\n\nA static power load that can be partially or completed shifted to later time periods.\n\nThese loads are used to model demand response. This load has a target demand profile (set by a `max_active_power` time series for an operational simulation). Load in the profile can be shifted to later time periods to aid in satisfying other system needs; however, any shifted load must be served within a designated time horizon (e.g., 24 hours), which is set by `load_balance_time_horizon`.\n\n- `active_power`: Initial steady state active power demand. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `active_power_limits`: Minimum and maximum stable active power levels. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.\n- `base_power`: Base power of the unit for per unitization. Units: MVA.\n- `bus`: ID of the bus that this component is connected to.\n- `dynamic_injector`: ID of the corresponding dynamic injection device, if any.\n- `id`: Unique integer identifier for this component.\n- `load_balance_time_horizon`: Number of time periods over which load must be balanced.\n- `max_active_power`: Maximum active power that this load can demand. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `max_reactive_power`: Maximum reactive power that this load can demand. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .\n- `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.\n- `operation_cost`: Operational cost of interrupting load. or MarketBidCost\n- `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.\n- `reactive_power`: Initial steady state reactive power demand. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu ."
Base.@kwdef struct ShiftablePowerLoad
    active_power::Float64
    active_power_limits::ShiftablePowerLoadActivePowerLimits
    available::Bool
    base_power::Float64
    bus::Int64
    dynamic_injector::Union{Absent,Union{Int64,Nothing}} = ABSENT
    id::Int64
    load_balance_time_horizon::Int64
    max_active_power::Float64
    max_reactive_power::Float64
    name::String
    operation_cost::ShiftablePowerLoadOperationCost
    power_units::ShiftablePowerLoadPowerUnits
    reactive_power::Float64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{ShiftablePowerLoad}, value) = _decode(ShiftablePowerLoad, value, true)
function _decode(::Type{ShiftablePowerLoad}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ShiftablePowerLoad"), _openapi_raw, "decoding ShiftablePowerLoad"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "ShiftablePowerLoad")
    _openapi_field_active_power = _decode(Float64, _required(_openapi_object, "active_power", "ShiftablePowerLoad"), _openapi_validate)
    _openapi_field_active_power_limits = _decode(ShiftablePowerLoadActivePowerLimits, _required(_openapi_object, "active_power_limits", "ShiftablePowerLoad"), _openapi_validate)
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "ShiftablePowerLoad"), _openapi_validate)
    _openapi_field_base_power = _decode(Float64, _required(_openapi_object, "base_power", "ShiftablePowerLoad"), _openapi_validate)
    _openapi_field_bus = _decode(Int64, _required(_openapi_object, "bus", "ShiftablePowerLoad"), _openapi_validate)
    _openapi_field_dynamic_injector = haskey(_openapi_object, "dynamic_injector") ? _decode(Union{Absent,Union{Int64,Nothing}}, _openapi_object["dynamic_injector"], _openapi_validate) : ABSENT
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "ShiftablePowerLoad"), _openapi_validate)
    _openapi_field_load_balance_time_horizon = _decode(Int64, _required(_openapi_object, "load_balance_time_horizon", "ShiftablePowerLoad"), _openapi_validate)
    _openapi_field_max_active_power = _decode(Float64, _required(_openapi_object, "max_active_power", "ShiftablePowerLoad"), _openapi_validate)
    _openapi_field_max_reactive_power = _decode(Float64, _required(_openapi_object, "max_reactive_power", "ShiftablePowerLoad"), _openapi_validate)
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "ShiftablePowerLoad"), _openapi_validate)
    _openapi_field_operation_cost = _decode(ShiftablePowerLoadOperationCost, _required(_openapi_object, "operation_cost", "ShiftablePowerLoad"), _openapi_validate)
    _openapi_field_power_units = _decode(ShiftablePowerLoadPowerUnits, _required(_openapi_object, "power_units", "ShiftablePowerLoad"), _openapi_validate)
    _openapi_field_reactive_power = _decode(Float64, _required(_openapi_object, "reactive_power", "ShiftablePowerLoad"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("active_power","active_power_limits","available","base_power","bus","dynamic_injector","id","load_balance_time_horizon","max_active_power","max_reactive_power","name","operation_cost","power_units","reactive_power") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return ShiftablePowerLoad(; active_power = _openapi_field_active_power, active_power_limits = _openapi_field_active_power_limits, available = _openapi_field_available, base_power = _openapi_field_base_power, bus = _openapi_field_bus, dynamic_injector = _openapi_field_dynamic_injector, id = _openapi_field_id, load_balance_time_horizon = _openapi_field_load_balance_time_horizon, max_active_power = _openapi_field_max_active_power, max_reactive_power = _openapi_field_max_reactive_power, name = _openapi_field_name, operation_cost = _openapi_field_operation_cost, power_units = _openapi_field_power_units, reactive_power = _openapi_field_reactive_power, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::ShiftablePowerLoad)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.active_power isa Absent || (_openapi_output["active_power"] = _encode(_openapi_value.active_power))
    _openapi_value.active_power_limits isa Absent || (_openapi_output["active_power_limits"] = _encode(_openapi_value.active_power_limits))
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.base_power isa Absent || (_openapi_output["base_power"] = _encode(_openapi_value.base_power))
    _openapi_value.bus isa Absent || (_openapi_output["bus"] = _encode(_openapi_value.bus))
    _openapi_value.dynamic_injector isa Absent || (_openapi_output["dynamic_injector"] = _encode(_openapi_value.dynamic_injector))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.load_balance_time_horizon isa Absent || (_openapi_output["load_balance_time_horizon"] = _encode(_openapi_value.load_balance_time_horizon))
    _openapi_value.max_active_power isa Absent || (_openapi_output["max_active_power"] = _encode(_openapi_value.max_active_power))
    _openapi_value.max_reactive_power isa Absent || (_openapi_output["max_reactive_power"] = _encode(_openapi_value.max_reactive_power))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.operation_cost isa Absent || (_openapi_output["operation_cost"] = _encode(_openapi_value.operation_cost))
    _openapi_value.power_units isa Absent || (_openapi_output["power_units"] = _encode(_openapi_value.power_units))
    _openapi_value.reactive_power isa Absent || (_openapi_output["reactive_power"] = _encode(_openapi_value.reactive_power))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ShiftablePowerLoad"), _openapi_output, "encoding ShiftablePowerLoad"; direction = :neutral)
end

function _form_fields(_openapi_value::ShiftablePowerLoad)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.active_power isa Absent || push!(_openapi_output, "active_power" => _openapi_value.active_power)
    _openapi_value.active_power_limits isa Absent || push!(_openapi_output, "active_power_limits" => _openapi_value.active_power_limits)
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.base_power isa Absent || push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.bus isa Absent || push!(_openapi_output, "bus" => _openapi_value.bus)
    _openapi_value.dynamic_injector isa Absent || push!(_openapi_output, "dynamic_injector" => _openapi_value.dynamic_injector)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.load_balance_time_horizon isa Absent || push!(_openapi_output, "load_balance_time_horizon" => _openapi_value.load_balance_time_horizon)
    _openapi_value.max_active_power isa Absent || push!(_openapi_output, "max_active_power" => _openapi_value.max_active_power)
    _openapi_value.max_reactive_power isa Absent || push!(_openapi_output, "max_reactive_power" => _openapi_value.max_reactive_power)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.operation_cost isa Absent || push!(_openapi_output, "operation_cost" => _openapi_value.operation_cost)
    _openapi_value.power_units isa Absent || push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.reactive_power isa Absent || push!(_openapi_output, "reactive_power" => _openapi_value.reactive_power)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
