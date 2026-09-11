# TModelHVDCLine

A high-voltage DC line for modeling DC transmission networks. Connects to a DCBus on each end and uses a T-model of the line impedance, suitable for multi-terminal DC networks. Power fields are always natural units.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power_flow`** | **`Float64`** | Initial condition of active power flow on the line. Units: MW. | [required]
**`active_power_limits_from`** | **`MinMax`** | Minimum and maximum active power flows to the FROM node. Units: MW. | [required]
**`active_power_limits_to`** | **`MinMax`** | Minimum and maximum active power flows to the TO node. Units: MW. | [required]
**`arc`** | **`Int64`** | An `Arc` defining this line `from` a bus `to` another bus. | [required]
**`available`** | **`Bool`** | Whether the component is online (true) or offline (false). Unavailable components are excluded from simulations. | [required]
**`base_current`** | **`Float64`** | Base current for per-unitization of this line's per-unit fields — this DC line per-unitizes against a current base, not a power base. Units: A. | [required]
**`c`** | **`Float64`** | Shunt capacitance. Per-unit on this line's `base_current`. Units: pu. | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`l`** | **`Float64`** | Total series inductance, split equally on both sides of the shunt capacitance. Per-unit on this line's `base_current`. Units: pu. | [required]
**`name`** | **`String`** | Name of the component. Unique among components of the same type; components of different types may share a name. | [required]
**`parameter_units`** | **`Union{Absent,ImpedanceUnitBasis,Nothing}`** | Unit basis for this line's impedance field (r). | [optional]
**`r`** | **`Float64`** | Total series resistance, split equally on both sides of the shunt capacitance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [required]
