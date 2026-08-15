# RenewableDispatch


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., &#x60;PowerLoad&#x60;) must have unique names, but components of different types (e.g., &#x60;PowerLoad&#x60; and &#x60;ACBus&#x60;) can have the same name. | [default to nothing]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (&#x60;true&#x60;) or disconnected, offline, or down (&#x60;false&#x60;). Unavailable components are excluded during simulations. | [default to nothing]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [default to nothing]
**`active_power`** | **`Float64`** | Initial active power set point of the unit. For power flow, this is the steady state operating point of the system. For production cost modeling, this may or may not be used as the initial starting point for the solver, depending on the solver used. Units: MW. | [default to nothing]
**`reactive_power`** | **`Float64`** | Initial reactive power set point of the unit, used in some production cost modeling simulations. To set the reactive power in a load flow, use &#x60;power_factor&#x60;. Units: MVAr. | [default to nothing]
**`rating`** | **`Float64`** | Maximum AC side output power rating of the unit. Not to be confused with base_power. Units: MVA. | [default to nothing]
**`prime_mover_type`** | **`String`** | Prime mover technology according to EIA 923. | [default to nothing]
**`reactive_power_limits`** | [**`*MinMax`**](MinMax.md) |  | [optional] [default to nothing]
**`power_factor`** | **`Float64`** | Power factor [0, 1] set-point, used in some production cost modeling and in load flow if the unit is connected to a &#x60;PQ&#x60; bus. Units: 1. | [default to nothing]
**`operation_cost`** | [**`*RenewableDispatchOperationCost`**](RenewableDispatchOperationCost.md) |  | [default to nothing]
**`base_power`** | **`Float64`** | Base power of the unit for per unitization. Units: MVA. | [default to nothing]
**`dynamic_injector`** | **`Int64`** | ID of the corresponding dynamic injection device, if any. | [optional] [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


