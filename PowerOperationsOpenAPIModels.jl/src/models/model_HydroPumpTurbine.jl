@doc "    HydroPumpTurbine\n\nA hydropower pumped turbine that needs to have two `HydroReservoir`s attached, suitable for modeling independent pumped hydro with reservoirs.\n\n- `active_power`: Initial active power set point of the turbine unit. For power flow, this is the steady state operating point of the system. For production cost modeling, this may or may not be used as the initial starting point for the solver, depending on the solver used. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `active_power_limits`: Minimum and maximum stable active power levels for the turbine. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `active_power_limits_pump`: Minimum and maximum stable active power levels for the pump. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `active_power_pump`: Initial active power set point of the pump unit. For power flow, this is the steady state operating point of the system. For production cost modeling, this may or may not be used as the initial starting point for the solver, depending on the solver used. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.\n- `base_power`: Base power of the unit for per unitization. Units: MVA.\n- `bus`: ID of the bus that this component is connected to.\n- `commitment_mode`: Commitment mode of the unit.\n- `conversion_factor`: Conversion factor from flow/volume to energy: m^3 -> p.u-hr. Units: 1.\n- `dynamic_injector`: ID of the corresponding dynamic injection device, if any.\n- `efficiency`: Turbine/Pump efficiency [0, 1.0].\n- `id`: Unique integer identifier for this component.\n- `minimum_time`: Minimum operating time for the specific mode. Units: min.\n- `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.\n- `operation_cost`: Operating cost of generation. or MarketBidCost; default PSY.HydroGenerationCost(nothing)\n- `outflow_limits`: Turbine/Pump outflow limits. Set to `null` if not applicable. in psy5 a required param with an option to be nothing Units: m3/s.\n- `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.\n- `powerhouse_elevation`: Height level above the sea level of the powerhouse on which the turbine is installed. Units: m.\n- `prime_mover_type`: Prime mover technology according to EIA 923.\n- `ramp_limits`: Ramp up and ramp down limits. in psy5 a required param with an option to be nothing Units: per power_units — NATURAL_UNITS: MW/min, COMPONENT_BASE: pu/min .\n- `rating`: Maximum AC side output power rating of the unit. Not to be confused with base_power. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .\n- `reactive_power`: Initial reactive power set point of the unit. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .\n- `reactive_power_limits`: Minimum and maximum reactive power limits. Set to `null` if not applicable. in psy5 a required param with an option to be nothing Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .\n- `status`: Initial Operating status of a pumped-storage hydro unit. See `HydroPumpTurbineStatus` for reference.\n- `time_at_status`: Time the generator has been on or off, as indicated by `status`. default is the INFINITE_TIME sentinel (1e4 hours, 600000 minutes). Units: min.\n- `time_limits`: Minimum up and minimum down time limits. in psy5 a required param with an option to be nothing Units: min.\n- `transition_time`: Transition time to switch into the specific mode. Units: min.\n- `travel_time`: Downstream (from reservoir into turbine) travel time. Set to `null` if not applicable. Units: min."
Base.@kwdef struct HydroPumpTurbine
    active_power::Float64
    active_power_limits::HydroPumpTurbineActivePowerLimits
    active_power_limits_pump::HydroPumpTurbineActivePowerLimitsPump
    active_power_pump::Union{Absent,Float64,Nothing} = ABSENT
    available::Bool
    base_power::Float64
    bus::Int64
    commitment_mode::Union{Absent,HydroPumpTurbineCommitmentMode,Nothing} = ABSENT
    conversion_factor::Union{Absent,Float64,Nothing} = ABSENT
    dynamic_injector::Union{Absent,Union{Int64,Nothing}} = ABSENT
    efficiency::Union{Absent,HydroPumpTurbineEfficiency,Nothing} = ABSENT
    id::Int64
    minimum_time::Union{Absent,HydroPumpTurbineMinimumTime,Nothing} = ABSENT
    name::String
    operation_cost::HydroPumpTurbineOperationCost
    outflow_limits::Union{Absent,HydroPumpTurbineOutflowLimits,Nothing} = ABSENT
    power_units::HydroPumpTurbinePowerUnits
    powerhouse_elevation::Float64
    prime_mover_type::Union{Absent,HydroPumpTurbinePrimeMoverType,Nothing} = ABSENT
    ramp_limits::Union{Absent,HydroPumpTurbineRampLimits,Nothing} = ABSENT
    rating::Float64
    reactive_power::Float64
    reactive_power_limits::Union{Absent,HydroPumpTurbineReactivePowerLimits,Nothing} = ABSENT
    status::Union{Absent,HydroPumpTurbineStatus,Nothing} = ABSENT
    time_at_status::Union{Absent,Float64,Nothing} = ABSENT
    time_limits::Union{Absent,HydroPumpTurbineTimeLimits,Nothing} = ABSENT
    transition_time::Union{Absent,HydroPumpTurbineTransitionTime,Nothing} = ABSENT
    travel_time::Union{Absent,Union{Float64,Nothing}} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{HydroPumpTurbine}, value) = _decode(HydroPumpTurbine, value, true)
