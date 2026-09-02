# HydroTurbine

A hydropower generator that must have a `HydroReservoir` attached, suitable for modeling independent turbines and reservoirs.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power`** | **`Float64`** | Initial active power set point of the unit. For power flow, this is the steady state operating point of the system. For production cost modeling, this may or may not be used as the initial starting point for the solver, depending on the solver used. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`active_power_limits`** | **`HydroTurbineActivePowerLimits`** | Minimum and maximum stable active power levels. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`base_power`** | **`Float64`** | Base power of the unit for per unitization. Units: MVA. | [required]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [required]
**`conversion_factor`** | **`Union{Absent,Float64,Nothing}`** | Conversion factor from flow/volume to energy: m^3 -> p.u-hr. Units: 1. | [optional]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection device, if any. | [optional]
**`efficiency`** | **`Union{Absent,Float64,Nothing}`** | Turbine efficiency [0, 1.0]. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`operation_cost`** | **`HydroTurbineOperationCost`** | Operating cost of generation. or MarketBidCost; default PSY.HydroGenerationCost(nothing) | [required]
**`outflow_limits`** | **`Union{Absent,HydroTurbineOutflowLimits,Nothing}`** | Turbine outflow limits. Set to `null` if not applicable. Units: m3/s. | [optional]
**`power_units`** | **`HydroTurbinePowerUnits`** | Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit. | [required]
**`powerhouse_elevation`** | **`Union{Absent,Float64,Nothing}`** | Height level above the sea level of the powerhouse on which the turbine is installed. Units: m. | [optional]
**`prime_mover_type`** | **`Union{Absent,HydroTurbinePrimeMoverType,Nothing}`** | Prime mover technology according to EIA 923. | [optional]
**`ramp_limits`** | **`Union{Absent,HydroTurbineRampLimits,Nothing}`** | Ramp up and ramp down limits. Units: per power_units — NATURAL_UNITS: MW/min, COMPONENT_BASE: pu/min . | [optional]
**`rating`** | **`Float64`** | Maximum AC side output power rating of the unit. Not to be confused with base_power. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [required]
**`reactive_power`** | **`Float64`** | Initial reactive power set point of the unit. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
**`reactive_power_limits`** | **`Union{Absent,HydroTurbineReactivePowerLimits,Nothing}`** | Minimum and maximum reactive power limits. Set to `null` if not applicable. in psy5 a required param with an option to be nothing Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
**`time_limits`** | **`Union{Absent,HydroTurbineTimeLimits,Nothing}`** | Minimum up and minimum down time limits. Units: min. | [optional]
**`travel_time`** | **`Union{Absent,Union{Float64,Nothing}}`** | Downstream (from reservoir into turbine) travel time. Set to `null` if not applicable. Units: min. | [optional]
**`turbine_type`** | **`Union{Absent,HydroTurbineTurbineType,Nothing}`** | Type of the turbine. | [optional]
