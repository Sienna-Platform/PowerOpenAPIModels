"""
    HydroPumpTurbine

A hydropower pumped turbine that needs to have two `HydroReservoir`s attached, suitable for modeling independent pumped hydro with reservoirs.

  - `id`: Unique integer identifier for this component.
  - `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.
  - `bus`: ID of the bus that this component is connected to.
  - `remote_regulated_bus_id`: ID of the bus whose voltage this unit regulates when that bus is not its own (PSS/E IREG). Null means the unit regulates the bus it is connected to; a value equal to that bus is invalid, so local regulation has exactly one representation. An available voltage droop controller the unit belongs to overrides this target.
  - `voltage_setpoint_units`: Unit basis for voltage_setpoint. COMPONENT_BASE (per-unit on the base voltage of the bus the unit regulates) is PSS/E RAW native (VS).
  - `voltage_setpoint`: Voltage magnitude the unit holds at the bus it regulates while its bus type marks it as voltage regulating (PSS/E VS). Ignored while the unit belongs to an available voltage droop controller. Units: per voltage_setpoint_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu .
  - `active_power`: Initial active power set point of the turbine unit. For power flow, this is the steady state operating point of the system. For production cost modeling, this may or may not be used as the initial starting point for the solver, depending on the solver used. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `reactive_power`: Initial reactive power set point of the unit. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .
  - `rating`: Maximum AC side output power rating of the unit. Not to be confused with base_power. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .
  - `active_power_limits`: Minimum and maximum stable active power levels for the turbine. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `reactive_power_limits`: Minimum and maximum reactive power limits. Set to `null` if not applicable. in psy5 a required param with an option to be nothing Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .
  - `active_power_limits_pump`: Minimum and maximum stable active power levels for the pump. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `outflow_limits`: Turbine/Pump outflow limits. Set to `null` if not applicable. in psy5 a required param with an option to be nothing Units: m3/s.
  - `powerhouse_elevation`: Height level above the sea level of the powerhouse on which the turbine is installed. Units: m.
  - `ramp_limits`: Ramp up and ramp down limits. in psy5 a required param with an option to be nothing Units: per power_units — NATURAL_UNITS: MW/min, COMPONENT_BASE: pu/min .
  - `time_limits`: Minimum up and minimum down time limits. in psy5 a required param with an option to be nothing Units: min.
  - `base_power`: Base power of the unit for per unitization. Units: MVA.
  - `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.
  - `operating_mode`: Which mode the pumped-storage unit is operating in at the start of a simulation: pumping, generating, or idle.
  - `status`: Operating state of the unit at the start of a simulation.
  - `time_at_status`: Time the generator has been in its current `status`. default is the INFINITE_TIME sentinel (1e4 hours, 600000 minutes). Units: min.
  - `operation_cost`: Operating cost of generation. or MarketBidCost; default PSY.HydroGenerationCost(nothing)
  - `active_power_pump`: Initial active power set point of the pump unit. For power flow, this is the steady state operating point of the system. For production cost modeling, this may or may not be used as the initial starting point for the solver, depending on the solver used. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `efficiency`: Turbine/Pump efficiency [0, 1.0].
  - `transition_time`: Transition time to switch into the specific mode. Units: min.
  - `minimum_time`: Minimum operating time for the specific mode. Units: min.
  - `travel_time`: Downstream (from reservoir into turbine) travel time. Set to `null` if not applicable. Units: min.
  - `conversion_factor`: Conversion factor from flow/volume to energy: m^3 -> p.u-hr. Units: 1.
  - `commitment_mode`: Commitment mode of the unit.
  - `prime_mover_type`: Prime mover technology according to EIA 923.
  - `dynamic_injector`: ID of the corresponding dynamic injection device, if any.
"""
Base.@kwdef struct HydroPumpTurbine <: APIModel
    id::Int64
    name::String
    available::Bool
    bus::Int64
    remote_regulated_bus_id::Union{Absent, Union{Int64, Nothing}} = ABSENT
    voltage_setpoint_units::Union{Absent, Nothing, VoltageUnitBasis} = ABSENT
    voltage_setpoint::Union{Absent, Float64, Nothing} = ABSENT
    active_power::Float64
    reactive_power::Float64
    rating::Float64
    active_power_limits::MinMax
    reactive_power_limits::Union{Absent, MinMax, Nothing} = ABSENT
    active_power_limits_pump::MinMax
    outflow_limits::Union{Absent, MinMax, Nothing} = ABSENT
    powerhouse_elevation::Float64
    ramp_limits::Union{Absent, UpDown, Nothing} = ABSENT
    time_limits::Union{Absent, UpDown, Nothing} = ABSENT
    base_power::Float64
    power_units::UnitSystem
    operating_mode::Union{Absent, HydroPumpTurbineOperatingMode, Nothing} = ABSENT
    status::Union{Absent, Nothing, OperationalStates} = ABSENT
    time_at_status::Union{Absent, Float64, Nothing} = ABSENT
    operation_cost::HydroPumpTurbineOperationCost
    active_power_pump::Union{Absent, Float64, Nothing} = ABSENT
    efficiency::Union{Absent, Nothing, TurbinePump} = ABSENT
    transition_time::Union{Absent, TurbinePump, Nothing} = ABSENT
    minimum_time::Union{Absent, TurbinePump, Nothing} = ABSENT
    travel_time::Union{Absent, Union{Float64, Nothing}} = ABSENT
    conversion_factor::Union{Absent, Float64, Nothing} = ABSENT
    commitment_mode::Union{Absent, CommitmentModes, Nothing} = ABSENT
    prime_mover_type::Union{Absent, Nothing, PrimeMovers} = ABSENT
    dynamic_injector::Union{Absent, Union{Int64, Nothing}} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{HydroPumpTurbine}, value) = _decode(HydroPumpTurbine, value, true)
