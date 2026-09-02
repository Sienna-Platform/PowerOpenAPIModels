# ValueCurve

A cost or fuel curve: function data plus a declaration of how to read its y axis. `INPUT_OUTPUT` reads y as the total `f(x)`, `INCREMENTAL` as the marginal rate `f'(x)`, and `AVERAGE_RATE` as the average `f(x)/x`; the three can express the same underlying function and are inter-convertible given `initial_input`. The `TIME_SERIES_*` variants are the time-varying equivalents. Which form to use follows the data source: bid stacks are incremental, total cost tables input-output, efficiency tables average rate.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`value`** | **`Union{AverageRateCurve,IncrementalCurve,InputOutputCurve,TimeSeriesAverageRateCurve,TimeSeriesIncrementalCurve,TimeSeriesInputOutputCurve}`** |  | [required]
