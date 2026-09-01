# TwoTerminalLoss



## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**value** | This is a oneOf model. The value must be exactly one of the following types: IncrementalCurve, InputOutputCurve | Loss model of a two-terminal HVDC line as a function of flow, selected by &#x60;curve_type&#x60;. It accepts a linear model with a constant loss and a proportional loss rate (MW of loss per MW of flow), or a piecewise model giving different proportional losses on different flow segments. | [optional] 

The discriminator field is `curve_type` with the following mapping:
 - `INCREMENTAL`: `IncrementalCurve`
 - `INPUT_OUTPUT`: `InputOutputCurve`



[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


