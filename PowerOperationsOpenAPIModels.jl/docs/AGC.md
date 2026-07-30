# AGC


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., &#x60;PowerLoad&#x60;) must have unique names, but components of different types (e.g., &#x60;PowerLoad&#x60; and &#x60;ACBus&#x60;) can have the same name. | [default to nothing]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (&#x60;true&#x60;) or disconnected, offline, or down (&#x60;false&#x60;). Unavailable components are excluded during simulations. | [default to nothing]
**`bias`** | **`Float64`** | Area frequency bias. Units: MW/Hz. | [default to nothing]
**`K_p`** | **`Float64`** | PID Proportional Constant. | [default to nothing]
**`K_i`** | **`Float64`** | PID Integral Constant. | [default to nothing]
**`K_d`** | **`Float64`** | PID Derivative Constant. | [default to nothing]
**`delta_t`** | **`Float64`** | PID Discretization period. Units: s. | [default to nothing]
**`area`** | **`Int64`** | ID of the area controlled by the AGC. | [optional] [default to nothing]
**`initial_ace`** | **`Float64`** | Initial condition for ACE. | [optional] [default to 0.0]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


