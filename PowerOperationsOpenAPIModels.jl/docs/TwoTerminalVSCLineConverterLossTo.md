# TwoTerminalVSCLineConverterLossTo

Loss model coefficients in the `to` bus converter. It accepts a linear model or quadratic. Same converter data is used in both ends.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`curve_type`** | **`String`** |  | [required]
**`function_data`** | **`TwoTerminalVSCLineConverterLossToFunctionData`** |  | [required]
**`input_at_zero`** | **`Union{Absent,Float64,Nothing}`** |  | [optional]
