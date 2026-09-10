# NodalHVDCTransportTechnologyLineLoss

Loss model coefficients. Accepts a linear model with a constant loss and a proportional loss rate, or a Piecewise loss with N segments for different proportional losses. All terms are defined as fraction of installed nameplate capacity. Units: 1.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`value`** | **`Union{AverageRateCurve,IncrementalCurve,InputOutputCurve,TimeSeriesAverageRateCurve,TimeSeriesIncrementalCurve,TimeSeriesInputOutputCurve}`** |  | [required]
