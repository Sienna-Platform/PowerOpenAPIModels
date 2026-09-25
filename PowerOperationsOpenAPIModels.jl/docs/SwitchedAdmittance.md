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
**`voltage_limits`** | **`Union{Absent,Nothing,MinMax}`** | Regulated-voltage band (PSS/E VSWLO/VSWHI) at the regulated bus, per unit of its base voltage. `null` unless `control_mode` selects it. Units: pu. | [optional]
**`reactive_power_range_limits`** | **`Union{Absent,Nothing,MinMax}`** | Regulated reactive-power band (PSS/E VSWLO/VSWHI) as a fraction of the regulated device's reactive power range, the plant, converter or FACTS shunt at the regulated bus; 0.2 to 0.8 means 20 to 80 percent of that device's Qmin-to-Qmax span. `null` unless `control_mode` selects it. Units: 1. | [optional]
**`control_mode`** | **`Union{Absent,Nothing,SwitchedAdmittanceControlMode}`** | Switched-shunt control mode (PSS/E MODSW). Voltage modes use `voltage_limits`, reactive modes use `reactive_power_range_limits`; `UNDEFINED` and `FIXED` use neither. | [optional]
**`regulated_bus_number`** | **`Union{Absent,Int64,Nothing}`** | Bus number whose voltage/quantity this shunt regulates; 0 means local bus (PSS/E SWREM/NREG). Units: 1. | [optional]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection model for admittance, if any. | [optional]
