# PiecewiseStepData

Data for a step function, constant on each segment: x coordinates of segment endpoints plus one y value per segment. Values are per-segment rates, not absolute. x_coords ascends with at least two entries; y_coords holds one fewer.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`function_type`** | **`String`** |  | [required]
**`x_coords`** | **`Vector{Float64}`** |  | [required]
**`y_coords`** | **`Vector{Float64}`** |  | [required]
