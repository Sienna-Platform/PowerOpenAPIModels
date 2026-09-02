# ThermalStandard

A thermal generator, such as a fossil fuel and nuclear generator.

This is a standard representation with options to include a minimum up time, minimum down time, and ramp limits. For a more detailed representation of the start-up and shut-down processes, including hot starts, see `ThermalMultiStart`.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power`** | **`Float64`** | Initial active power set point of the unit. For power flow, this is the steady state operating point of the system. For production cost modeling, this may or may not be used as the initial starting point for the solver, depending on the solver used. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`active_power_limits`** | **`ThermalStandardActivePowerLimits`** | Minimum and maximum stable active power levels. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`base_power`** | **`Float64`** | Base power of the unit for per unitization. Must be positive; a zero base would make per-unit conversion undefined. Units: MVA. | [required]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [required]
**`commitment_mode`** | **`Union{Absent,Nothing,ThermalStandardCommitmentMode}`** | Commitment mode of the unit. | [optional]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection device, if any. | [optional]
**`fuel`** | **`Union{Absent,Nothing,ThermalStandardFuel}`** | Prime mover fuel according to EIA 923. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`operation_cost`** | **`ThermalStandardOperationCost`** | Operating cost of generation, or a MarketBidCost. | [required]
**`power_units`** | **`ThermalStandardPowerUnits`** | Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit. | [required]
**`prime_mover_type`** | **`Union{Absent,Nothing,ThermalStandardPrimeMoverType}`** | Prime mover technology according to EIA 923. | [optional]
**`ramp_limits`** | **`Union{Absent,Nothing,ThermalStandardRampLimits}`** | Ramp up and ramp down limits. Units: per power_units — NATURAL_UNITS: MW/min, COMPONENT_BASE: pu/min . | [optional]
**`rating`** | **`Float64`** | Maximum AC side output power rating of the unit. Not to be confused with base_power. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [required]
**`reactive_power`** | **`Float64`** | Initial reactive power set point of the unit. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
**`reactive_power_limits`** | **`Union{Absent,Nothing,ThermalStandardReactivePowerLimits}`** | Minimum and maximum reactive power limits. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
**`status`** | **`ThermalStandardStatus`** | Operating state of the unit at the start of a simulation. | [required]
**`time_at_status`** | **`Union{Absent,Float64,Nothing}`** | Time the generator has been in its current status. Units: min. | [optional]
**`time_limits`** | **`Union{Absent,Nothing,ThermalStandardTimeLimits}`** | Minimum up and minimum down time limits. Units: min. | [optional]
