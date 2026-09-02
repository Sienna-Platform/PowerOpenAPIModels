# TModelHVDCLine

A High Voltage DC transmission line for modeling DC transmission networks.

This line must be connected to a `DCBus` on each end. It uses a T-Model of the line impedance. This is suitable for operational simulations with a multi-terminal DC network. This line has no independent per-component power base, so its power fields are always natural units.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power_flow`** | **`Float64`** | Initial condition of active power flow on the line. Units: MW. | [required]
**`active_power_limits_from`** | **`TModelHVDCLineActivePowerLimitsFrom`** | Minimum and maximum active power flows to the FROM node. Units: MW. | [required]
**`active_power_limits_to`** | **`TModelHVDCLineActivePowerLimitsTo`** | Minimum and maximum active power flows to the TO node. Units: MW. | [required]
**`arc`** | **`Int64`** | An `Arc` defining this line `from` a bus `to` another bus. | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`base_current`** | **`Float64`** | Base current for per-unitization of this line's per-unit fields — this DC line per-unitizes against a current base, not a power base. Units: A. | [required]
**`c`** | **`Float64`** | Shunt capacitance. Per-unit on this line's `base_current`. Units: pu. | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`l`** | **`Float64`** | Total series inductance, split equally on both sides of the shunt capacitance. Per-unit on this line's `base_current`. Units: pu. | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`parameter_units`** | **`Union{Absent,Nothing,TModelHVDCLineParameterUnits}`** | Unit basis for this line's impedance field (r). | [optional]
**`r`** | **`Float64`** | Total series resistance, split equally on both sides of the shunt capacitance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [required]
