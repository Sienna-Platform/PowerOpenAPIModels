# VirtualParticipant


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., &#x60;PowerLoad&#x60;) must have unique names, but components of different types (e.g., &#x60;PowerLoad&#x60; and &#x60;ACBus&#x60;) can have the same name. | [default to nothing]
**`available`** | **`Bool`** | Indicator of whether the participant is available for market clearing (&#x60;true&#x60;) or not (&#x60;false&#x60;). | [default to nothing]
**`settlement_point_id`** | **`Int64`** | ID of the location this participant settles at — a bus, area, or load zone. &#x60;null&#x60; when the participant settles at trading hubs instead. | [optional] [default to nothing]
**`max_supply`** | **`Float64`** | Maximum envelope for the incremental (supply) side. Units: MW. | [default to nothing]
**`max_demand`** | **`Float64`** | Maximum envelope for the decremental (demand) side. Units: MW. | [default to nothing]
**`operation_cost`** | [**`*VirtualParticipantOperationCost`**](VirtualParticipantOperationCost.md) |  | [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


