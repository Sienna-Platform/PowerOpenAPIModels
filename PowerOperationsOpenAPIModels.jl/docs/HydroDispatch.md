# HydroDispatch

A hydropower generator without a reservoir, suitable for modeling run-of-river hydropower.

For hydro generators with an upper reservoir, see `HydroReservoir`.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [required]
**`remote_regulated_bus_id`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the bus whose voltage this unit regulates when that bus is not its own (PSS/E IREG). Null means the unit regulates the bus it is connected to; a value equal to that bus is invalid, so local regulation has exactly one representation. An available voltage droop controller the unit belongs to overrides this target. | [optional]
**`voltage_setpoint_units`** | **`Union{Absent,Nothing,VoltageUnitBasis}`** | Unit basis for voltage_setpoint. COMPONENT_BASE (per-unit on the base voltage of the bus the unit regulates) is PSS/E RAW native (VS). | [optional]
**`voltage_setpoint`** | **`Union{Absent,Float64,Nothing}`** | Voltage magnitude the unit holds at the bus it regulates while its bus type marks it as voltage regulating (PSS/E VS). Ignored while the unit belongs to an available voltage droop controller. Units: per voltage_setpoint_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu . | [optional]
**`active_power`** | **`Float64`** | Initial active power set point of the unit. For power flow, this is the steady state operating point of the system. For production cost modeling, this may or may not be used as the initial starting point for the solver, depending on the solver used. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`reactive_power`** | **`Float64`** | Initial reactive power set point of the unit. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
**`rating`** | **`Float64`** | Maximum AC side output power rating of the unit. Not to be confused with base_power. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [required]
**`prime_mover_type`** | **`PrimeMovers`** | Prime mover technology according to EIA 923. | [required]
**`active_power_limits`** | **`MinMax`** | Minimum and maximum stable active power levels. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`reactive_power_limits`** | **`Union{Absent,MinMax,Nothing}`** | Minimum and maximum reactive power limits. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
**`ramp_limits`** | **`Union{Absent,UpDown,Nothing}`** | Ramp up and ramp down limits. Units: per power_units — NATURAL_UNITS: MW/min, COMPONENT_BASE: pu/min . | [optional]
**`time_limits`** | **`Union{Absent,UpDown,Nothing}`** | Minimum up and minimum down time limits. Units: min. | [optional]
**`base_power`** | **`Float64`** | Base power of the unit for per unitization. Units: MVA. | [required]
**`power_units`** | **`UnitSystem`** | Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit. | [required]
**`status`** | **`Union{Absent,Nothing,OperationalStates}`** | Operating state of the unit at the start of a simulation. | [optional]
**`time_at_status`** | **`Union{Absent,Float64,Nothing}`** | Time the generator has been in its current `status`. default is the INFINITE_TIME sentinel (1e4 hours, 600000 minutes). Units: min. | [optional]
**`operation_cost`** | **`HydroDispatchOperationCost`** | Operating cost of generation. or MarketBidCost; default PSY.HydroGenerationCost(nothing) | [required]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection device, if any. | [optional]
