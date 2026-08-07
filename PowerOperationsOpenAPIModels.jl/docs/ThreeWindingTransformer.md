# ThreeWindingTransformer


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., &#x60;PowerLoad&#x60;) must have unique names, but components of different types (e.g., &#x60;PowerLoad&#x60; and &#x60;ACBus&#x60;) can have the same name. | [default to nothing]
**`primary_circuit`** | **`Int64`** | The primary &#x60;TransformerCircuit&#x60; connecting the primary bus to the star bus. | [default to nothing]
**`secondary_circuit`** | **`Int64`** | The secondary &#x60;TransformerCircuit&#x60; connecting the secondary bus to the star bus. | [default to nothing]
**`tertiary_circuit`** | **`Int64`** | The tertiary &#x60;TransformerCircuit&#x60; connecting the tertiary bus to the star bus. | [default to nothing]
**`star_bus`** | **`Int64`** | Star (hidden) Bus that this component (equivalent model) is connected to. | [default to nothing]
**`parameter_units`** | **`String`** | Unit basis for the pairwise measured impedance fields (r_12, x_12, r_23, x_23, r_31, x_31). PSS/E supplies a single CZ flag for the whole three-winding transformer record, so one basis governs all three winding pairs. | [optional] [default to "DEVICE_BASE"]
**`r_12`** | **`Float64`** | Measured resistance, referenced to the primary winding&#39;s base voltage, from primary to secondary windings (R1-2 in PSS/E). Units: per parameter_units — NATURAL_UNITS: ohm, DEVICE_BASE: pu . | [optional] [default to nothing]
**`x_12`** | **`Float64`** | Measured reactance, referenced to the primary winding&#39;s base voltage, from primary to secondary windings (X1-2 in PSS/E). Units: per parameter_units — NATURAL_UNITS: ohm, DEVICE_BASE: pu . | [optional] [default to nothing]
**`r_23`** | **`Float64`** | Measured resistance, referenced to the secondary winding&#39;s base voltage, from secondary to tertiary windings (R2-3 in PSS/E). Units: per parameter_units — NATURAL_UNITS: ohm, DEVICE_BASE: pu . | [optional] [default to nothing]
**`x_23`** | **`Float64`** | Measured reactance, referenced to the secondary winding&#39;s base voltage, from secondary to tertiary windings (X2-3 in PSS/E). Units: per parameter_units — NATURAL_UNITS: ohm, DEVICE_BASE: pu . | [optional] [default to nothing]
**`r_31`** | **`Float64`** | Measured resistance, referenced to the tertiary winding&#39;s base voltage, from tertiary to primary windings (R3-1 in PSS/E). Units: per parameter_units — NATURAL_UNITS: ohm, DEVICE_BASE: pu . | [optional] [default to nothing]
**`x_31`** | **`Float64`** | Measured reactance, referenced to the tertiary winding&#39;s base voltage, from tertiary to primary windings (X3-1 in PSS/E). Units: per parameter_units — NATURAL_UNITS: ohm, DEVICE_BASE: pu . | [optional] [default to nothing]
**`base_power_12`** | **`Float64`** | Base power for per unitization for primary-secondary windings. Units: MVA. | [optional] [default to nothing]
**`base_power_23`** | **`Float64`** | Base power for per unitization for secondary-tertiary windings. Units: MVA. | [optional] [default to nothing]
**`base_power_31`** | **`Float64`** | Base power for per unitization for tertiary-primary windings. Units: MVA. | [optional] [default to nothing]
**`admittance_units`** | **`String`** | Unit basis for the magnetizing_shunt admittance. | [optional] [default to "DEVICE_BASE"]
**`magnetizing_shunt`** | [**`*ComplexNumber`**](ComplexNumber.md) |  | [optional] [default to nothing]
**`shunt_location`** | **`String`** | Placement of &#x60;magnetizing_shunt&#x60; in the equivalent star model. | [optional] [default to "PRIMARY"]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


