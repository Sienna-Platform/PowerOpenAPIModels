# AreaInterchange


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., &#x60;PowerLoad&#x60;) must have unique names, but components of different types (e.g., &#x60;PowerLoad&#x60; and &#x60;ACBus&#x60;) can have the same name. | [default to nothing]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (&#x60;true&#x60;) or disconnected, offline, or down (&#x60;false&#x60;). Unavailable components are excluded during simulations. | [default to nothing]
**`active_power_flow`** | **`Float64`** | Initial condition of active power flow on the line. Units: MW. | [default to nothing]
**`from_area`** | **`Int64`** | Area from which the power is extracted. | [default to nothing]
**`to_area`** | **`Int64`** | Area to which the power is injected. | [default to nothing]
**`flow_limits`** | [**`*FromToToFrom`**](FromToToFrom.md) |  | [default to nothing]
**`base_power`** | **`Float64`** | System base power for per-unitization of this component&#39;s per-unit fields, recorded per component in lieu of a system-level table. Units: MVA. | [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


