# OfflineReserveVariable

Operating reserve demand curve, either static or time-series-backed. Time series values are carried via `time_series_associations` in the sidecar, never inline. Omit when the reserve has no demand curve.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`power_units`** | **`UnitSystem`** | Unit basis a stored value is expressed in. COMPONENT_BASE: per-unit against a base the component records itself. NATURAL_UNITS: the quantity's own physical unit. No system-wide option: a value per-unitized against a shared base records that base on the component and rides as COMPONENT_BASE. Used in three scopes, each read against its own record rather than a document-wide table: a component's own `power_units` (against that component's `base_power`), a cost payload's own `power_units` (e.g. `CostCurve`, against the owning component's `base_power`), and a time series association's own `unit_system` (governing only that one series). | [required]
**`value_curve`** | **`ValueCurve`** | A cost or fuel curve: function data plus a declaration of how to read its y axis. `INPUT_OUTPUT` reads y as the total `f(x)`, `INCREMENTAL` as the marginal rate `f'(x)`, and `AVERAGE_RATE` as the average `f(x)/x`; the three can express the same underlying function and are inter-convertible given `initial_input`. The `TIME_SERIES_*` variants are the time-varying equivalents. Which form to use follows the data source: bid stacks are incremental, total cost tables input-output, efficiency tables average rate. | [required]
**`variable_cost_type`** | **`String`** |  | [required]
**`vom_cost`** | **`InputOutputCurve`** | A curve whose y values are the total input `f(x)` at production level `x` — currency per hour against MW in a cost curve, fuel per hour against MW in a fuel curve. The y axis is an absolute quantity, not a rate; use `IncrementalCurve` for marginal-rate data. | [required]
