# HydroPumpTurbine

A hydropower pumped turbine that needs to have two `HydroReservoir`s attached, suitable for modeling independent pumped hydro with reservoirs.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power`** | **`Float64`** | Initial active power set point of the turbine unit. For power flow, this is the steady state operating point of the system. For production cost modeling, this may or may not be used as the initial starting point for the solver, depending on the solver used. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`active_power_limits`** | **`HydroPumpTurbineActivePowerLimits`** | Minimum and maximum stable active power levels for the turbine. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`active_power_limits_pump`** | **`HydroPumpTurbineActivePowerLimitsPump`** | Minimum and maximum stable active power levels for the pump. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`active_power_pump`** | **`Union{Absent,Float64,Nothing}`** | Initial active power set point of the pump unit. For power flow, this is the steady state operating point of the system. For production cost modeling, this may or may not be used as the initial starting point for the solver, depending on the solver used. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [optional]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`base_power`** | **`Float64`** | Base power of the unit for per unitization. Units: MVA. | [required]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [required]
**`commitment_mode`** | **`Union{Absent,HydroPumpTurbineCommitmentMode,Nothing}`** | Commitment mode of the unit. | [optional]
**`conversion_factor`** | **`Union{Absent,Float64,Nothing}`** | Conversion factor from flow/volume to energy: m^3 -> p.u-hr. Units: 1. | [optional]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection device, if any. | [optional]
**`efficiency`** | **`Union{Absent,HydroPumpTurbineEfficiency,Nothing}`** | Turbine/Pump efficiency [0, 1.0]. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`minimum_time`** | **`Union{Absent,HydroPumpTurbineMinimumTime,Nothing}`** | Minimum operating time for the specific mode. Units: min. | [optional]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`operation_cost`** | **`HydroPumpTurbineOperationCost`** | Operating cost of generation. or MarketBidCost; default PSY.HydroGenerationCost(nothing) | [required]
**`outflow_limits`** | **`Union{Absent,HydroPumpTurbineOutflowLimits,Nothing}`** | Turbine/Pump outflow limits. Set to `null` if not applicable. in psy5 a required param with an option to be nothing Units: m3/s. | [optional]
**`power_units`** | **`HydroPumpTurbinePowerUnits`** | Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit. | [required]
**`powerhouse_elevation`** | **`Float64`** | Height level above the sea level of the powerhouse on which the turbine is installed. Units: m. | [required]
**`prime_mover_type`** | **`Union{Absent,HydroPumpTurbinePrimeMoverType,Nothing}`** | Prime mover technology according to EIA 923. | [optional]
**`ramp_limits`** | **`Union{Absent,HydroPumpTurbineRampLimits,Nothing}`** | Ramp up and ramp down limits. in psy5 a required param with an option to be nothing Units: per power_units — NATURAL_UNITS: MW/min, COMPONENT_BASE: pu/min . | [optional]
**`rating`** | **`Float64`** | Maximum AC side output power rating of the unit. Not to be confused with base_power. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [required]
**`reactive_power`** | **`Float64`** | Initial reactive power set point of the unit. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
**`reactive_power_limits`** | **`Union{Absent,HydroPumpTurbineReactivePowerLimits,Nothing}`** | Minimum and maximum reactive power limits. Set to `null` if not applicable. in psy5 a required param with an option to be nothing Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
**`status`** | **`Union{Absent,HydroPumpTurbineStatus,Nothing}`** | Initial Operating status of a pumped-storage hydro unit. See `HydroPumpTurbineStatus` for reference. | [optional]
**`time_at_status`** | **`Union{Absent,Float64,Nothing}`** | Time the generator has been on or off, as indicated by `status`. default is the INFINITE_TIME sentinel (1e4 hours, 600000 minutes). Units: min. | [optional]
**`time_limits`** | **`Union{Absent,HydroPumpTurbineTimeLimits,Nothing}`** | Minimum up and minimum down time limits. in psy5 a required param with an option to be nothing Units: min. | [optional]
**`transition_time`** | **`Union{Absent,HydroPumpTurbineTransitionTime,Nothing}`** | Transition time to switch into the specific mode. Units: min. | [optional]
**`travel_time`** | **`Union{Absent,Union{Float64,Nothing}}`** | Downstream (from reservoir into turbine) travel time. Set to `null` if not applicable. Units: min. | [optional]
