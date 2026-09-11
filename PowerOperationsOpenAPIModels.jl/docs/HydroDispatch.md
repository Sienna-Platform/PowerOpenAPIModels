# HydroDispatch

A hydropower generator without a reservoir, suitable for modeling run-of-river hydropower.

For hydro generators with an upper reservoir, see `HydroReservoir`.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power`** | **`Float64`** | Initial active power set point. The steady-state operating point for power flow; an optional starting point for other solvers. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`active_power_limits`** | **`MinMax`** | Minimum and maximum stable active power levels. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`available`** | **`Bool`** | Whether the component is online (true) or offline (false). Unavailable components are excluded from simulations. | [required]
**`base_power`** | **`Float64`** | Base power of the unit for per unitization. Units: MVA. | [required]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [required]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection device, if any. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the component. Unique among components of the same type; components of different types may share a name. | [required]
**`operation_cost`** | **`HydroDispatchOperationCost`** | Operating cost of generation. or MarketBidCost; default PSY.HydroGenerationCost(nothing) | [required]
**`power_units`** | **`UnitSystem`** | Unit basis for this component's power fields (power, ratings, ramp rates): COMPONENT_BASE per unit on base_power, NATURAL_UNITS the field's own unit. | [required]
**`prime_mover_type`** | **`PrimeMovers`** | Prime mover technology according to EIA 923. | [required]
**`ramp_limits`** | **`Union{Absent,UpDown,Nothing}`** | Ramp up and ramp down limits. Units: per power_units — NATURAL_UNITS: MW/min, COMPONENT_BASE: pu/min . | [optional]
**`rating`** | **`Float64`** | Maximum AC side output power rating of the unit. Not to be confused with base_power. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [required]
**`reactive_power`** | **`Float64`** | Initial reactive power set point of the unit. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
**`reactive_power_limits`** | **`Union{Absent,MinMax,Nothing}`** | Minimum and maximum reactive power limits. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
**`status`** | **`Union{Absent,Nothing,OperationalStates}`** | Operating state of the unit at the start of a simulation. | [optional]
**`time_at_status`** | **`Union{Absent,Float64,Nothing}`** | Time the generator has been in its current `status`. default is the INFINITE_TIME sentinel (1e4 hours, 600000 minutes). Units: min. | [optional]
**`time_limits`** | **`Union{Absent,UpDown,Nothing}`** | Minimum up and minimum down time limits. Units: min. | [optional]
