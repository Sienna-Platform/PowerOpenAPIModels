# Area


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., &#x60;PowerLoad&#x60;) must have unique names, but components of different types (e.g., &#x60;PowerLoad&#x60; and &#x60;ACBus&#x60;) can have the same name. | [default to nothing]
**`peak_active_power`** | **`Float64`** | Peak active power in the area. Units: MW. | [optional] [default to 0.0]
**`peak_reactive_power`** | **`Float64`** | Peak reactive power in the area. Units: MVAr. | [optional] [default to 0.0]
**`load_response`** | **`Float64`** | Load-frequency damping parameter modeling how much the load in the area changes due to changes in frequency. Units: MW/Hz. | [optional] [default to 0.0]
**`base_power`** | **`Float64`** | System base power for per-unitization of this component&#39;s per-unit fields, recorded per component in lieu of a system-level table. Units: MVA. | [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


