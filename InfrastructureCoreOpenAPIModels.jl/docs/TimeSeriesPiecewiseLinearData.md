# TimeSeriesPiecewiseLinearData

Time-series-backed variant of `PiecewiseLinearData`. In place of an inline point table it carries `association_id`, referencing a stored series that supplies one at each step; use it when the points change over time.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`association_id`** | **`Int64`** | Store-minted id of the time series association whose values supply this function data over time. Resolved against the accompanying time series store on read; minted by that store and meaningful only against it, never assigned by a document producer. | [required]
**`function_type`** | **`String`** |  | [required]
