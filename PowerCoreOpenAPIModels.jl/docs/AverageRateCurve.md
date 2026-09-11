# AverageRateCurve

A curve whose y values are the average rate f(x)/x at production level x, e.g. a heat rate table's MBTU/MWh against MW. `initial_input` anchors conversion to an InputOutputCurve. Use IncrementalCurve for marginal rates.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`curve_type`** | **`String`** |  | [required]
**`function_data`** | **`AverageRateCurveFunctionData`** |  | [required]
**`initial_input`** | **`Union{Absent,Float64,Nothing}`** |  | [optional]
**`input_at_zero`** | **`Union{Absent,Float64,Nothing}`** |  | [optional]
