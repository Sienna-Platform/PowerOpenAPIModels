# FunctionData



## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**value** | This is a oneOf model. The value must be exactly one of the following types: LinearFunctionData, PiecewiseLinearData, PiecewiseStepData, QuadraticFunctionData, TimeSeriesLinearFunctionData, TimeSeriesPiecewiseLinearData, TimeSeriesPiecewiseStepData, TimeSeriesQuadraticFunctionData | Raw mathematical data defining a function &#x60;f(x)&#x60; — coefficients or point tables with no units or interpretation attached. &#x60;function_type&#x60; selects the shape: linear, quadratic, piecewise linear through (x, y) points, or piecewise constant between x endpoints. What &#x60;x&#x60; and &#x60;y&#x60; stand for is supplied by whatever wraps this, and the &#x60;TIME_SERIES_*&#x60; variants hold a reference to a stored series in place of the numbers. | [optional] 

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


