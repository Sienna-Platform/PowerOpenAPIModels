# LossValueCurve



## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**value** | This is a oneOf model. The value must be exactly one of the following types: IncrementalCurve, InputOutputCurve | The shape of a loss curve, selected by &#x60;curve_type&#x60;. &#x60;INPUT_OUTPUT&#x60; gives the total loss at each flow level -- a constant loss plus a proportional loss rate, in MW of loss per MW of flow. &#x60;INCREMENTAL&#x60; gives the marginal loss rate instead, the form a piecewise model uses to give different proportional losses on different flow segments. Individual loss fields accept narrower sets of shapes than this union admits; the consuming data layer enforces that, not this schema. | [optional] 

The discriminator field is `curve_type` with the following mapping:
 - `INCREMENTAL`: `IncrementalCurve`
 - `INPUT_OUTPUT`: `InputOutputCurve`



[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


