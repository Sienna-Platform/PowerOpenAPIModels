# SwitchedAdmittance

A switched admittance with discrete steps, most often used in power flow studies. Total admittance is number_engaged * Y_increase, unless solved_admittance is set, in which case that value is the effective admittance.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`y_increase`** | **`Union{Absent,Nothing,Vector{ComplexNumber}}`** | Admittance increment for each adjustable shunt block, e.g. Y_increase[2] is the increment at block 2. Units: per admittance_units — NATURAL_UNITS: S, COMPONENT_MVAR: MVAr . | [optional]
**`admittance_limits`** | **`Union{Absent,Nothing,MinMax}`** | Shunt admittance limits for switched shunt model. Units: per admittance_units — NATURAL_UNITS: S, COMPONENT_MVAR: MVAr . | [optional]
**`admittance_units`** | **`Union{Absent,Nothing,ShuntAdmittanceUnitBasis}`** | Unit basis for the shunt admittance fields. COMPONENT_MVAR is PSS/E RAW native (Mvar/MW at unity voltage). | [optional]
**`available`** | **`Bool`** | Whether the component is online (true) or offline (false). Unavailable components are excluded from simulations. | [required]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [required]
**`control_mode`** | **`Union{Absent,Nothing,SwitchedAdmittanceControlMode}`** | Switched-shunt control mode. | [optional]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection model for admittance, if any. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the component. Unique among components of the same type; components of different types may share a name. | [required]
**`number_engaged`** | **`Union{Absent,Nothing,Vector{Int64}}`** | Number of steps currently engaged (switched in) for each adjustable shunt block; cannot exceed number_of_steps for that block. | [optional]
**`number_of_steps`** | **`Union{Absent,Nothing,Vector{Int64}}`** | Number of available steps for admittance increment at each adjustable shunt block. | [optional]
**`regulated_bus_number`** | **`Union{Absent,Int64,Nothing}`** | Bus number whose voltage/quantity this shunt regulates; 0 means local bus (PSS/E SWREM/NREG). Units: 1. | [optional]
**`solved_admittance`** | **`Union{Absent,Union{Float64,Nothing}}`** | Solved-case switched shunt admittance (PSS/E BINIT); when present it is the shunt's effective admittance, used in place of `number_engaged` * `Y_increase`. Units: per admittance_units — NATURAL_UNITS: S, COMPONENT_MVAR: MVAr . | [optional]
