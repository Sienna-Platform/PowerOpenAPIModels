# TransformerCircuit

The data defining one modeled arc of a transformer.

A `TwoWindingTransformer` has one circuit; a `ThreeWindingTransformer` has three, each connecting a terminal bus to the star bus. Circuit `available` is the single source of truth for availability; the owning transformer derives its availability from its circuits. `r`/`x` are the circuit impedance (for a two-winding transformer, the series impedance; for a three-winding transformer, the star-leg equivalent), in pu (device base) on `base_power` referenced to `base_voltage_primary`. Tap-changer / phase-shifter control is described by the flat control fields: `control_objective = UNDEFINED` means the circuit has no control block. Each objective selects exactly one actuator band (`tap_ratio_limits` or `phase_angle_limits`) and one target band (`controlled_voltage_limits`, `controlled_reactive_power_flow_limits` or `controlled_active_power_flow_limits`); every other band is `null`. For a `TwoWindingTransformer`, the single circuit's `base_power` is the transformer's device base.

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
**`regulated_bus_number`** | **`Union{Absent,Int64,Nothing}`** | Controlled bus number (PSS/E CONT; sign = regulation side). | [optional]
**`tap_ratio_limits`** | **`Union{Absent,Nothing,MinMax}`** | Tap-ratio actuator band (PSS/E RMA/RMI) when `control_objective` moves the tap; `null` otherwise. Under the tap-moving objectives it may be omitted and then defaults to 0.9 to 1.1, PSS/E's own RMI/RMA defaults, which is why it is the one band the conditional blocks do not require. Units: 1. | [optional]
**`phase_angle_limits`** | **`Union{Absent,Nothing,MinMax}`** | Phase-shift actuator band (PSS/E RMA/RMI when the objective moves the angle). `null` unless `control_objective` selects it. Units: rad. | [optional]
**`controlled_voltage_limits`** | **`Union{Absent,Nothing,MinMax}`** | Regulated-voltage target band (PSS/E VMA/VMI), per unit of the regulated bus's base voltage. `null` unless `control_objective` selects it. Units: pu. | [optional]
**`controlled_reactive_power_flow_limits`** | **`Union{Absent,Nothing,MinMax}`** | Regulated reactive-power-flow target band (PSS/E VMA/VMI). `null` unless `control_objective` selects it. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
**`controlled_active_power_flow_limits`** | **`Union{Absent,Nothing,MinMax}`** | Regulated active-power-flow target band (PSS/E VMA/VMI). `null` unless `control_objective` selects it. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu . | [optional]
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
