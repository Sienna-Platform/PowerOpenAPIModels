# SwitchedAdmittance

A switched admittance, with discrete steps to adjust the admittance.

Most often used in power flow studies, iterating over the steps to see impacts of admittance on the results. Total admittance is `number_engaged` * `Y_increase`, unless `solved_admittance` is set, in which case that value is the effective admittance. There is no fixed base admittance: a PSS/E SWITCHED SHUNT record carries only BINIT and the per-block increments.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [required]
**`admittance_units`** | **`Union{Absent,Nothing,ShuntAdmittanceUnitBasis}`** | Unit basis for the shunt admittance fields. COMPONENT_MVAR is PSS/E RAW native (Mvar/MW at unity voltage). | [optional]
**`number_engaged`** | **`Union{Absent,Nothing,Vector{Int64}}`** | Vector with the number of steps currently engaged (switched in) for each adjustable shunt block. For example, `number_engaged[2]` is the number of steps in service at block 2, and cannot exceed `number_of_steps[2]`. | [optional]
**`number_of_steps`** | **`Union{Absent,Nothing,Vector{Int64}}`** | Vector with number of steps for each adjustable shunt block. For example, `number_of_steps[2]` are the number of available steps for admittance increment at block 2. | [optional]
**`y_increase`** | **`Union{Absent,Nothing,Vector{ComplexNumber}}`** | Vector with admittance increment step for each adjustable shunt block. For example, `Y_increase[2]` is the complex admittance increment for each step at block 2. Units: per admittance_units — NATURAL_UNITS: S, COMPONENT_MVAR: MVAr . | [optional]
**`solved_admittance`** | **`Union{Absent,Union{Float64,Nothing}}`** | Solved-case switched shunt admittance (PSS/E BINIT); when present it is the shunt's effective admittance, used in place of `number_engaged` * `Y_increase`. Units: per admittance_units — NATURAL_UNITS: S, COMPONENT_MVAR: MVAr . | [optional]
**`admittance_limits`** | **`Union{Absent,Nothing,MinMax}`** | Shunt admittance limits for switched shunt model. Units: per admittance_units — NATURAL_UNITS: S, COMPONENT_MVAR: MVAr . | [optional]
**`control_mode`** | **`Union{Absent,Nothing,SwitchedAdmittanceControlMode}`** | Switched-shunt control mode. | [optional]
**`remote_regulated_bus_id`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the bus this shunt regulates in every control mode (PSS/E SWREG): the bus whose voltage it holds in the voltage modes, or the bus of the device whose reactive power it tracks in the other modes, which downstream modeling interprets per mode. Null means the shunt's own bus; a value equal to that bus is invalid. | [optional]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection model for admittance, if any. | [optional]
