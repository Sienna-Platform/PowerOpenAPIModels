# LossValueCurve

The shape of a loss curve, selected by `curve_type`. `INPUT_OUTPUT` gives the total loss at each flow level -- a constant loss plus a proportional loss rate, in MW of loss per MW of flow. `INCREMENTAL` gives the marginal loss rate instead, the form a piecewise model uses to give different proportional losses on different flow segments. Individual loss fields accept narrower sets of shapes than this union admits; the consuming data layer enforces that, not this schema.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`value`** | **`Union{IncrementalCurve,InputOutputCurve}`** |  | [required]
