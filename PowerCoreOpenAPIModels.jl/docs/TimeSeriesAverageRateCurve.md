# TimeSeriesAverageRateCurve

A time-series-backed average rate curve. The static counterpart is AverageRateCurve.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`curve_type`** | **`String`** |  | [required]
**`function_data`** | **`FunctionData`** | Only TIME_SERIES_LINEAR or TIME_SERIES_PIECEWISE_STEP is admissible here; all other FunctionData variants, static or time-series-backed, are rejected by the consuming constructor. | [required]
**`initial_input_association_id`** | **`Union{Absent,Union{Int64,Nothing}}`** | Store-minted id of the time series supplying the initial input value, or null. | [optional]
**`input_at_zero_association_id`** | **`Union{Absent,Union{Int64,Nothing}}`** | Store-minted id of the time series supplying the input at zero output, or null. | [optional]
