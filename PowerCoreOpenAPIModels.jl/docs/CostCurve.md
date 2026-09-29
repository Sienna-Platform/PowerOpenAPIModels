# CostCurve

Variable operation cost of a device expressed directly in currency. Wraps a `ValueCurve` that may be in input-output, incremental, or average-rate form, with `vom_cost` adding a proportional variable operation and maintenance term. A cost curve is always in natural units: its x axis is power in MW, never per-unit. Units: x-axis MW ; y-axis USD/h .

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`value_curve`** | **`ValueCurve`** | A cost or fuel curve: function data plus a declaration of how to read its y axis. `INPUT_OUTPUT` reads y as the total `f(x)`, `INCREMENTAL` as the marginal rate `f'(x)`, and `AVERAGE_RATE` as the average `f(x)/x`; the three can express the same underlying function and are inter-convertible given `initial_input`. The `TIME_SERIES_*` variants are the time-varying equivalents. Which form to use follows the data source: bid stacks are incremental, total cost tables input-output, efficiency tables average rate. | [required]
**`variable_cost_type`** | **`String`** |  | [required]
**`vom_cost`** | **`InputOutputCurve`** | A curve whose y values are the total input `f(x)` at production level `x` — currency per hour against MW in a cost curve, fuel per hour against MW in a fuel curve. The y axis is an absolute quantity, not a rate; use `IncrementalCurve` for marginal-rate data. | [required]
