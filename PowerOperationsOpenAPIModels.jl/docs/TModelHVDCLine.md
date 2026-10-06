# TModelHVDCLine

A High Voltage DC transmission line for modeling DC transmission networks.

This line must be connected to a `DCBus` on each end. It uses a T-Model of the line impedance. This is suitable for operational simulations with a multi-terminal DC network. This line has no independent per-component power base, so its power fields are always natural units. Impedance, voltage, and voltage-droop fields are natural units only: there is no conventional DC base voltage from which to per-unitize them.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`active_power_flow`** | **`Float64`** | Initial condition of active power flow on the line. Units: MW. | [required]
**`arc`** | **`Int64`** | An `Arc` defining this line `from` a bus `to` another bus. | [required]
**`base_current`** | **`Float64`** | Base current of the line as recorded by the source data. No field of this component is per-unit on it. Units: A. | [required]
**`r`** | **`Float64`** | Total series resistance, split equally on both sides of the shunt capacitance. Units: ohm. | [required]
**`l`** | **`Float64`** | Total series inductance, split equally on both sides of the shunt capacitance. Units: H. | [required]
**`c`** | **`Float64`** | Shunt capacitance. Units: F. | [required]
**`operational_flow_limit`** | **`Union{Absent,Nothing,OperationalFlowLimit}`** | Operator-set minimum and maximum flow in each direction. Absent means no operational limit. Units: MW. | [optional]
