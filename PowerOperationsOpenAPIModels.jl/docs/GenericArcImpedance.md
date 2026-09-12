# GenericArcImpedance

A generic branch defined by a series impedance on an `Arc` between two buses.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`active_power_flow`** | **`Float64`** | Initial condition of active power flow on the line. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`reactive_power_flow`** | **`Float64`** | Initial condition of reactive power flow on the line. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
**`max_flow`** | **`Float64`** | Maximum allowable flow on the generic impedance. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`arc`** | **`Int64`** | An `Arc` defining this line `from` a bus `to` another bus. | [required]
**`base_power`** | **`Float64`** | System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA. | [required]
**`power_units`** | **`UnitSystem`** | Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit. | [required]
**`parameter_units`** | **`Union{Absent,ImpedanceUnitBasis,Nothing}`** | Unit basis for r and x. COMPONENT_BASE is per-unit on this component's base_power, which records the system base. | [optional]
**`r`** | **`Float64`** | Resistance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [required]
**`x`** | **`Float64`** | Reactance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [required]
