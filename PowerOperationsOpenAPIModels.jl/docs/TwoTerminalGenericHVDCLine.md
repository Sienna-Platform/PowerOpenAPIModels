# TwoTerminalGenericHVDCLine

A high-voltage DC line connected to an ACBus on each end, for operational simulations with a linearized DC power flow approximation and losses proportional to flow. For modeling a DC network, see TModelHVDCLine.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power_flow`** | **`Float64`** | Initial condition of active power flow on the line. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`active_power_limits_from`** | **`MinMax`** | Minimum and maximum active power flows to the FROM node. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`active_power_limits_to`** | **`MinMax`** | Minimum and maximum active power flows to the TO node. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`arc`** | **`Int64`** | An Arc defining this line `from` a bus `to` another bus. | [required]
**`available`** | **`Bool`** | Whether the component is online (true) or offline (false). Unavailable components are excluded from simulations. | [required]
**`base_power`** | **`Float64`** | System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA. | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`loss`** | **`Union{Absent,LossCurve,Nothing}`** | Loss model coefficients: a linear model with constant loss and proportional rate (MW loss per MW flow), or a piecewise loss with N segments. | [optional]
**`name`** | **`String`** | Name of the component. Unique among components of the same type; components of different types may share a name. | [required]
**`power_units`** | **`UnitSystem`** | Unit basis for this component's power fields (power, ratings, ramp rates): COMPONENT_BASE per unit on base_power, NATURAL_UNITS the field's own unit. | [required]
**`reactive_power_limits_from`** | **`MinMax`** | Minimum and maximum reactive power limits to the FROM node. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
**`reactive_power_limits_to`** | **`MinMax`** | Minimum and maximum reactive power limits to the TO node. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
