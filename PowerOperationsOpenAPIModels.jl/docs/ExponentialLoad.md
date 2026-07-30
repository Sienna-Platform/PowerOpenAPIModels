# ExponentialLoad


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., &#x60;PowerLoad&#x60;) must have unique names, but components of different types (e.g., &#x60;PowerLoad&#x60; and &#x60;ACBus&#x60;) can have the same name. | [default to nothing]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (&#x60;true&#x60;) or disconnected, offline, or down (&#x60;false&#x60;). Unavailable components are excluded during simulations. | [default to nothing]
**`bus`** | **`Int64`** | ID of the bus that this component is connected to. | [default to nothing]
**`active_power`** | **`Float64`** | Active power coefficient, P0. Units: MW. | [default to nothing]
**`reactive_power`** | **`Float64`** | Reactive power coefficient, Q0. Units: MVAr. | [default to nothing]
**`alpha`** | **`Float64`** | Exponent relating voltage dependency for active power. 0 &#x3D; constant power only, 1 &#x3D; constant current only, and 2 &#x3D; constant impedance only. | [default to nothing]
**`beta`** | **`Float64`** | Exponent relating voltage dependency for reactive power. 0 &#x3D; constant power only, 1 &#x3D; constant current only, and 2 &#x3D; constant impedance only. | [default to nothing]
**`base_power`** | **`Float64`** | Base power of the unit for per unitization. Units: MVA. | [default to nothing]
**`max_active_power`** | **`Float64`** | Maximum active power that this load can demand. Units: MW. | [default to nothing]
**`max_reactive_power`** | **`Float64`** | Maximum reactive power that this load can demand. Units: MVAr. | [default to nothing]
**`conformity`** | **`String`** | Indicates whether the specified load is conforming or non-conforming. | [optional] [default to "UNDEFINED"]
**`dynamic_injector`** | **`Int64`** | ID of the corresponding dynamic injection device, if any. | [optional] [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


