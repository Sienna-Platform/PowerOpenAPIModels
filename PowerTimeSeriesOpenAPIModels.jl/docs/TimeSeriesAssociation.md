# TimeSeriesAssociation



## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**value** | This is a oneOf model. The value must be exactly one of the following types: Deterministic, DeterministicSingleTimeSeries, NonSequentialTimeSeries, Probabilistic, Scenarios, SingleTimeSeries | Metadata linking one time series to the component or supplemental attribute that owns it — the JSON form of a row in the store&#39;s &#x60;time_series_associations&#x60; catalog table. A closed set of six canonical types owned by the data layer: two static (SingleTimeSeries on a regular grid, NonSequentialTimeSeries on explicit irregular timestamps) and four forecasts. The type decides which timing fields the row carries, which is why each is its own schema rather than one row with everything nullable.  Dense values never appear here. &#x60;address&#x60; names the store that holds them; content hashes (data_hash, features_hash, timestamps_hash) are store-internal and deliberately absent. | [optional] 

The discriminator field is `time_series_type` with the following mapping:
 - `Deterministic`: `Deterministic`
 - `DeterministicSingleTimeSeries`: `DeterministicSingleTimeSeries`
 - `NonSequentialTimeSeries`: `NonSequentialTimeSeries`
 - `Probabilistic`: `Probabilistic`
 - `Scenarios`: `Scenarios`
 - `SingleTimeSeries`: `SingleTimeSeries`



[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


