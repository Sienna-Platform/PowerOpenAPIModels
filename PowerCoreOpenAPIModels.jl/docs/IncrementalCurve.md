# IncrementalCurve

A curve whose y values are the marginal rate `f'(x)` at production level `x` — the native form for market bid stacks and incremental heat rate data. `initial_input` records the total input at the minimum production point, anchoring the absolute level and enabling conversion to an `InputOutputCurve`. Use `InputOutputCurve` when the data gives total cost at each output level.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`curve_type`** | **`String`** |  | [required]
**`function_data`** | **`IncrementalCurveFunctionData`** |  | [required]
**`initial_input`** | **`Union{Absent,Float64,Nothing}`** |  | [optional]
**`input_at_zero`** | **`Union{Absent,Float64,Nothing}`** |  | [optional]
