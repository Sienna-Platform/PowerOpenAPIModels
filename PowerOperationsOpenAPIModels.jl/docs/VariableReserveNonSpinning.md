# VariableReserveNonSpinning


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., &#x60;PowerLoad&#x60;) must have unique names, but components of different types (e.g., &#x60;PowerLoad&#x60; and &#x60;ACBus&#x60;) can have the same name. | [default to nothing]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (&#x60;true&#x60;) or disconnected, offline, or down (&#x60;false&#x60;). Unavailable components are excluded during simulations. | [default to nothing]
**`time_frame`** | **`Float64`** | The saturation time frame to provide reserve contribution. Units: min. | [default to nothing]
**`requirement`** | **`Float64`** | The required quantity of the product, which should be scaled by a time series. Units: MW. | [default to nothing]
**`sustained_time`** | **`Float64`** | The time reserve contribution must be sustained at a specified level. Units: s. | [optional] [default to 14400.0]
**`max_output_fraction`** | **`Float64`** | The maximum fraction of each device&#39;s output that can be assigned to the service. | [optional] [default to 1.0]
**`max_participation_factor`** | **`Float64`** | The maximum portion [0, 1.0] of the reserve that can be contributed per device. | [optional] [default to 1.0]
**`deployed_fraction`** | **`Float64`** | Fraction of service procurement that is assumed to be actually deployed. Most commonly, this is assumed to be either 0.0 or 1.0. | [optional] [default to 0.0]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


