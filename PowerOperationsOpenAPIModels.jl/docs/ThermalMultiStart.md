# ThermalMultiStart

A thermal generator, such as a fossil fuel or nuclear generator, that can start-up again from a *hot*, *warm*, or *cold* state.

`ThermalMultiStart` has a detailed representation of the start-up process based on the time elapsed since the last shut down, as well as a detailed shut-down process. The model is based on "Tight and Compact MILP Formulation for the Thermal Unit Commitment Problem.". For a simplified representation of the start-up and shut-down processes, see `ThermalStandard`.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power`** | **`Float64`** | Initial active power set point of the unit. For power flow, this is the steady state operating point of the system. For production cost modeling, this may or may not be used as the initial starting point for the solver, depending on the solver used. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`active_power_limits`** | **`ThermalMultiStartActivePowerLimits`** | Minimum and maximum stable active power levels. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`base_power`** | **`Float64`** | Base power of the unit for per unitization. Units: MVA. | [required]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [required]
**`commitment_mode`** | **`Union{Absent,Nothing,ThermalMultiStartCommitmentMode}`** | Commitment mode of the unit. | [optional]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection device, if any. | [optional]
**`fuel`** | **`ThermalMultiStartFuel`** | Prime mover fuel according to EIA 923. | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`operation_cost`** | **`ThermalMultiStartOperationCost`** | Operating cost of generation. or MarketBidCost | [required]
**`power_trajectory`** | **`Union{Absent,Nothing,ThermalMultiStartPowerTrajectory}`** | Power trajectory the unit will take during the start-up and shut-down ramp process. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [optional]
**`power_units`** | **`ThermalMultiStartPowerUnits`** | Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit. | [required]
**`prime_mover_type`** | **`ThermalMultiStartPrimeMoverType`** | Prime mover technology according to EIA 923. | [required]
**`ramp_limits`** | **`Union{Absent,Nothing,ThermalMultiStartRampLimits}`** | Ramp up and ramp down limits. Units: per power_units — NATURAL_UNITS: MW/min, COMPONENT_BASE: pu/min . | [optional]
**`rating`** | **`Float64`** | Maximum AC side output power rating of the unit. Not to be confused with base_power. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [required]
**`reactive_power`** | **`Float64`** | Initial reactive power set point of the unit. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
**`reactive_power_limits`** | **`Union{Absent,Nothing,ThermalMultiStartReactivePowerLimits}`** | Minimum and maximum reactive power limits. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
**`start_time_limits`** | **`Union{Absent,Nothing,ThermalMultiStartStartTimeLimits}`** | Time limits for start-up based on turbine temperature. Units: min. | [optional]
**`start_types`** | **`Int64`** | Number of start-up based on turbine temperature, where `1` = *hot*, `2` = *warm*, and `3` = *cold*. | [required]
**`status`** | **`ThermalMultiStartStatus`** | Operating state of the unit at the start of a simulation. | [required]
**`time_at_status`** | **`Union{Absent,Float64,Nothing}`** | Time the generator has been in its current status. Units: min. | [optional]
**`time_limits`** | **`Union{Absent,Nothing,ThermalMultiStartTimeLimits}`** | Minimum up and minimum down time limits. Units: min. | [optional]
