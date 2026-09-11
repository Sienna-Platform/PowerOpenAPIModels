# LossCurve

Losses of a device as a function of flow through it, plus the power basis the curve is expressed in. `power_units` governs both axes, unlike a cost curve, whose y axis is currency and unaffected by a change of base.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`power_units`** | **`UnitSystem`** | Unit basis a stored value is expressed in. COMPONENT_BASE: per-unit against a base the component records itself. NATURAL_UNITS: the quantity's own physical unit. No system-wide option exists. | [required]
**`value_curve`** | **`LossValueCurve`** | Shape of a loss curve, selected by curve_type. INPUT_OUTPUT gives total loss at each flow level. INCREMENTAL gives the marginal loss rate. Individual loss fields may accept a narrower set of shapes than this union. | [required]
