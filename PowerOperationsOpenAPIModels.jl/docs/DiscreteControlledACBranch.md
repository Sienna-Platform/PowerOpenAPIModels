# DiscreteControlledACBranch


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., &#x60;PowerLoad&#x60;) must have unique names, but components of different types (e.g., &#x60;PowerLoad&#x60; and &#x60;ACBus&#x60;) can have the same name. | [default to nothing]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (&#x60;true&#x60;) or disconnected, offline, or down (&#x60;false&#x60;). Unavailable components are excluded during simulations. | [default to nothing]
**`active_power_flow`** | **`Float64`** | Initial condition of active power flow on the line. Units: MW. | [default to nothing]
**`reactive_power_flow`** | **`Float64`** | Initial condition of reactive power flow on the line. Units: MVAr. | [default to nothing]
**`arc`** | **`Int64`** | An &#x60;Arc&#x60; defining this line &#x60;from&#x60; a bus &#x60;to&#x60; another bus. | [default to nothing]
**`r`** | **`Float64`** | Resistance. Per-unit on system base. Units: pu. | [default to nothing]
**`x`** | **`Float64`** | Reactance. Per-unit on system base. Units: pu. | [default to nothing]
**`rating`** | **`Float64`** | Thermal rating. Flow on the branch must be between -&#x60;rating&#x60; and &#x60;rating&#x60;. Units: MVA. | [default to nothing]
**`discrete_branch_type`** | **`String`** | Type of discrete control. | [optional] [default to "OTHER"]
**`branch_status`** | **`String`** | Open or Close status. | [optional] [default to "CLOSED"]
**`normal_branch_status`** | **`String`** | Normal (as-designed) open or close status of the device. | [optional] [default to "CLOSED"]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


