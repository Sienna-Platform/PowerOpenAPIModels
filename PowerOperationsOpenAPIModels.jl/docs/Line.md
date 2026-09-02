# Line

An AC transmission line.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power_flow`** | **`Float64`** | Initial condition of active power flow on the line. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`angle_limits`** | **`LineAngleLimits`** | Minimum and maximum angle limits. Units: rad. | [required]
**`arc`** | **`Int64`** | An `Arc` defining this line `from` a bus `to` another bus. | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`b`** | **`Union{Absent,LineB,Nothing}`** | Shunt susceptance, specified both on the `from` and `to` ends of the line. These are commonly modeled with the same value. Units: per parameter_units — NATURAL_UNITS: S, COMPONENT_BASE: pu . | [optional]
**`base_power`** | **`Float64`** | System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA. | [required]
**`g`** | **`Union{Absent,LineG,Nothing}`** | Shunt conductance, specified both on the `from` and `to` ends of the line. These are commonly modeled with the same value. Units: per parameter_units — NATURAL_UNITS: S, COMPONENT_BASE: pu . | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`parameter_units`** | **`Union{Absent,LineParameterUnits,Nothing}`** | Unit basis for this line's impedance and shunt admittance fields (r, x, b, g). | [optional]
**`power_units`** | **`LinePowerUnits`** | Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit. | [required]
**`r`** | **`Float64`** | Resistance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [required]
**`rating`** | **`Float64`** | Thermal rating. Flow on the line must be between -`rating` and `rating`. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [required]
**`rating_b`** | **`Union{Absent,Float64,Nothing}`** | Second current rating. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [optional]
**`rating_c`** | **`Union{Absent,Float64,Nothing}`** | Third current rating. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [optional]
**`reactive_power_flow`** | **`Float64`** | Initial condition of reactive power flow on the line. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
**`x`** | **`Float64`** | Reactance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [required]
