# RenewableNonDispatch

A non-dispatchable (non-curtailable, must-take) renewable generator. Output equals its max_active_power time series by default, e.g. an aggregation of behind-the-meter solar. For curtailable generation, see RenewableDispatch.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power`** | **`Float64`** | Initial active power set point. The steady-state operating point for power flow; an optional starting point for other solvers. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`available`** | **`Bool`** | Whether the component is online (true) or offline (false). Unavailable components are excluded from simulations. | [required]
**`base_power`** | **`Float64`** | Base power of the unit for per unitization. Units: MVA. | [required]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [required]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection device, if any. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the component. Unique among components of the same type; components of different types may share a name. | [required]
**`power_factor`** | **`Float64`** | Power factor [0, 1] set-point, used in some production cost modeling and in load flow if the unit is connected to a `PQ` bus. Units: 1. | [required]
**`power_units`** | **`UnitSystem`** | Unit basis for this component's power fields (power, ratings, ramp rates): COMPONENT_BASE per unit on base_power, NATURAL_UNITS the field's own unit. | [required]
**`prime_mover_type`** | **`PrimeMovers`** | Prime mover technology according to EIA 923. | [required]
**`rating`** | **`Float64`** | Maximum AC side output power rating of the unit. Not to be confused with base_power. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [required]
**`reactive_power`** | **`Float64`** | Initial reactive power set point of the unit, used in some production cost modeling simulations. To set the reactive power in a load flow, use `power_factor`. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
