# PiecewiseLinearData

Data for a piecewise linear function defined by (x, y) points, interpolated linearly between them. Values are absolute at each x, not per-segment slopes. Points run in ascending x order.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`function_type`** | **`String`** |  | [required]
**`points`** | **`Vector{XYCoords}`** |  | [required]
