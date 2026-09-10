# TwoTerminalLoss

Loss model of a two-terminal HVDC line as a function of flow, selected by `curve_type`. It accepts a linear model with a constant loss and a proportional loss rate (MW of loss per MW of flow), or a piecewise model giving different proportional losses on different flow segments.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`value`** | **`Union{IncrementalCurve,InputOutputCurve}`** |  | [required]
