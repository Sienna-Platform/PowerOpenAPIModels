# TwoWindingTransformer

A two-winding transformer connecting two buses.

All series electrical data — the modeled arc, tap, phase shift, series impedance `r`/`x`, ratings, per-winding base power, base voltages, and control — lives on the single `TransformerCircuit` referenced by `circuit`; availability is circuit-level. The `magnetizing_shunt` admittance and its `shunt_location` are transformer-level. The model uses an equivalent circuit assuming the impedance is on the high-voltage side and allocates iron losses and magnetizing susceptance according to `shunt_location`. The transformer's device base is the circuit's `base_power`.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`admittance_units`** | **`Union{Absent,Nothing,TwoWindingTransformerAdmittanceUnits}`** | Unit basis for the magnetizing_shunt admittance. | [optional]
**`circuit`** | **`Int64`** | The `TransformerCircuit` carrying this transformer's series electrical data. | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`magnetizing_shunt`** | **`Union{Absent,Nothing,TwoWindingTransformerMagnetizingShunt}`** | Magnetizing shunt admittance referenced to the circuit's `base_voltage_primary`. Units: per admittance_units — NATURAL_UNITS: S, COMPONENT_MVAR: MVAr, COMPONENT_BASE: pu . | [optional]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`shunt_location`** | **`Union{Absent,Nothing,TwoWindingTransformerShuntLocation2}`** | Placement of `magnetizing_shunt` on the two sides of the circuit arc. | [optional]
