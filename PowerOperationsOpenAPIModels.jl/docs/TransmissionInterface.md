# TransmissionInterface


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., &#x60;PowerLoad&#x60;) must have unique names, but components of different types (e.g., &#x60;PowerLoad&#x60; and &#x60;ACBus&#x60;) can have the same name. | [default to nothing]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (&#x60;true&#x60;) or disconnected, offline, or down (&#x60;false&#x60;). Unavailable components are excluded during simulations. | [default to nothing]
**`active_power_flow_limits`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`violation_penalty`** | **`Float64`** | Penalty cost for violating the flow limits in the interface. | [optional] [default to nothing]
**`direction_mapping`** | **`Dict{String, Int64}`** | Dictionary of the line &#x60;name&#x60;s in the interface and their direction of flow (1 or -1) relative to the flow of the interface. | [optional] [default to nothing]
**`base_power`** | **`Float64`** | System base power for per-unitization of this component&#39;s per-unit fields, recorded per component in lieu of a system-level table. Units: MVA. | [default to nothing]
**`power_units`** | **`String`** | Unit basis for this component&#39;s power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component&#39;s own base_power. NATURAL_UNITS: the field&#39;s physical unit. | [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


