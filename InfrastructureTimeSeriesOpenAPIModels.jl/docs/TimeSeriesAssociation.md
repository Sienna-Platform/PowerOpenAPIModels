# TimeSeriesAssociation

Metadata linking one time series to the component or supplemental attribute that owns it — the JSON form of a row in the store's `time_series_associations` catalog table. A closed set of six canonical types owned by the data layer: two static (SingleTimeSeries on a regular grid, NonSequentialTimeSeries on explicit irregular timestamps) and four forecasts. The type decides which timing fields the row carries, which is why each is its own schema rather than one row with everything nullable.

Dense values never appear here. `uri` names the store location that holds them; `data_hash` optionally carries a content hash of that array. Other content hashes (features_hash, timestamps_hash) remain store-internal and deliberately absent.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`value`** | **`Union{Deterministic,DeterministicSingleTimeSeries,NonSequentialTimeSeries,Probabilistic,Scenarios,SingleTimeSeries,TimeSeriesAssociation1,TimeSeriesAssociation2,TimeSeriesAssociation3,TimeSeriesAssociation4,TimeSeriesAssociation5,TimeSeriesAssociation6}`** |  | [required]
