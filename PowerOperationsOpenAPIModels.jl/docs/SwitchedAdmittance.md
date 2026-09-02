# SwitchedAdmittance

A switched admittance, with discrete steps to adjust the admittance.

Most often used in power flow studies, iterating over the steps to see impacts of admittance on the results. Total admittance is calculated as: `Y` + `number_of_steps` * `Y_increase`.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`y`** | **`SwitchedAdmittanceY`** | Initial admittance at N = 0. Units: per admittance_units — NATURAL_UNITS: S, COMPONENT_MVAR: MVAr . | [required]
**`y_increase`** | **`Union{Absent,Nothing,Vector{ComplexNumber}}`** | Vector with admittance increment step for each adjustable shunt block. For example, `Y_increase[2]` is the complex admittance increment for each step at block 2. Units: per admittance_units — NATURAL_UNITS: S, COMPONENT_MVAR: MVAr . | [optional]
**`admittance_limits`** | **`Union{Absent,Nothing,SwitchedAdmittanceAdmittanceLimits}`** | Shunt admittance limits for switched shunt model. Units: per admittance_units — NATURAL_UNITS: S, COMPONENT_MVAR: MVAr . | [optional]
**`admittance_units`** | **`Union{Absent,Nothing,SwitchedAdmittanceAdmittanceUnits}`** | Unit basis for the shunt admittance Y. COMPONENT_MVAR is PSS/E RAW native (Mvar/MW at unity voltage). | [optional]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [required]
**`control_mode`** | **`Union{Absent,Nothing,SwitchedAdmittanceControlMode}`** | Switched-shunt control mode (PSS/E MODSW). | [optional]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection model for admittance, if any. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`initial_status`** | **`Union{Absent,Nothing,Vector{Int64}}`** | Vector of initial switched shunt status, one for in-service and zero for out-of-service for block i (1 through 8). | [optional]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`number_of_steps`** | **`Union{Absent,Nothing,Vector{Int64}}`** | Vector with number of steps for each adjustable shunt block. For example, `number_of_steps[2]` are the number of available steps for admittance increment at block 2. | [optional]
**`regulated_bus_number`** | **`Union{Absent,Int64,Nothing}`** | Bus number whose voltage/quantity this shunt regulates; 0 means local bus (PSS/E SWREM/NREG). Units: 1. | [optional]
