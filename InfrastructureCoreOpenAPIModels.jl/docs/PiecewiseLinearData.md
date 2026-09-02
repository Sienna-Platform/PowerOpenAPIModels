# PiecewiseLinearData

Data for a piecewise linear function defined by (x, y) points and interpolated linearly between consecutive ones. The y values are absolute values at each x, not per-segment slopes; use `PiecewiseStepData` when the data gives per-segment rates. Points run in ascending x order, and two of them define one segment.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`function_type`** | **`String`** |  | [required]
**`points`** | **`Vector{XYCoords}`** |  | [required]
