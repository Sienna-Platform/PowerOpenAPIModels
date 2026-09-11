# FunctionData

Raw mathematical data defining a function `f(x)` — coefficients or point tables with no units or interpretation attached. `function_type` selects the shape: linear, quadratic, piecewise linear through (x, y) points, or piecewise constant between x endpoints. What `x` and `y` stand for is supplied by whatever wraps this, and the `TIME_SERIES_*` variants hold a reference to a stored series in place of the numbers.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`value`** | **`Union{LinearFunctionData,PiecewiseLinearData,PiecewiseStepData,QuadraticFunctionData,TimeSeriesLinearFunctionData,TimeSeriesPiecewiseLinearData,TimeSeriesPiecewiseStepData,TimeSeriesQuadraticFunctionData}`** |  | [required]
