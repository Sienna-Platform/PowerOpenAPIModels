# SwitchedAdmittance


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., &#x60;PowerLoad&#x60;) must have unique names, but components of different types (e.g., &#x60;PowerLoad&#x60; and &#x60;ACBus&#x60;) can have the same name. | [default to nothing]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (&#x60;true&#x60;) or disconnected, offline, or down (&#x60;false&#x60;). Unavailable components are excluded during simulations. | [default to nothing]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [default to nothing]
**`admittance_units`** | **`String`** | Unit basis for the shunt admittance Y. DEVICE_MVAR is PSS/E RAW native (Mvar/MW at unity voltage). | [optional] [default to "DEVICE_MVAR"]
**`Y`** | [**`*ComplexNumber2`**](ComplexNumber2.md) |  | [default to nothing]
**`initial_status`** | **`Vector{Int64}`** | Vector of initial switched shunt status, one for in-service and zero for out-of-service for block i (1 through 8). | [optional] [default to nothing]
**`number_of_steps`** | **`Vector{Int64}`** | Vector with number of steps for each adjustable shunt block. For example, &#x60;number_of_steps[2]&#x60; are the number of available steps for admittance increment at block 2. | [optional] [default to nothing]
**`Y_increase`** | [**`Vector{ComplexNumber3}`**](ComplexNumber3.md) | Vector with admittance increment step for each adjustable shunt block. For example, &#x60;Y_increase[2]&#x60; is the complex admittance increment for each step at block 2. Per-unit on system base. Units: pu. Units: per admittance_units — SYSTEM_BASE: pu, NATURAL_UNITS: S, DEVICE_MVAR: MVAr . | [optional] [default to nothing]
**`admittance_limits`** | [**`*MinMax`**](MinMax.md) |  | [optional] [default to nothing]
**`control_mode`** | **`String`** | Switched-shunt control mode (PSS/E MODSW). | [optional] [default to "FIXED"]
**`regulated_bus_number`** | **`Int64`** | Bus number whose voltage/quantity this shunt regulates; 0 means local bus (PSS/E SWREM/NREG). Units: 1. | [optional] [default to 0]
**`dynamic_injector`** | **`Int64`** | ID of the corresponding dynamic injection model for admittance, if any. | [optional] [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


