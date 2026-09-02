# EmissionsDataEmissionRate

Emission rate as a ValueCurve, typically an IncrementalCurve with LinearFunctionData (constant or linearly varying rate) or PiecewiseStepData (piecewise step rates). Rates must be non-negative and finite.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`value`** | **`Union{AverageRateCurve,IncrementalCurve,InputOutputCurve,TimeSeriesAverageRateCurve,TimeSeriesIncrementalCurve,TimeSeriesInputOutputCurve}`** |  | [required]
