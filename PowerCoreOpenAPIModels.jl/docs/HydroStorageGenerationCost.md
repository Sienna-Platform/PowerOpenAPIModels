# HydroStorageGenerationCost



## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**value** | This is a oneOf model. The value must be exactly one of the following types: HydroGenerationCost, StorageCost | Operating cost of hydro generation with storage, selected by &#x60;cost_type&#x60; between the hydro generation (&#x60;HYDRO_GEN&#x60;) and storage (&#x60;STORAGE&#x60;) cost representations. | [optional] 

The discriminator field is `cost_type` with the following mapping:
 - `HYDRO_GEN`: `HydroGenerationCost`
 - `STORAGE`: `StorageCost`



[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


