# TimeSeriesInputOutputCurve

A time-series-backed input-output curve. The static counterpart is InputOutputCurve.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`curve_type`** | **`String`** |  | [required]
**`function_data`** | **`FunctionData`** | Only TIME_SERIES_LINEAR, TIME_SERIES_QUADRATIC, or TIME_SERIES_PIECEWISE_LINEAR is admissible here; the static variants and TIME_SERIES_PIECEWISE_STEP are invalid and rejected by the consuming constructor. | [required]
**`input_at_zero`** | **`Union{Absent,Union{Float64,Nothing}}`** | Optional explicit input value at zero output. A number here, unlike the incremental and average-rate variants, where it is a time series reference. | [optional]
