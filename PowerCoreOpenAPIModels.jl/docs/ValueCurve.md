# ValueCurve

A cost or fuel curve: function data plus how to read its y axis. INPUT_OUTPUT reads the total f(x), INCREMENTAL the marginal rate f'(x), AVERAGE_RATE the average f(x)/x. The TIME_SERIES_* variants are their time-varying equivalents.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`value`** | **`Union{AverageRateCurve,IncrementalCurve,InputOutputCurve,TimeSeriesAverageRateCurve,TimeSeriesIncrementalCurve,TimeSeriesInputOutputCurve}`** |  | [required]
