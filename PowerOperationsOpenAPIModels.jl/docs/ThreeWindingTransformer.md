# ThreeWindingTransformer

A three-winding transformer modeled as an equivalent star: each TransformerCircuit connects a terminal bus to the star bus, carrying that winding's series data. r_12/x_12, r_23/x_23, r_31/x_31 are optional, set together or all absent.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`admittance_units`** | **`Union{Absent,AdmittanceUnitBasis,Nothing}`** | Unit basis for the magnetizing_shunt admittance. | [optional]
**`base_power_12`** | **`Union{Absent,Float64,Nothing}`** | Base power for per unitization for primary-secondary windings. Units: MVA. | [optional]
**`base_power_23`** | **`Union{Absent,Float64,Nothing}`** | Base power for per unitization for secondary-tertiary windings. Units: MVA. | [optional]
**`base_power_31`** | **`Union{Absent,Float64,Nothing}`** | Base power for per unitization for tertiary-primary windings. Units: MVA. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`magnetizing_shunt`** | **`Union{Absent,Nothing,ComplexNumber}`** | Magnetizing shunt admittance referenced to the primary circuit's base voltage. Units: per admittance_units — NATURAL_UNITS: S, COMPONENT_MVAR: MVAr, COMPONENT_BASE: pu . | [optional]
**`name`** | **`String`** | Name of the component. Unique among components of the same type; components of different types may share a name. | [required]
**`parameter_units`** | **`Union{Absent,ImpedanceUnitBasis,Nothing}`** | Unit basis for the pairwise measured impedance fields (r_12, x_12, r_23, x_23, r_31, x_31). One basis governs all three winding pairs. | [optional]
**`primary_circuit`** | **`Int64`** | The primary `TransformerCircuit` connecting the primary bus to the star bus. | [required]
**`r_12`** | **`Union{Absent,Float64,Nothing}`** | Measured resistance, referenced to the primary winding's base voltage, from primary to secondary windings (R1-2 in PSS/E). Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [optional]
**`r_23`** | **`Union{Absent,Float64,Nothing}`** | Measured resistance, referenced to the secondary winding's base voltage, from secondary to tertiary windings (R2-3 in PSS/E). Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [optional]
**`r_31`** | **`Union{Absent,Float64,Nothing}`** | Measured resistance, referenced to the tertiary winding's base voltage, from tertiary to primary windings (R3-1 in PSS/E). Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [optional]
**`secondary_circuit`** | **`Int64`** | The secondary `TransformerCircuit` connecting the secondary bus to the star bus. | [required]
**`shunt_location`** | **`Union{Absent,Nothing,ThreeWindingTransformerShuntLocation}`** | Placement of `magnetizing_shunt` in the equivalent star model. | [optional]
**`star_bus`** | **`Int64`** | Star (hidden) Bus that this component (equivalent model) is connected to. | [required]
**`tertiary_circuit`** | **`Int64`** | The tertiary `TransformerCircuit` connecting the tertiary bus to the star bus. | [required]
**`x_12`** | **`Union{Absent,Float64,Nothing}`** | Measured reactance, referenced to the primary winding's base voltage, from primary to secondary windings (X1-2 in PSS/E). Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [optional]
**`x_23`** | **`Union{Absent,Float64,Nothing}`** | Measured reactance, referenced to the secondary winding's base voltage, from secondary to tertiary windings (X2-3 in PSS/E). Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [optional]
**`x_31`** | **`Union{Absent,Float64,Nothing}`** | Measured reactance, referenced to the tertiary winding's base voltage, from tertiary to primary windings (X3-1 in PSS/E). Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu . | [optional]
