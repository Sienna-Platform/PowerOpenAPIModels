# PowerLoad

A static power load, most commonly used for operational models such as power flow and operational optimizations.

This load consumes a set amount of power (set by `active_power` for a power flow simulation or a `max_active_power` time series for an operational simulation). For loads that can be compensated for load interruptions through demand response programs, see `InterruptiblePowerLoad`. For voltage-dependent loads used in dynamics modeling, see `StandardLoad`.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power`** | **`Float64`** | Initial steady-state active power demand. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`base_power`** | **`Float64`** | Base power of the unit for per unitization. Units: MVA. | [required]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [required]
**`conformity`** | **`Union{Absent,Nothing,PowerLoadConformity}`** | Indicates whether the specified load is conforming or non-conforming. | [optional]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection device, if any. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`max_active_power`** | **`Float64`** | Maximum active power that this load can demand. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`max_reactive_power`** | **`Float64`** | Maximum reactive power that this load can demand. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`power_units`** | **`PowerLoadPowerUnits`** | Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit. | [required]
**`reactive_power`** | **`Float64`** | Initial steady-state reactive power demand. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
