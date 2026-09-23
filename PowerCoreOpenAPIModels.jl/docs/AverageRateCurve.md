# AverageRateCurve

A curve whose y values are the average rate `f(x)/x` at production level `x` — total cost or fuel divided by output, the form heat rate tables use when they report MBTU/MWh against MW. `initial_input` records the total input at the minimum production point and is what makes conversion to an `InputOutputCurve` possible. Use `IncrementalCurve` when the data gives marginal rather than average rates.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`curve_type`** | **`String`** |  | [required]
**`function_data`** | **`AverageRateCurveFunctionData`** |  | [required]
**`initial_input`** | **`Union{Absent,Float64,Nothing}`** |  | [optional]
**`input_at_zero`** | **`Union{Absent,Float64,Nothing}`** |  | [optional]
