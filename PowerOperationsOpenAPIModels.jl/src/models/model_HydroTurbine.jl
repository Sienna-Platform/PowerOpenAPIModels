@doc "    HydroTurbine\n\nA hydropower generator that must have a `HydroReservoir` attached, suitable for modeling independent turbines and reservoirs.\n\n- `active_power`: Initial active power set point of the unit. For power flow, this is the steady state operating point of the system. For production cost modeling, this may or may not be used as the initial starting point for the solver, depending on the solver used. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `active_power_limits`: Minimum and maximum stable active power levels. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.\n- `base_power`: Base power of the unit for per unitization. Units: MVA.\n- `bus`: ID of the bus that this component is connected to.\n- `conversion_factor`: Conversion factor from flow/volume to energy: m^3 -> p.u-hr. Units: 1.\n- `dynamic_injector`: ID of the corresponding dynamic injection device, if any.\n- `efficiency`: Turbine efficiency [0, 1.0].\n- `id`: Unique integer identifier for this component.\n- `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.\n- `operation_cost`: Operating cost of generation. or MarketBidCost; default PSY.HydroGenerationCost(nothing)\n- `outflow_limits`: Turbine outflow limits. Set to `null` if not applicable. Units: m3/s.\n- `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.\n- `powerhouse_elevation`: Height level above the sea level of the powerhouse on which the turbine is installed. Units: m.\n- `prime_mover_type`: Prime mover technology according to EIA 923.\n- `ramp_limits`: Ramp up and ramp down limits. Units: per power_units — NATURAL_UNITS: MW/min, COMPONENT_BASE: pu/min .\n- `rating`: Maximum AC side output power rating of the unit. Not to be confused with base_power. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .\n- `reactive_power`: Initial reactive power set point of the unit. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .\n- `reactive_power_limits`: Minimum and maximum reactive power limits. Set to `null` if not applicable. in psy5 a required param with an option to be nothing Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .\n- `time_limits`: Minimum up and minimum down time limits. Units: min.\n- `travel_time`: Downstream (from reservoir into turbine) travel time. Set to `null` if not applicable. Units: min.\n- `turbine_type`: Type of the turbine."
Base.@kwdef struct HydroTurbine
    active_power::Float64
    active_power_limits::HydroTurbineActivePowerLimits
    available::Bool
    base_power::Float64
    bus::Int64
    conversion_factor::Union{Absent,Float64,Nothing} = ABSENT
    dynamic_injector::Union{Absent,Union{Int64,Nothing}} = ABSENT
    efficiency::Union{Absent,Float64,Nothing} = ABSENT
    id::Int64
    name::String
    operation_cost::HydroTurbineOperationCost
    outflow_limits::Union{Absent,HydroTurbineOutflowLimits,Nothing} = ABSENT
    power_units::HydroTurbinePowerUnits
    powerhouse_elevation::Union{Absent,Float64,Nothing} = ABSENT
    prime_mover_type::Union{Absent,HydroTurbinePrimeMoverType,Nothing} = ABSENT
    ramp_limits::Union{Absent,HydroTurbineRampLimits,Nothing} = ABSENT
    rating::Float64
    reactive_power::Float64
    reactive_power_limits::Union{Absent,HydroTurbineReactivePowerLimits,Nothing} = ABSENT
    time_limits::Union{Absent,HydroTurbineTimeLimits,Nothing} = ABSENT
    travel_time::Union{Absent,Union{Float64,Nothing}} = ABSENT
    turbine_type::Union{Absent,HydroTurbineTurbineType,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{HydroTurbine}, value) = _decode(HydroTurbine, value, true)
