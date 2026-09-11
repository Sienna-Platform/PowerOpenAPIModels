# FunctionData

Raw mathematical data defining f(x): coefficients or point tables with no units attached. `function_type` selects linear, quadratic, piecewise linear, or piecewise constant. TIME_SERIES_* variants reference a stored series.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`value`** | **`Union{LinearFunctionData,PiecewiseLinearData,PiecewiseStepData,QuadraticFunctionData,TimeSeriesLinearFunctionData,TimeSeriesPiecewiseLinearData,TimeSeriesPiecewiseStepData,TimeSeriesQuadraticFunctionData}`** |  | [required]
