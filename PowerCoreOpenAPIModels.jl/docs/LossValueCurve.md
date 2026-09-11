# LossValueCurve

Shape of a loss curve, selected by curve_type. INPUT_OUTPUT gives total loss at each flow level. INCREMENTAL gives the marginal loss rate. Individual loss fields may accept a narrower set of shapes than this union.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`value`** | **`Union{IncrementalCurve,InputOutputCurve}`** |  | [required]
