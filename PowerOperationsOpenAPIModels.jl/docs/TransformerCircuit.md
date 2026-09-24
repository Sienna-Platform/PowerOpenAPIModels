# TransformerCircuit

The data defining one modeled arc of a transformer.

A `TwoWindingTransformer` has one circuit; a `ThreeWindingTransformer` has three, each connecting a terminal bus to the star bus. Circuit `available` is the single source of truth for availability; the owning transformer derives its availability from its circuits. `r`/`x` are the circuit impedance (for a two-winding transformer, the series impedance; for a three-winding transformer, the star-leg equivalent), in pu (device base) on `base_power` referenced to `base_voltage_primary`. Tap-changer / phase-shifter control is described by the flat control fields: `control_objective = UNDEFINED` means the circuit has no control block. For a `TwoWindingTransformer`, the single circuit's `base_power` is the transformer's device base.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`available`** | **`Bool`** | Indicator of whether this circuit is connected and online. | [required]
**`arc`** | **`Int64`** | An `Arc` defining this circuit `from` a terminal bus `to` the transformer's other terminal or star bus. | [required]
**`tap`** | **`Union{Absent,Float64,Nothing}`** | Normalized tap changer position for voltage control, varying between 0 and 2, with 1 centered at the nominal voltage. Units: 1. | [optional]
**`alpha`** | **`Union{Absent,Float64,Nothing}`** | Initial condition of phase shift across this circuit. Units: rad. | [optional]
**`parameter_units`** | **`Union{Absent,ImpedanceUnitBasis,Nothing}`** | Unit basis for this circuit's impedance fields (r, x). | [optional]
**`r`** | **`Union{Absent,Float64,Nothing}`** | Circuit resistance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [optional]
**`x`** | **`Union{Absent,Float64,Nothing}`** | Circuit reactance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [optional]
**`control_objective`** | **`Union{Absent,Nothing,TransformerControlObjective}`** | Tap-changer / phase-shifter control objective (PSS/E COD). `UNDEFINED` means this circuit has no control block. | [optional]
**`regulated_bus_id`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the bus whose voltage this circuit's tap changer regulates (PSS/E CONT). Set exactly when `control_objective` is `VOLTAGE` or `VOLTAGE_DISABLED`, null otherwise. | [optional]
**`regulated_bus_side`** | **`Union{Absent,Union{Nothing,TransformerRegulatedBusSide}}`** | Side of the controlling winding on which the regulated bus lies, replacing the sign of PSS/E CONT. Set only when the regulated bus is not one of the transformer's own terminal buses; when it is, the side follows from the connections and this must be null. | [optional]
**`load_drop_compensation_r`** | **`Union{Absent,Float64,Nothing}`** | Resistive part of the load drop compensation impedance for voltage control (PSS/E CR): the regulated voltage is compensated by `load_drop_compensation_r + j load_drop_compensation_x` times the circuit current. Zero means no compensation. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [optional]
**`load_drop_compensation_x`** | **`Union{Absent,Float64,Nothing}`** | Reactive part of the load drop compensation impedance for voltage control (PSS/E CX). Zero means no compensation. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [optional]
**`control_limits`** | **`Union{Absent,Nothing,MinMax}`** | Control band (PSS/E RMA/RMI), per `control_objective`. Units: per control_objective — UNDEFINED: 1, VOLTAGE_DISABLED: 1, REACTIVE_POWER_FLOW_DISABLED: 1, ACTIVE_POWER_FLOW_DISABLED: rad, CONTROL_OF_DC_LINE_DISABLED: 1, ASYMMETRIC_ACTIVE_POWER_FLOW_DISABLED: rad, FIXED: 1, VOLTAGE: 1, REACTIVE_POWER_FLOW: 1, ACTIVE_POWER_FLOW: rad, CONTROL_OF_DC_LINE: 1, ASYMMETRIC_ACTIVE_POWER_FLOW: rad . | [optional]
**`controlled_quantity_limits`** | **`Union{Absent,Nothing,MinMax}`** | Controlled-quantity band (PSS/E VMA/VMI), per `control_objective`. Units: per control_objective — UNDEFINED: pu, VOLTAGE_DISABLED: pu, REACTIVE_POWER_FLOW_DISABLED: MVAr, ACTIVE_POWER_FLOW_DISABLED: MW, CONTROL_OF_DC_LINE_DISABLED: MW, ASYMMETRIC_ACTIVE_POWER_FLOW_DISABLED: MW, FIXED: pu, VOLTAGE: pu, REACTIVE_POWER_FLOW: MVAr, ACTIVE_POWER_FLOW: MW, CONTROL_OF_DC_LINE: MW, ASYMMETRIC_ACTIVE_POWER_FLOW: MW . | [optional]
**`number_of_tap_positions`** | **`Union{Absent,Int64,Nothing}`** | Number of tap positions (PSS/E NTP). | [optional]
**`rating`** | **`Union{Absent,Float64,Nothing}`** | Thermal rating. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [optional]
**`rating_b`** | **`Union{Absent,Float64,Nothing}`** | Second current rating. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [optional]
**`rating_c`** | **`Union{Absent,Float64,Nothing}`** | Third current rating. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [optional]
**`active_power_flow`** | **`Union{Absent,Float64,Nothing}`** | Initial condition of active power flow through this circuit. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [optional]
**`reactive_power_flow`** | **`Union{Absent,Float64,Nothing}`** | Initial condition of reactive power flow through this circuit. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
**`base_power`** | **`Union{Absent,Float64,Nothing}`** | Base power for per unitization of this circuit. Units: MVA. | [optional]
**`power_units`** | **`UnitSystem`** | Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit. | [required]
**`base_voltage_primary`** | **`Union{Absent,Float64,Nothing}`** | Primary (from) terminal-side base voltage; the reference voltage for this circuit's per-unit impedance. Units: kV. | [optional]
**`base_voltage_secondary`** | **`Union{Absent,Float64,Nothing}`** | Secondary (to) terminal-side base voltage. For a three-winding transformer this defaults to the primary base voltage at parse time. Units: kV. | [optional]
