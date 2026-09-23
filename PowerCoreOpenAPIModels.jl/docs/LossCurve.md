# LossCurve

Losses of a device as a function of the flow through it, together with the power basis the curve is expressed in. `power_units` governs BOTH axes: a loss curve's y values are power in the same base as its x values, so a change of base rescales both. This is what separates it from a cost curve, whose y axis is currency and so rides through a change of base untouched.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`power_units`** | **`UnitSystem`** | Unit basis a stored value is expressed in. COMPONENT_BASE: per-unit against a base the component records itself. NATURAL_UNITS: the quantity's own physical unit. No system-wide option: a value per-unitized against a shared base records that base on the component and rides as COMPONENT_BASE. Used in three scopes, each read against its own record rather than a document-wide table: a component's own `power_units` (against that component's `base_power`), a cost payload's own `power_units` (e.g. `CostCurve`, against the owning component's `base_power`), and a time series association's own `unit_system` (governing only that one series). | [required]
**`value_curve`** | **`LossValueCurve`** | The shape of a loss curve, selected by `curve_type`. `INPUT_OUTPUT` gives the total loss at each flow level -- a constant loss plus a proportional loss rate, in MW of loss per MW of flow. `INCREMENTAL` gives the marginal loss rate instead, the form a piecewise model uses to give different proportional losses on different flow segments. Individual loss fields accept narrower sets of shapes than this union admits; the consuming data layer enforces that, not this schema. | [required]
