# ThreeWindingTransformer

A three-winding transformer, modeled as an equivalent star: each referenced `TransformerCircuit` connects a terminal bus to the star (hidden) bus and carries that winding's series electrical data; availability is circuit-level. The pairwise measured impedances `r_12`/`x_12`, `r_23`/`x_23`, `r_31`/`x_31` (PSS/E CZ = 1, each in pu on the corresponding `base_power_12`/`base_power_23`/`base_power_31` and referenced to the first-index winding's base voltage) are optional and must be set together or all be absent; the star-leg impedances derived from them at parse time live on the circuits and are not synced back. Power-flow and Ybus assembly read the per-circuit star-leg impedances, not the pairwise fields. The model is described in Chapter 3.6 of J.D. Glover, M.S. Sarma and T. Overbye: Power Systems Analysis and Design.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`primary_circuit`** | **`Int64`** | The primary `TransformerCircuit` connecting the primary bus to the star bus. | [required]
**`secondary_circuit`** | **`Int64`** | The secondary `TransformerCircuit` connecting the secondary bus to the star bus. | [required]
**`tertiary_circuit`** | **`Int64`** | The tertiary `TransformerCircuit` connecting the tertiary bus to the star bus. | [required]
**`star_bus`** | **`Int64`** | Star (hidden) Bus that this component (equivalent model) is connected to. | [required]
**`parameter_units`** | **`Union{Absent,ImpedanceUnitBasis,Nothing}`** | Unit basis for the pairwise measured impedance fields (r_12, x_12, r_23, x_23, r_31, x_31). PSS/E supplies a single CZ flag for the whole three-winding transformer record, so one basis governs all three winding pairs. | [optional]
**`r_12`** | **`Union{Absent,Float64,Nothing}`** | Measured resistance, referenced to the primary winding's base voltage, from primary to secondary windings (R1-2 in PSS/E). Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [optional]
**`x_12`** | **`Union{Absent,Float64,Nothing}`** | Measured reactance, referenced to the primary winding's base voltage, from primary to secondary windings (X1-2 in PSS/E). Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [optional]
**`r_23`** | **`Union{Absent,Float64,Nothing}`** | Measured resistance, referenced to the secondary winding's base voltage, from secondary to tertiary windings (R2-3 in PSS/E). Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [optional]
**`x_23`** | **`Union{Absent,Float64,Nothing}`** | Measured reactance, referenced to the secondary winding's base voltage, from secondary to tertiary windings (X2-3 in PSS/E). Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [optional]
**`r_31`** | **`Union{Absent,Float64,Nothing}`** | Measured resistance, referenced to the tertiary winding's base voltage, from tertiary to primary windings (R3-1 in PSS/E). Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [optional]
**`x_31`** | **`Union{Absent,Float64,Nothing}`** | Measured reactance, referenced to the tertiary winding's base voltage, from tertiary to primary windings (X3-1 in PSS/E). Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [optional]
**`base_power_12`** | **`Union{Absent,Float64,Nothing}`** | Base power for per unitization for primary-secondary windings. Units: MVA. | [optional]
**`base_power_23`** | **`Union{Absent,Float64,Nothing}`** | Base power for per unitization for secondary-tertiary windings. Units: MVA. | [optional]
**`base_power_31`** | **`Union{Absent,Float64,Nothing}`** | Base power for per unitization for tertiary-primary windings. Units: MVA. | [optional]
**`admittance_units`** | **`Union{Absent,AdmittanceUnitBasis,Nothing}`** | Unit basis for the magnetizing_shunt admittance. | [optional]
**`magnetizing_shunt`** | **`Union{Absent,Nothing,ComplexNumber}`** | Magnetizing shunt admittance referenced to the primary circuit's base voltage. Units: per admittance_units — NATURAL_UNITS: S, COMPONENT_MVAR: MVAr, COMPONENT_BASE: pu . | [optional]
**`shunt_location`** | **`Union{Absent,Nothing,ThreeWindingTransformerShuntLocation}`** | Placement of `magnetizing_shunt` in the equivalent star model. | [optional]
