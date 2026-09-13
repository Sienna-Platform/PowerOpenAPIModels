# FixedAdmittance

A fixed admittance.

Most often used in dynamics or AC power flow studies as a source of reactive power.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [required]
**`admittance_units`** | **`Union{Absent,Nothing,ShuntAdmittanceUnitBasis}`** | Unit basis for the shunt admittance Y. COMPONENT_MVAR is PSS/E RAW native (Mvar/MW at unity voltage). | [optional]
**`y`** | **`ComplexNumber`** | Fixed admittance. Units: per admittance_units — NATURAL_UNITS: S, COMPONENT_MVAR: MVAr . | [required]
**`base_power`** | **`Float64`** | System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA. | [required]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection model for admittance, if any. | [optional]
