# TwoTerminalLoss1



## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**value** | This is a oneOf model. The value must be exactly one of the following types: IncrementalCurve, InputOutputCurve | A generic loss model coefficients. It accepts a linear model with a constant loss and a proportional loss rate (MW of loss per MW of flow). It also accepts a Piecewise loss, with N segments to specify different proportional losses for different segments. | [optional] 

The discriminator field is `curve_type` with the following mapping:
 - `INCREMENTAL`: `IncrementalCurve`
 - `INPUT_OUTPUT`: `InputOutputCurve`



[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


