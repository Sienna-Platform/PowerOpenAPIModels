# IncrementalCurve

A curve whose y values are the marginal rate f'(x) at production level x, the native form for bid stacks and incremental heat rate data. `initial_input` anchors the absolute level, enabling conversion to an InputOutputCurve.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`curve_type`** | **`String`** |  | [required]
**`function_data`** | **`IncrementalCurveFunctionData`** |  | [required]
**`initial_input`** | **`Union{Absent,Float64,Nothing}`** |  | [optional]
**`input_at_zero`** | **`Union{Absent,Float64,Nothing}`** |  | [optional]
