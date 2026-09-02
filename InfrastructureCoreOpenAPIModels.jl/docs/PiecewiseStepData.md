# PiecewiseStepData

Data for a step function, constant on each segment, defined by the x coordinates of the segment endpoints and one y value per segment. The y values are per-segment rates, not absolute values; use `PiecewiseLinearData` when the data gives a value at each point. `x_coords` ascends and holds at least two entries, and `y_coords` holds exactly one fewer.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`function_type`** | **`String`** |  | [required]
**`x_coords`** | **`Vector{Float64}`** |  | [required]
**`y_coords`** | **`Vector{Float64}`** |  | [required]
