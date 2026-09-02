# TwoTerminalLCCLineLoss

A generic loss model coefficients. It accepts a linear model with a constant loss and a proportional loss rate (MW of loss per MW of flow). It also accepts a Piecewise loss, with N segments to specify different proportional losses for different segments.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`value`** | **`Union{IncrementalCurve,InputOutputCurve}`** |  | [required]
