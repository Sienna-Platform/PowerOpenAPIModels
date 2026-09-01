# ProductionVariableCostCurve



## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**value** | This is a oneOf model. The value must be exactly one of the following types: CostCurve, FuelCurve | Variable production cost of a device, selected by &#x60;variable_cost_type&#x60; between a curve denominated directly in currency (&#x60;COST&#x60;) and one denominated in fuel with a separate fuel price (&#x60;FUEL&#x60;). | [optional] 

The discriminator field is `variable_cost_type` with the following mapping:
 - `COST`: `CostCurve`
 - `FUEL`: `FuelCurve`



[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


