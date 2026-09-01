# GenericOperationCost



## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**value** | This is a oneOf model. The value must be exactly one of the following types: HydroGenerationCost, RenewableGenerationCost, ThermalGenerationCost | Operating cost of a generation technology, selected by &#x60;cost_type&#x60; among the thermal (&#x60;THERMAL&#x60;), renewable (&#x60;RENEWABLE&#x60;), and hydro (&#x60;HYDRO_GEN&#x60;) generation cost representations. | [optional] 

The discriminator field is `cost_type` with the following mapping:
 - `HYDRO_GEN`: `HydroGenerationCost`
 - `RENEWABLE`: `RenewableGenerationCost`
 - `THERMAL`: `ThermalGenerationCost`



[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


