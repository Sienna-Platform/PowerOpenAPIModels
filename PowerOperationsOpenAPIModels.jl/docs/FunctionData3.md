# FunctionData3



## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**value** | This is a oneOf model. The value must be exactly one of the following types: LinearFunctionData, PiecewiseLinearData, PiecewiseStepData, QuadraticFunctionData, TimeSeriesLinearFunctionData1, TimeSeriesPiecewiseLinearData1, TimeSeriesPiecewiseStepData1, TimeSeriesQuadraticFunctionData1 | Only TIME_SERIES_LINEAR, TIME_SERIES_QUADRATIC, or TIME_SERIES_PIECEWISE_LINEAR is admissible here; the static variants and TIME_SERIES_PIECEWISE_STEP are invalid and rejected by the consuming constructor. | [optional] 

The discriminator field is `function_type` with the following mapping:
 - `LINEAR`: `LinearFunctionData`
 - `PIECEWISE_LINEAR`: `PiecewiseLinearData`
 - `PIECEWISE_STEP`: `PiecewiseStepData`
 - `QUADRATIC`: `QuadraticFunctionData`
 - `TIME_SERIES_LINEAR`: `TimeSeriesLinearFunctionData`
 - `TIME_SERIES_PIECEWISE_LINEAR`: `TimeSeriesPiecewiseLinearData`
 - `TIME_SERIES_PIECEWISE_STEP`: `TimeSeriesPiecewiseStepData`
 - `TIME_SERIES_QUADRATIC`: `TimeSeriesQuadraticFunctionData`



[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