function _decode(::Type{HydroPumpTurbine}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HydroPumpTurbine"), _openapi_raw, "decoding HydroPumpTurbine"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "HydroPumpTurbine")
    _openapi_field_active_power = _decode(Float64, _required(_openapi_object, "active_power", "HydroPumpTurbine"), _openapi_validate)
    _openapi_field_active_power_limits = _decode(HydroPumpTurbineActivePowerLimits, _required(_openapi_object, "active_power_limits", "HydroPumpTurbine"), _openapi_validate)
    _openapi_field_active_power_limits_pump = _decode(HydroPumpTurbineActivePowerLimitsPump, _required(_openapi_object, "active_power_limits_pump", "HydroPumpTurbine"), _openapi_validate)
    _openapi_field_active_power_pump = haskey(_openapi_object, "active_power_pump") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["active_power_pump"], _openapi_validate) : ABSENT
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "HydroPumpTurbine"), _openapi_validate)
    _openapi_field_base_power = _decode(Float64, _required(_openapi_object, "base_power", "HydroPumpTurbine"), _openapi_validate)
    _openapi_field_bus = _decode(Int64, _required(_openapi_object, "bus", "HydroPumpTurbine"), _openapi_validate)
    _openapi_field_commitment_mode = haskey(_openapi_object, "commitment_mode") ? _decode(Union{Absent,HydroPumpTurbineCommitmentMode,Nothing}, _openapi_object["commitment_mode"], _openapi_validate) : ABSENT
    _openapi_field_conversion_factor = haskey(_openapi_object, "conversion_factor") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["conversion_factor"], _openapi_validate) : ABSENT
    _openapi_field_dynamic_injector = haskey(_openapi_object, "dynamic_injector") ? _decode(Union{Absent,Union{Int64,Nothing}}, _openapi_object["dynamic_injector"], _openapi_validate) : ABSENT
    _openapi_field_efficiency = haskey(_openapi_object, "efficiency") ? _decode(Union{Absent,HydroPumpTurbineEfficiency,Nothing}, _openapi_object["efficiency"], _openapi_validate) : ABSENT
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "HydroPumpTurbine"), _openapi_validate)
    _openapi_field_minimum_time = haskey(_openapi_object, "minimum_time") ? _decode(Union{Absent,HydroPumpTurbineMinimumTime,Nothing}, _openapi_object["minimum_time"], _openapi_validate) : ABSENT
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "HydroPumpTurbine"), _openapi_validate)
    _openapi_field_operation_cost = _decode(HydroPumpTurbineOperationCost, _required(_openapi_object, "operation_cost", "HydroPumpTurbine"), _openapi_validate)
    _openapi_field_outflow_limits = haskey(_openapi_object, "outflow_limits") ? _decode(Union{Absent,HydroPumpTurbineOutflowLimits,Nothing}, _openapi_object["outflow_limits"], _openapi_validate) : ABSENT
    _openapi_field_power_units = _decode(HydroPumpTurbinePowerUnits, _required(_openapi_object, "power_units", "HydroPumpTurbine"), _openapi_validate)
    _openapi_field_powerhouse_elevation = _decode(Float64, _required(_openapi_object, "powerhouse_elevation", "HydroPumpTurbine"), _openapi_validate)
    _openapi_field_prime_mover_type = haskey(_openapi_object, "prime_mover_type") ? _decode(Union{Absent,HydroPumpTurbinePrimeMoverType,Nothing}, _openapi_object["prime_mover_type"], _openapi_validate) : ABSENT
    _openapi_field_ramp_limits = haskey(_openapi_object, "ramp_limits") ? _decode(Union{Absent,HydroPumpTurbineRampLimits,Nothing}, _openapi_object["ramp_limits"], _openapi_validate) : ABSENT
    _openapi_field_rating = _decode(Float64, _required(_openapi_object, "rating", "HydroPumpTurbine"), _openapi_validate)
    _openapi_field_reactive_power = _decode(Float64, _required(_openapi_object, "reactive_power", "HydroPumpTurbine"), _openapi_validate)
    _openapi_field_reactive_power_limits = haskey(_openapi_object, "reactive_power_limits") ? _decode(Union{Absent,HydroPumpTurbineReactivePowerLimits,Nothing}, _openapi_object["reactive_power_limits"], _openapi_validate) : ABSENT
    _openapi_field_status = haskey(_openapi_object, "status") ? _decode(Union{Absent,HydroPumpTurbineStatus,Nothing}, _openapi_object["status"], _openapi_validate) : ABSENT
    _openapi_field_time_at_status = haskey(_openapi_object, "time_at_status") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["time_at_status"], _openapi_validate) : ABSENT
    _openapi_field_time_limits = haskey(_openapi_object, "time_limits") ? _decode(Union{Absent,HydroPumpTurbineTimeLimits,Nothing}, _openapi_object["time_limits"], _openapi_validate) : ABSENT
    _openapi_field_transition_time = haskey(_openapi_object, "transition_time") ? _decode(Union{Absent,HydroPumpTurbineTransitionTime,Nothing}, _openapi_object["transition_time"], _openapi_validate) : ABSENT
    _openapi_field_travel_time = haskey(_openapi_object, "travel_time") ? _decode(Union{Absent,Union{Float64,Nothing}}, _openapi_object["travel_time"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("active_power","active_power_limits","active_power_limits_pump","active_power_pump","available","base_power","bus","commitment_mode","conversion_factor","dynamic_injector","efficiency","id","minimum_time","name","operation_cost","outflow_limits","power_units","powerhouse_elevation","prime_mover_type","ramp_limits","rating","reactive_power","reactive_power_limits","status","time_at_status","time_limits","transition_time","travel_time") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return HydroPumpTurbine(; active_power = _openapi_field_active_power, active_power_limits = _openapi_field_active_power_limits, active_power_limits_pump = _openapi_field_active_power_limits_pump, active_power_pump = _openapi_field_active_power_pump, available = _openapi_field_available, base_power = _openapi_field_base_power, bus = _openapi_field_bus, commitment_mode = _openapi_field_commitment_mode, conversion_factor = _openapi_field_conversion_factor, dynamic_injector = _openapi_field_dynamic_injector, efficiency = _openapi_field_efficiency, id = _openapi_field_id, minimum_time = _openapi_field_minimum_time, name = _openapi_field_name, operation_cost = _openapi_field_operation_cost, outflow_limits = _openapi_field_outflow_limits, power_units = _openapi_field_power_units, powerhouse_elevation = _openapi_field_powerhouse_elevation, prime_mover_type = _openapi_field_prime_mover_type, ramp_limits = _openapi_field_ramp_limits, rating = _openapi_field_rating, reactive_power = _openapi_field_reactive_power, reactive_power_limits = _openapi_field_reactive_power_limits, status = _openapi_field_status, time_at_status = _openapi_field_time_at_status, time_limits = _openapi_field_time_limits, transition_time = _openapi_field_transition_time, travel_time = _openapi_field_travel_time, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::HydroPumpTurbine)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.active_power isa Absent || (_openapi_output["active_power"] = _encode(_openapi_value.active_power))
    _openapi_value.active_power_limits isa Absent || (_openapi_output["active_power_limits"] = _encode(_openapi_value.active_power_limits))
    _openapi_value.active_power_limits_pump isa Absent || (_openapi_output["active_power_limits_pump"] = _encode(_openapi_value.active_power_limits_pump))
    _openapi_value.active_power_pump isa Absent || (_openapi_output["active_power_pump"] = _encode(_openapi_value.active_power_pump))
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.base_power isa Absent || (_openapi_output["base_power"] = _encode(_openapi_value.base_power))
    _openapi_value.bus isa Absent || (_openapi_output["bus"] = _encode(_openapi_value.bus))
    _openapi_value.commitment_mode isa Absent || (_openapi_output["commitment_mode"] = _encode(_openapi_value.commitment_mode))
    _openapi_value.conversion_factor isa Absent || (_openapi_output["conversion_factor"] = _encode(_openapi_value.conversion_factor))
    _openapi_value.dynamic_injector isa Absent || (_openapi_output["dynamic_injector"] = _encode(_openapi_value.dynamic_injector))
    _openapi_value.efficiency isa Absent || (_openapi_output["efficiency"] = _encode(_openapi_value.efficiency))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.minimum_time isa Absent || (_openapi_output["minimum_time"] = _encode(_openapi_value.minimum_time))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.operation_cost isa Absent || (_openapi_output["operation_cost"] = _encode(_openapi_value.operation_cost))
    _openapi_value.outflow_limits isa Absent || (_openapi_output["outflow_limits"] = _encode(_openapi_value.outflow_limits))
    _openapi_value.power_units isa Absent || (_openapi_output["power_units"] = _encode(_openapi_value.power_units))
    _openapi_value.powerhouse_elevation isa Absent || (_openapi_output["powerhouse_elevation"] = _encode(_openapi_value.powerhouse_elevation))
    _openapi_value.prime_mover_type isa Absent || (_openapi_output["prime_mover_type"] = _encode(_openapi_value.prime_mover_type))
    _openapi_value.ramp_limits isa Absent || (_openapi_output["ramp_limits"] = _encode(_openapi_value.ramp_limits))
    _openapi_value.rating isa Absent || (_openapi_output["rating"] = _encode(_openapi_value.rating))
    _openapi_value.reactive_power isa Absent || (_openapi_output["reactive_power"] = _encode(_openapi_value.reactive_power))
    _openapi_value.reactive_power_limits isa Absent || (_openapi_output["reactive_power_limits"] = _encode(_openapi_value.reactive_power_limits))
    _openapi_value.status isa Absent || (_openapi_output["status"] = _encode(_openapi_value.status))
    _openapi_value.time_at_status isa Absent || (_openapi_output["time_at_status"] = _encode(_openapi_value.time_at_status))
    _openapi_value.time_limits isa Absent || (_openapi_output["time_limits"] = _encode(_openapi_value.time_limits))
    _openapi_value.transition_time isa Absent || (_openapi_output["transition_time"] = _encode(_openapi_value.transition_time))
    _openapi_value.travel_time isa Absent || (_openapi_output["travel_time"] = _encode(_openapi_value.travel_time))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HydroPumpTurbine"), _openapi_output, "encoding HydroPumpTurbine"; direction = :neutral)
end

function _form_fields(_openapi_value::HydroPumpTurbine)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.active_power isa Absent || push!(_openapi_output, "active_power" => _openapi_value.active_power)
    _openapi_value.active_power_limits isa Absent || push!(_openapi_output, "active_power_limits" => _openapi_value.active_power_limits)
    _openapi_value.active_power_limits_pump isa Absent || push!(_openapi_output, "active_power_limits_pump" => _openapi_value.active_power_limits_pump)
    _openapi_value.active_power_pump isa Absent || push!(_openapi_output, "active_power_pump" => _openapi_value.active_power_pump)
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.base_power isa Absent || push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.bus isa Absent || push!(_openapi_output, "bus" => _openapi_value.bus)
    _openapi_value.commitment_mode isa Absent || push!(_openapi_output, "commitment_mode" => _openapi_value.commitment_mode)
    _openapi_value.conversion_factor isa Absent || push!(_openapi_output, "conversion_factor" => _openapi_value.conversion_factor)
    _openapi_value.dynamic_injector isa Absent || push!(_openapi_output, "dynamic_injector" => _openapi_value.dynamic_injector)
    _openapi_value.efficiency isa Absent || push!(_openapi_output, "efficiency" => _openapi_value.efficiency)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.minimum_time isa Absent || push!(_openapi_output, "minimum_time" => _openapi_value.minimum_time)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.operation_cost isa Absent || push!(_openapi_output, "operation_cost" => _openapi_value.operation_cost)
    _openapi_value.outflow_limits isa Absent || push!(_openapi_output, "outflow_limits" => _openapi_value.outflow_limits)
    _openapi_value.power_units isa Absent || push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.powerhouse_elevation isa Absent || push!(_openapi_output, "powerhouse_elevation" => _openapi_value.powerhouse_elevation)
    _openapi_value.prime_mover_type isa Absent || push!(_openapi_output, "prime_mover_type" => _openapi_value.prime_mover_type)
    _openapi_value.ramp_limits isa Absent || push!(_openapi_output, "ramp_limits" => _openapi_value.ramp_limits)
    _openapi_value.rating isa Absent || push!(_openapi_output, "rating" => _openapi_value.rating)
    _openapi_value.reactive_power isa Absent || push!(_openapi_output, "reactive_power" => _openapi_value.reactive_power)
    _openapi_value.reactive_power_limits isa Absent || push!(_openapi_output, "reactive_power_limits" => _openapi_value.reactive_power_limits)
    _openapi_value.status isa Absent || push!(_openapi_output, "status" => _openapi_value.status)
    _openapi_value.time_at_status isa Absent || push!(_openapi_output, "time_at_status" => _openapi_value.time_at_status)
    _openapi_value.time_limits isa Absent || push!(_openapi_output, "time_limits" => _openapi_value.time_limits)
    _openapi_value.transition_time isa Absent || push!(_openapi_output, "transition_time" => _openapi_value.transition_time)
    _openapi_value.travel_time isa Absent || push!(_openapi_output, "travel_time" => _openapi_value.travel_time)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
