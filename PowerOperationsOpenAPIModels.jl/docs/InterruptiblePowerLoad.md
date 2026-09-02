# InterruptiblePowerLoad

A static power load that can be compensated for temporary or continuous interruptions to its requested demand.

These loads are most commonly used for operational optimizations and can be used to model, for example, large commercial and industrial customers enrolled in demand response programs. This load has a target demand profile (set by a `max_active_power` time series for an operational simulation) that can be reduced to satisfy other system needs. For simpler loads without an operating cost for demand response, see `PowerLoad`.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power`** | **`Float64`** | Initial steady state active power demand. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`base_power`** | **`Float64`** | Base power of the unit for per unitization. Units: MVA. | [required]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [required]
**`conformity`** | **`Union{Absent,InterruptiblePowerLoadConformity,Nothing}`** | Indicates whether the specified load is conforming or non-conforming. | [optional]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection device, if any. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`max_active_power`** | **`Float64`** | Maximum active power that this load can demand. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`max_reactive_power`** | **`Float64`** | Maximum reactive power that this load can demand. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`operation_cost`** | **`InterruptiblePowerLoadOperationCost`** | Operational cost of interrupting load. or MarketBidCost | [required]
**`power_units`** | **`InterruptiblePowerLoadPowerUnits`** | Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit. | [required]
**`reactive_power`** | **`Float64`** | Initial steady state reactive power demand. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
