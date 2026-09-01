# ValueCurve



## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**value** | This is a oneOf model. The value must be exactly one of the following types: AverageRateCurve, IncrementalCurve, InputOutputCurve, TimeSeriesAverageRateCurve, TimeSeriesIncrementalCurve, TimeSeriesInputOutputCurve | A cost or fuel curve: function data plus a declaration of how to read its y axis. &#x60;INPUT_OUTPUT&#x60; reads y as the total &#x60;f(x)&#x60;, &#x60;INCREMENTAL&#x60; as the marginal rate &#x60;f&#39;(x)&#x60;, and &#x60;AVERAGE_RATE&#x60; as the average &#x60;f(x)/x&#x60;; the three can express the same underlying function and are inter-convertible given &#x60;initial_input&#x60;. The &#x60;TIME_SERIES_*&#x60; variants are the time-varying equivalents. Which form to use follows the data source: bid stacks are incremental, total cost tables input-output, efficiency tables average rate. | [optional] 

The discriminator field is `curve_type` with the following mapping:
 - `AVERAGE_RATE`: `AverageRateCurve`
 - `INCREMENTAL`: `IncrementalCurve`
 - `INPUT_OUTPUT`: `InputOutputCurve`
 - `TIME_SERIES_AVERAGE_RATE`: `TimeSeriesAverageRateCurve`
 - `TIME_SERIES_INCREMENTAL`: `TimeSeriesIncrementalCurve`
 - `TIME_SERIES_INPUT_OUTPUT`: `TimeSeriesInputOutputCurve`



[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