function _decode(::Type{HydroTurbine}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HydroTurbine"), _openapi_raw, "decoding HydroTurbine"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "HydroTurbine")
    _openapi_field_active_power = _decode(Float64, _required(_openapi_object, "active_power", "HydroTurbine"), _openapi_validate)
    _openapi_field_active_power_limits = _decode(HydroTurbineActivePowerLimits, _required(_openapi_object, "active_power_limits", "HydroTurbine"), _openapi_validate)
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "HydroTurbine"), _openapi_validate)
    _openapi_field_base_power = _decode(Float64, _required(_openapi_object, "base_power", "HydroTurbine"), _openapi_validate)
    _openapi_field_bus = _decode(Int64, _required(_openapi_object, "bus", "HydroTurbine"), _openapi_validate)
    _openapi_field_conversion_factor = haskey(_openapi_object, "conversion_factor") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["conversion_factor"], _openapi_validate) : ABSENT
    _openapi_field_dynamic_injector = haskey(_openapi_object, "dynamic_injector") ? _decode(Union{Absent,Union{Int64,Nothing}}, _openapi_object["dynamic_injector"], _openapi_validate) : ABSENT
    _openapi_field_efficiency = haskey(_openapi_object, "efficiency") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["efficiency"], _openapi_validate) : ABSENT
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "HydroTurbine"), _openapi_validate)
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "HydroTurbine"), _openapi_validate)
    _openapi_field_operation_cost = _decode(HydroTurbineOperationCost, _required(_openapi_object, "operation_cost", "HydroTurbine"), _openapi_validate)
    _openapi_field_outflow_limits = haskey(_openapi_object, "outflow_limits") ? _decode(Union{Absent,HydroTurbineOutflowLimits,Nothing}, _openapi_object["outflow_limits"], _openapi_validate) : ABSENT
    _openapi_field_power_units = _decode(HydroTurbinePowerUnits, _required(_openapi_object, "power_units", "HydroTurbine"), _openapi_validate)
    _openapi_field_powerhouse_elevation = haskey(_openapi_object, "powerhouse_elevation") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["powerhouse_elevation"], _openapi_validate) : ABSENT
    _openapi_field_prime_mover_type = haskey(_openapi_object, "prime_mover_type") ? _decode(Union{Absent,HydroTurbinePrimeMoverType,Nothing}, _openapi_object["prime_mover_type"], _openapi_validate) : ABSENT
    _openapi_field_ramp_limits = haskey(_openapi_object, "ramp_limits") ? _decode(Union{Absent,HydroTurbineRampLimits,Nothing}, _openapi_object["ramp_limits"], _openapi_validate) : ABSENT
    _openapi_field_rating = _decode(Float64, _required(_openapi_object, "rating", "HydroTurbine"), _openapi_validate)
    _openapi_field_reactive_power = _decode(Float64, _required(_openapi_object, "reactive_power", "HydroTurbine"), _openapi_validate)
    _openapi_field_reactive_power_limits = haskey(_openapi_object, "reactive_power_limits") ? _decode(Union{Absent,HydroTurbineReactivePowerLimits,Nothing}, _openapi_object["reactive_power_limits"], _openapi_validate) : ABSENT
    _openapi_field_time_limits = haskey(_openapi_object, "time_limits") ? _decode(Union{Absent,HydroTurbineTimeLimits,Nothing}, _openapi_object["time_limits"], _openapi_validate) : ABSENT
    _openapi_field_travel_time = haskey(_openapi_object, "travel_time") ? _decode(Union{Absent,Union{Float64,Nothing}}, _openapi_object["travel_time"], _openapi_validate) : ABSENT
    _openapi_field_turbine_type = haskey(_openapi_object, "turbine_type") ? _decode(Union{Absent,HydroTurbineTurbineType,Nothing}, _openapi_object["turbine_type"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("active_power","active_power_limits","available","base_power","bus","conversion_factor","dynamic_injector","efficiency","id","name","operation_cost","outflow_limits","power_units","powerhouse_elevation","prime_mover_type","ramp_limits","rating","reactive_power","reactive_power_limits","time_limits","travel_time","turbine_type") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return HydroTurbine(; active_power = _openapi_field_active_power, active_power_limits = _openapi_field_active_power_limits, available = _openapi_field_available, base_power = _openapi_field_base_power, bus = _openapi_field_bus, conversion_factor = _openapi_field_conversion_factor, dynamic_injector = _openapi_field_dynamic_injector, efficiency = _openapi_field_efficiency, id = _openapi_field_id, name = _openapi_field_name, operation_cost = _openapi_field_operation_cost, outflow_limits = _openapi_field_outflow_limits, power_units = _openapi_field_power_units, powerhouse_elevation = _openapi_field_powerhouse_elevation, prime_mover_type = _openapi_field_prime_mover_type, ramp_limits = _openapi_field_ramp_limits, rating = _openapi_field_rating, reactive_power = _openapi_field_reactive_power, reactive_power_limits = _openapi_field_reactive_power_limits, time_limits = _openapi_field_time_limits, travel_time = _openapi_field_travel_time, turbine_type = _openapi_field_turbine_type, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::HydroTurbine)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.active_power isa Absent || (_openapi_output["active_power"] = _encode(_openapi_value.active_power))
    _openapi_value.active_power_limits isa Absent || (_openapi_output["active_power_limits"] = _encode(_openapi_value.active_power_limits))
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.base_power isa Absent || (_openapi_output["base_power"] = _encode(_openapi_value.base_power))
    _openapi_value.bus isa Absent || (_openapi_output["bus"] = _encode(_openapi_value.bus))
    _openapi_value.conversion_factor isa Absent || (_openapi_output["conversion_factor"] = _encode(_openapi_value.conversion_factor))
    _openapi_value.dynamic_injector isa Absent || (_openapi_output["dynamic_injector"] = _encode(_openapi_value.dynamic_injector))
    _openapi_value.efficiency isa Absent || (_openapi_output["efficiency"] = _encode(_openapi_value.efficiency))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
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
    _openapi_value.time_limits isa Absent || (_openapi_output["time_limits"] = _encode(_openapi_value.time_limits))
    _openapi_value.travel_time isa Absent || (_openapi_output["travel_time"] = _encode(_openapi_value.travel_time))
    _openapi_value.turbine_type isa Absent || (_openapi_output["turbine_type"] = _encode(_openapi_value.turbine_type))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HydroTurbine"), _openapi_output, "encoding HydroTurbine"; direction = :neutral)
end

function _form_fields(_openapi_value::HydroTurbine)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.active_power isa Absent || push!(_openapi_output, "active_power" => _openapi_value.active_power)
    _openapi_value.active_power_limits isa Absent || push!(_openapi_output, "active_power_limits" => _openapi_value.active_power_limits)
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.base_power isa Absent || push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.bus isa Absent || push!(_openapi_output, "bus" => _openapi_value.bus)
    _openapi_value.conversion_factor isa Absent || push!(_openapi_output, "conversion_factor" => _openapi_value.conversion_factor)
    _openapi_value.dynamic_injector isa Absent || push!(_openapi_output, "dynamic_injector" => _openapi_value.dynamic_injector)
    _openapi_value.efficiency isa Absent || push!(_openapi_output, "efficiency" => _openapi_value.efficiency)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
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
    _openapi_value.time_limits isa Absent || push!(_openapi_output, "time_limits" => _openapi_value.time_limits)
    _openapi_value.travel_time isa Absent || push!(_openapi_output, "travel_time" => _openapi_value.travel_time)
    _openapi_value.turbine_type isa Absent || push!(_openapi_output, "turbine_type" => _openapi_value.turbine_type)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
