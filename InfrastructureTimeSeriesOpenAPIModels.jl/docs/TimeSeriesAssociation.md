# TimeSeriesAssociation

Metadata linking one time series to the component or attribute that owns it. A closed set of six canonical types: two static, four forecasts. The type decides which timing fields the row carries. Dense values never appear here.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`value`** | **`Union{Deterministic,DeterministicSingleTimeSeries,NonSequentialTimeSeries,Probabilistic,Scenarios,SingleTimeSeries}`** |  | [required]
