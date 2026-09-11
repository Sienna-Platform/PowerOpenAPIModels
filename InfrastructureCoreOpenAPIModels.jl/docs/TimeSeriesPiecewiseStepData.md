# TimeSeriesPiecewiseStepData

Time-series-backed variant of `PiecewiseStepData`. In place of inline coordinate vectors it carries `association_id`, referencing a stored series that supplies them at each step; use it when the segments change over time.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`association_id`** | **`Int64`** | Id of the time series association supplying this function data's values over time. Resolved against that store; not assigned by a document producer. | [required]
**`function_type`** | **`String`** |  | [required]
