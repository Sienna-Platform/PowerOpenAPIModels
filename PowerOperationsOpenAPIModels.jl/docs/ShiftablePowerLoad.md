# ShiftablePowerLoad

A static power load that can be partially or completed shifted to later time periods.

These loads are used to model demand response. This load has a target demand profile (set by a `max_active_power` time series for an operational simulation). Load in the profile can be shifted to later time periods to aid in satisfying other system needs; however, any shifted load must be served within a designated time horizon (e.g., 24 hours), which is set by `load_balance_time_horizon`.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power`** | **`Float64`** | Initial steady state active power demand. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`active_power_limits`** | **`ShiftablePowerLoadActivePowerLimits`** | Minimum and maximum stable active power levels. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`base_power`** | **`Float64`** | Base power of the unit for per unitization. Units: MVA. | [required]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [required]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection device, if any. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`load_balance_time_horizon`** | **`Int64`** | Number of time periods over which load must be balanced. | [required]
**`max_active_power`** | **`Float64`** | Maximum active power that this load can demand. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`max_reactive_power`** | **`Float64`** | Maximum reactive power that this load can demand. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`operation_cost`** | **`ShiftablePowerLoadOperationCost`** | Operational cost of interrupting load. or MarketBidCost | [required]
**`power_units`** | **`ShiftablePowerLoadPowerUnits`** | Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit. | [required]
**`reactive_power`** | **`Float64`** | Initial steady state reactive power demand. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
