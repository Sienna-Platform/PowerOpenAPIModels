# SeriesCompensator

A series compensator on an `Arc`: a series capacitor or reactor, or a thyristor-controlled or static synchronous series compensator, with one series reactance. Devices that also inject at a bus, such as a UPFC, are not covered.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`active_power_flow`** | **`Float64`** | Initial condition of active power flow through the compensator. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [required]
**`reactive_power_flow`** | **`Float64`** | Initial condition of reactive power flow through the compensator. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [required]
**`arc`** | **`Int64`** | An `Arc` defining this line `from` a bus `to` another bus. | [required]
**`r`** | **`Float64`** | Resistance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [required]
**`x`** | **`Float64`** | Series reactance; negative for a capacitor. Under `DISPATCHABLE` and `ACTIVE_POWER_FLOW`, the present value. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [required]
**`rating`** | **`Float64`** | Thermal rating. Flow through the compensator must be between -`rating` and `rating`. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [required]
**`control_mode`** | **`Union{Absent,Nothing,SeriesCompensatorControlMode}`** | How the series reactance is set. `FIXED` holds `x`; `BYPASSED` shorts the compensator into a zero-impedance tie; `DISPATCHABLE` makes the reactance a decision within `reactance_limits`; `ACTIVE_POWER_FLOW` sets it to hold `active_power_flow_setpoint`. | [optional]
**`reactance_limits`** | **`Union{Absent,Nothing,MinMax}`** | Minimum and maximum series reactance. Required when `control_mode` is `DISPATCHABLE` or `ACTIVE_POWER_FLOW`. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [optional]
**`active_power_flow_setpoint`** | **`Union{Absent,Float64,Nothing}`** | Active power flow, from the `from` bus to the `to` bus, the compensator holds. Required when `control_mode` is `ACTIVE_POWER_FLOW`. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [optional]
**`rating_b`** | **`Union{Absent,Float64,Nothing}`** | Second current rating. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [optional]
**`rating_c`** | **`Union{Absent,Float64,Nothing}`** | Third current rating. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [optional]
**`operational_flow_limit`** | **`Union{Absent,Nothing,OperationalFlowLimit}`** | Operator-set minimum and maximum flow in each direction. Absent means no operational limit. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [optional]
**`base_power`** | **`Float64`** | System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA. | [required]
**`power_units`** | **`UnitSystem`** | Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit. | [required]
**`parameter_units`** | **`Union{Absent,ImpedanceUnitBasis,Nothing}`** | Unit basis for r and x. COMPONENT_BASE is per-unit on this component's base_power, which records the system base. | [optional]
