# TwoWindingTransformer

A two-winding transformer connecting two buses. All series electrical data lives on the single TransformerCircuit it references; availability is circuit-level. magnetizing_shunt and shunt_location are transformer-level.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`admittance_units`** | **`Union{Absent,AdmittanceUnitBasis,Nothing}`** | Unit basis for the magnetizing_shunt admittance. | [optional]
**`circuit`** | **`Int64`** | The `TransformerCircuit` carrying this transformer's series electrical data. | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`magnetizing_shunt`** | **`Union{Absent,Nothing,ComplexNumber}`** | Magnetizing shunt admittance referenced to the circuit's `base_voltage_primary`. Units: per admittance_units — NATURAL_UNITS: S, COMPONENT_MVAR: MVAr, COMPONENT_BASE: pu . | [optional]
**`name`** | **`String`** | Name of the component. Unique among components of the same type; components of different types may share a name. | [required]
**`shunt_location`** | **`Union{Absent,Nothing,TwoWindingTransformerShuntLocation}`** | Placement of `magnetizing_shunt` on the two sides of the circuit arc. | [optional]
