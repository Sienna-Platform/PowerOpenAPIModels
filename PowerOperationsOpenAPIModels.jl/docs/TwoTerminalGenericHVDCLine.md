# TwoTerminalGenericHVDCLine

A High Voltage DC line, which must be connected to an ACBus on each end. This model is appropriate for operational simulations with a linearized DC power flow approximation with losses proportional to the power flow. For modeling a DC network, see TModelHVDCLine.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power_flow`** | **`Float64`** | Initial condition of active power flow on the line. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`active_power_limits_from`** | **`TwoTerminalGenericHVDCLineActivePowerLimitsFrom`** | Minimum and maximum active power flows to the FROM node. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`active_power_limits_to`** | **`TwoTerminalGenericHVDCLineActivePowerLimitsTo`** | Minimum and maximum active power flows to the TO node. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`arc`** | **`Int64`** | An Arc defining this line `from` a bus `to` another bus. | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`base_power`** | **`Float64`** | System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA. | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`loss`** | **`Union{Absent,Nothing,TwoTerminalGenericHVDCLineLoss}`** | Loss model coefficients. It accepts a linear model with a constant loss and a proportional loss rate (MW of loss per MW of flow). It also accepts a Piecewise loss, with N segments to specify different proportional losses for different segments. | [optional]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`power_units`** | **`TwoTerminalGenericHVDCLinePowerUnits`** | Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit. | [required]
**`reactive_power_limits_from`** | **`TwoTerminalGenericHVDCLineReactivePowerLimitsFrom`** | Minimum and maximum reactive power limits to the FROM node. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
**`reactive_power_limits_to`** | **`TwoTerminalGenericHVDCLineReactivePowerLimitsTo`** | Minimum and maximum reactive power limits to the TO node. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
