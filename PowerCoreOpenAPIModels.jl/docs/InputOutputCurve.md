# InputOutputCurve

A curve whose y values are the total input `f(x)` at production level `x` — currency per hour against MW in a cost curve, fuel per hour against MW in a fuel curve. The y axis is an absolute quantity, not a rate; use `IncrementalCurve` for marginal-rate data.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`curve_type`** | **`String`** |  | [required]
**`function_data`** | **`InputOutputCurveFunctionData`** |  | [required]
**`input_at_zero`** | **`Union{Absent,Float64,Nothing}`** |  | [optional]
