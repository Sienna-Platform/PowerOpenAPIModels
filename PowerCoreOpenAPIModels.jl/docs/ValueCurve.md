# ValueCurve



## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**value** | This is a oneOf model. The value must be exactly one of the following types: AverageRateCurve, IncrementalCurve, InputOutputCurve, TimeSeriesAverageRateCurve, TimeSeriesIncrementalCurve, TimeSeriesInputOutputCurve |  | [optional] 

The discriminator field is `curve_type` with the following mapping:
 - `AVERAGE_RATE`: `AverageRateCurve`
 - `INCREMENTAL`: `IncrementalCurve`
 - `INPUT_OUTPUT`: `InputOutputCurve`
 - `TIME_SERIES_AVERAGE_RATE`: `TimeSeriesAverageRateCurve`
 - `TIME_SERIES_INCREMENTAL`: `TimeSeriesIncrementalCurve`
 - `TIME_SERIES_INPUT_OUTPUT`: `TimeSeriesInputOutputCurve`



[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


