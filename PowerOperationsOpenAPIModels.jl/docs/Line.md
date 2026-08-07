# Line


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., &#x60;PowerLoad&#x60;) must have unique names, but components of different types (e.g., &#x60;PowerLoad&#x60; and &#x60;ACBus&#x60;) can have the same name. | [default to nothing]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (&#x60;true&#x60;) or disconnected, offline, or down (&#x60;false&#x60;). Unavailable components are excluded during simulations. | [default to nothing]
**`active_power_flow`** | **`Float64`** | Initial condition of active power flow on the line. Units: MW. | [default to nothing]
**`reactive_power_flow`** | **`Float64`** | Initial condition of reactive power flow on the line. Units: MVAr. | [default to nothing]
**`arc`** | **`Int64`** | An &#x60;Arc&#x60; defining this line &#x60;from&#x60; a bus &#x60;to&#x60; another bus. | [default to nothing]
**`r`** | **`Float64`** | Resistance. Per-unit on &#x60;base_power&#x60;, which records the system base. Units: pu. | [default to nothing]
**`x`** | **`Float64`** | Reactance. Per-unit on &#x60;base_power&#x60;, which records the system base. Units: pu. | [default to nothing]
**`base_power`** | **`Float64`** | System base power for per-unitization of this component&#39;s per-unit fields, recorded per component in lieu of a system-level table. Units: MVA. | [default to nothing]
**`b`** | [**`*FromTo`**](FromTo.md) |  | [optional] [default to nothing]
**`rating`** | **`Float64`** | Thermal rating. Flow on the line must be between -&#x60;rating&#x60; and &#x60;rating&#x60;. Units: MVA. | [default to nothing]
**`rating_b`** | **`Float64`** | Second current rating. Units: MVA. | [optional] [default to nothing]
**`rating_c`** | **`Float64`** | Third current rating. Units: MVA. | [optional] [default to nothing]
**`angle_limits`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`g`** | [**`*FromTo`**](FromTo.md) |  | [optional] [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