function _decode(::Type{HydroPumpTurbine}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-25bbe77b5a7c012e9ff1.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding HydroPumpTurbine";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "HydroPumpTurbine")
    _openapi_field_id = _decode(
        Int64,
        _required(_openapi_object, "id", "HydroPumpTurbine"),
        _openapi_validate,
    )
    _openapi_field_name = _decode(
        String,
        _required(_openapi_object, "name", "HydroPumpTurbine"),
        _openapi_validate,
    )
    _openapi_field_available = _decode(
        Bool,
        _required(_openapi_object, "available", "HydroPumpTurbine"),
        _openapi_validate,
    )
    _openapi_field_bus = _decode(
        Int64,
        _required(_openapi_object, "bus", "HydroPumpTurbine"),
        _openapi_validate,
    )
    _openapi_field_remote_regulated_bus_id =
        haskey(_openapi_object, "remote_regulated_bus_id") ?
        _decode(
            Union{Absent, Union{Int64, Nothing}},
            _openapi_object["remote_regulated_bus_id"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_voltage_setpoint_units =
        haskey(_openapi_object, "voltage_setpoint_units") ?
        _decode(
            Union{Absent, Nothing, VoltageUnitBasis},
            _openapi_object["voltage_setpoint_units"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_voltage_setpoint =
        haskey(_openapi_object, "voltage_setpoint") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["voltage_setpoint"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_active_power = _decode(
        Float64,
        _required(_openapi_object, "active_power", "HydroPumpTurbine"),
        _openapi_validate,
    )
    _openapi_field_reactive_power = _decode(
        Float64,
        _required(_openapi_object, "reactive_power", "HydroPumpTurbine"),
        _openapi_validate,
    )
    _openapi_field_rating = _decode(
        Float64,
        _required(_openapi_object, "rating", "HydroPumpTurbine"),
        _openapi_validate,
    )
    _openapi_field_active_power_limits = _decode(
        MinMax,
        _required(_openapi_object, "active_power_limits", "HydroPumpTurbine"),
        _openapi_validate,
    )
    _openapi_field_reactive_power_limits =
        haskey(_openapi_object, "reactive_power_limits") ?
        _decode(
            Union{Absent, MinMax, Nothing},
            _openapi_object["reactive_power_limits"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_active_power_limits_pump = _decode(
        MinMax,
        _required(_openapi_object, "active_power_limits_pump", "HydroPumpTurbine"),
        _openapi_validate,
    )
    _openapi_field_outflow_limits =
        haskey(_openapi_object, "outflow_limits") ?
        _decode(
            Union{Absent, MinMax, Nothing},
            _openapi_object["outflow_limits"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_powerhouse_elevation = _decode(
        Float64,
        _required(_openapi_object, "powerhouse_elevation", "HydroPumpTurbine"),
        _openapi_validate,
    )
    _openapi_field_ramp_limits =
        haskey(_openapi_object, "ramp_limits") ?
        _decode(
            Union{Absent, UpDown, Nothing},
            _openapi_object["ramp_limits"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_time_limits =
        haskey(_openapi_object, "time_limits") ?
        _decode(
            Union{Absent, UpDown, Nothing},
            _openapi_object["time_limits"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_base_power = _decode(
        Float64,
        _required(_openapi_object, "base_power", "HydroPumpTurbine"),
        _openapi_validate,
    )
    _openapi_field_power_units = _decode(
        UnitSystem,
        _required(_openapi_object, "power_units", "HydroPumpTurbine"),
        _openapi_validate,
    )
    _openapi_field_operating_mode =
        haskey(_openapi_object, "operating_mode") ?
        _decode(
            Union{Absent, HydroPumpTurbineOperatingMode, Nothing},
            _openapi_object["operating_mode"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_status =
        haskey(_openapi_object, "status") ?
        _decode(
            Union{Absent, Nothing, OperationalStates},
            _openapi_object["status"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_time_at_status =
        haskey(_openapi_object, "time_at_status") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["time_at_status"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_operation_cost = _decode(
        HydroPumpTurbineOperationCost,
        _required(_openapi_object, "operation_cost", "HydroPumpTurbine"),
        _openapi_validate,
    )
    _openapi_field_active_power_pump =
        haskey(_openapi_object, "active_power_pump") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["active_power_pump"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_efficiency =
        haskey(_openapi_object, "efficiency") ?
        _decode(
            Union{Absent, Nothing, TurbinePump},
            _openapi_object["efficiency"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_transition_time =
        haskey(_openapi_object, "transition_time") ?
        _decode(
            Union{Absent, TurbinePump, Nothing},
            _openapi_object["transition_time"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_minimum_time =
        haskey(_openapi_object, "minimum_time") ?
        _decode(
            Union{Absent, TurbinePump, Nothing},
            _openapi_object["minimum_time"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_travel_time =
        haskey(_openapi_object, "travel_time") ?
        _decode(
            Union{Absent, Union{Float64, Nothing}},
            _openapi_object["travel_time"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_conversion_factor =
        haskey(_openapi_object, "conversion_factor") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["conversion_factor"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_commitment_mode =
        haskey(_openapi_object, "commitment_mode") ?
        _decode(
            Union{Absent, CommitmentModes, Nothing},
            _openapi_object["commitment_mode"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_prime_mover_type =
        haskey(_openapi_object, "prime_mover_type") ?
        _decode(
            Union{Absent, Nothing, PrimeMovers},
            _openapi_object["prime_mover_type"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_dynamic_injector =
        haskey(_openapi_object, "dynamic_injector") ?
        _decode(
            Union{Absent, Union{Int64, Nothing}},
            _openapi_object["dynamic_injector"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "available",
            "bus",
            "remote_regulated_bus_id",
            "voltage_setpoint_units",
            "voltage_setpoint",
            "active_power",
            "reactive_power",
            "rating",
            "active_power_limits",
            "reactive_power_limits",
            "active_power_limits_pump",
            "outflow_limits",
            "powerhouse_elevation",
            "ramp_limits",
            "time_limits",
            "base_power",
            "power_units",
            "operating_mode",
            "status",
            "time_at_status",
            "operation_cost",
            "active_power_pump",
            "efficiency",
            "transition_time",
            "minimum_time",
            "travel_time",
            "conversion_factor",
            "commitment_mode",
            "prime_mover_type",
            "dynamic_injector",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return HydroPumpTurbine(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        bus=_openapi_field_bus,
        remote_regulated_bus_id=_openapi_field_remote_regulated_bus_id,
        voltage_setpoint_units=_openapi_field_voltage_setpoint_units,
        voltage_setpoint=_openapi_field_voltage_setpoint,
        active_power=_openapi_field_active_power,
        reactive_power=_openapi_field_reactive_power,
        rating=_openapi_field_rating,
        active_power_limits=_openapi_field_active_power_limits,
        reactive_power_limits=_openapi_field_reactive_power_limits,
        active_power_limits_pump=_openapi_field_active_power_limits_pump,
        outflow_limits=_openapi_field_outflow_limits,
        powerhouse_elevation=_openapi_field_powerhouse_elevation,
        ramp_limits=_openapi_field_ramp_limits,
        time_limits=_openapi_field_time_limits,
        base_power=_openapi_field_base_power,
        power_units=_openapi_field_power_units,
        operating_mode=_openapi_field_operating_mode,
        status=_openapi_field_status,
        time_at_status=_openapi_field_time_at_status,
        operation_cost=_openapi_field_operation_cost,
        active_power_pump=_openapi_field_active_power_pump,
        efficiency=_openapi_field_efficiency,
        transition_time=_openapi_field_transition_time,
        minimum_time=_openapi_field_minimum_time,
        travel_time=_openapi_field_travel_time,
        conversion_factor=_openapi_field_conversion_factor,
        commitment_mode=_openapi_field_commitment_mode,
        prime_mover_type=_openapi_field_prime_mover_type,
        dynamic_injector=_openapi_field_dynamic_injector,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::HydroPumpTurbine)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.bus isa Absent || (_openapi_output["bus"] = _encode(_openapi_value.bus))
    _openapi_value.remote_regulated_bus_id isa Absent || (
        _openapi_output["remote_regulated_bus_id"] =
            _encode(_openapi_value.remote_regulated_bus_id)
    )
    _openapi_value.voltage_setpoint_units isa Absent || (
        _openapi_output["voltage_setpoint_units"] =
            _encode(_openapi_value.voltage_setpoint_units)
    )
    _openapi_value.voltage_setpoint isa Absent ||
        (_openapi_output["voltage_setpoint"] = _encode(_openapi_value.voltage_setpoint))
    _openapi_value.active_power isa Absent ||
        (_openapi_output["active_power"] = _encode(_openapi_value.active_power))
    _openapi_value.reactive_power isa Absent ||
        (_openapi_output["reactive_power"] = _encode(_openapi_value.reactive_power))
    _openapi_value.rating isa Absent ||
        (_openapi_output["rating"] = _encode(_openapi_value.rating))
    _openapi_value.active_power_limits isa Absent || (
        _openapi_output["active_power_limits"] =
            _encode(_openapi_value.active_power_limits)
    )
    _openapi_value.reactive_power_limits isa Absent || (
        _openapi_output["reactive_power_limits"] =
            _encode(_openapi_value.reactive_power_limits)
    )
    _openapi_value.active_power_limits_pump isa Absent || (
        _openapi_output["active_power_limits_pump"] =
            _encode(_openapi_value.active_power_limits_pump)
    )
    _openapi_value.outflow_limits isa Absent ||
        (_openapi_output["outflow_limits"] = _encode(_openapi_value.outflow_limits))
    _openapi_value.powerhouse_elevation isa Absent || (
        _openapi_output["powerhouse_elevation"] =
            _encode(_openapi_value.powerhouse_elevation)
    )
    _openapi_value.ramp_limits isa Absent ||
        (_openapi_output["ramp_limits"] = _encode(_openapi_value.ramp_limits))
    _openapi_value.time_limits isa Absent ||
        (_openapi_output["time_limits"] = _encode(_openapi_value.time_limits))
    _openapi_value.base_power isa Absent ||
        (_openapi_output["base_power"] = _encode(_openapi_value.base_power))
    _openapi_value.power_units isa Absent ||
        (_openapi_output["power_units"] = _encode(_openapi_value.power_units))
    _openapi_value.operating_mode isa Absent ||
        (_openapi_output["operating_mode"] = _encode(_openapi_value.operating_mode))
    _openapi_value.status isa Absent ||
        (_openapi_output["status"] = _encode(_openapi_value.status))
    _openapi_value.time_at_status isa Absent ||
        (_openapi_output["time_at_status"] = _encode(_openapi_value.time_at_status))
    _openapi_value.operation_cost isa Absent ||
        (_openapi_output["operation_cost"] = _encode(_openapi_value.operation_cost))
    _openapi_value.active_power_pump isa Absent ||
        (_openapi_output["active_power_pump"] = _encode(_openapi_value.active_power_pump))
    _openapi_value.efficiency isa Absent ||
        (_openapi_output["efficiency"] = _encode(_openapi_value.efficiency))
    _openapi_value.transition_time isa Absent ||
        (_openapi_output["transition_time"] = _encode(_openapi_value.transition_time))
    _openapi_value.minimum_time isa Absent ||
        (_openapi_output["minimum_time"] = _encode(_openapi_value.minimum_time))
    _openapi_value.travel_time isa Absent ||
        (_openapi_output["travel_time"] = _encode(_openapi_value.travel_time))
    _openapi_value.conversion_factor isa Absent ||
        (_openapi_output["conversion_factor"] = _encode(_openapi_value.conversion_factor))
    _openapi_value.commitment_mode isa Absent ||
        (_openapi_output["commitment_mode"] = _encode(_openapi_value.commitment_mode))
    _openapi_value.prime_mover_type isa Absent ||
        (_openapi_output["prime_mover_type"] = _encode(_openapi_value.prime_mover_type))
    _openapi_value.dynamic_injector isa Absent ||
        (_openapi_output["dynamic_injector"] = _encode(_openapi_value.dynamic_injector))
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
            resource="https://openapi.invalid/schema/external-25bbe77b5a7c012e9ff1.json",
            pointer="",
        ),
        _openapi_output,
        "encoding HydroPumpTurbine";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::HydroPumpTurbine)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.bus isa Absent || push!(_openapi_output, "bus" => _openapi_value.bus)
    _openapi_value.remote_regulated_bus_id isa Absent || push!(
        _openapi_output,
        "remote_regulated_bus_id" => _openapi_value.remote_regulated_bus_id,
    )
    _openapi_value.voltage_setpoint_units isa Absent || push!(
        _openapi_output,
        "voltage_setpoint_units" => _openapi_value.voltage_setpoint_units,
    )
    _openapi_value.voltage_setpoint isa Absent ||
        push!(_openapi_output, "voltage_setpoint" => _openapi_value.voltage_setpoint)
    _openapi_value.active_power isa Absent ||
        push!(_openapi_output, "active_power" => _openapi_value.active_power)
    _openapi_value.reactive_power isa Absent ||
        push!(_openapi_output, "reactive_power" => _openapi_value.reactive_power)
    _openapi_value.rating isa Absent ||
        push!(_openapi_output, "rating" => _openapi_value.rating)
    _openapi_value.active_power_limits isa Absent ||
        push!(_openapi_output, "active_power_limits" => _openapi_value.active_power_limits)
    _openapi_value.reactive_power_limits isa Absent || push!(
        _openapi_output,
        "reactive_power_limits" => _openapi_value.reactive_power_limits,
    )
    _openapi_value.active_power_limits_pump isa Absent || push!(
        _openapi_output,
        "active_power_limits_pump" => _openapi_value.active_power_limits_pump,
    )
    _openapi_value.outflow_limits isa Absent ||
        push!(_openapi_output, "outflow_limits" => _openapi_value.outflow_limits)
    _openapi_value.powerhouse_elevation isa Absent || push!(
        _openapi_output,
        "powerhouse_elevation" => _openapi_value.powerhouse_elevation,
    )
    _openapi_value.ramp_limits isa Absent ||
        push!(_openapi_output, "ramp_limits" => _openapi_value.ramp_limits)
    _openapi_value.time_limits isa Absent ||
        push!(_openapi_output, "time_limits" => _openapi_value.time_limits)
    _openapi_value.base_power isa Absent ||
        push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.power_units isa Absent ||
        push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.operating_mode isa Absent ||
        push!(_openapi_output, "operating_mode" => _openapi_value.operating_mode)
    _openapi_value.status isa Absent ||
        push!(_openapi_output, "status" => _openapi_value.status)
    _openapi_value.time_at_status isa Absent ||
        push!(_openapi_output, "time_at_status" => _openapi_value.time_at_status)
    _openapi_value.operation_cost isa Absent ||
        push!(_openapi_output, "operation_cost" => _openapi_value.operation_cost)
    _openapi_value.active_power_pump isa Absent ||
        push!(_openapi_output, "active_power_pump" => _openapi_value.active_power_pump)
    _openapi_value.efficiency isa Absent ||
        push!(_openapi_output, "efficiency" => _openapi_value.efficiency)
    _openapi_value.transition_time isa Absent ||
        push!(_openapi_output, "transition_time" => _openapi_value.transition_time)
    _openapi_value.minimum_time isa Absent ||
        push!(_openapi_output, "minimum_time" => _openapi_value.minimum_time)
    _openapi_value.travel_time isa Absent ||
        push!(_openapi_output, "travel_time" => _openapi_value.travel_time)
    _openapi_value.conversion_factor isa Absent ||
        push!(_openapi_output, "conversion_factor" => _openapi_value.conversion_factor)
    _openapi_value.commitment_mode isa Absent ||
        push!(_openapi_output, "commitment_mode" => _openapi_value.commitment_mode)
    _openapi_value.prime_mover_type isa Absent ||
        push!(_openapi_output, "prime_mover_type" => _openapi_value.prime_mover_type)
    _openapi_value.dynamic_injector isa Absent ||
        push!(_openapi_output, "dynamic_injector" => _openapi_value.dynamic_injector)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
