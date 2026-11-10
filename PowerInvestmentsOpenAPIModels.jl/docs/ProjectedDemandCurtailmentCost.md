# ProjectedDemandCurtailmentCost

Cost of voluntary curtailment. A linear curve is a single price for all curtailable demand; a piecewise incremental curve gives tiers whose x coordinates are fractions of demand, from 0 to `max_demand_curtailment`, and whose slopes are prices. Units: USD/MWh.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`value`** | **`Union{AverageRateCurve,IncrementalCurve,InputOutputCurve,TimeSeriesAverageRateCurve,TimeSeriesIncrementalCurve,TimeSeriesInputOutputCurve}`** |  | [required]
