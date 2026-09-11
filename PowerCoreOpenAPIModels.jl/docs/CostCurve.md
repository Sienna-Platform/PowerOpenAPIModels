# CostCurve

Variable operation cost of a device in currency. Wraps a ValueCurve in input-output, incremental, or average-rate form; `power_units` sets the x-axis basis and `vom_cost` adds a proportional O&M term.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`power_units`** | **`UnitSystem`** | Unit basis a stored value is expressed in. COMPONENT_BASE: per-unit against a base the component records itself. NATURAL_UNITS: the quantity's own physical unit. No system-wide option exists. | [required]
**`value_curve`** | **`ValueCurve`** | A cost or fuel curve: function data plus how to read its y axis. INPUT_OUTPUT reads the total f(x), INCREMENTAL the marginal rate f'(x), AVERAGE_RATE the average f(x)/x. The TIME_SERIES_* variants are their time-varying equivalents. | [required]
**`variable_cost_type`** | **`String`** |  | [required]
**`vom_cost`** | **`InputOutputCurve`** | A curve whose y values are the total input f(x) at production level x: currency per hour against MW, or fuel per hour against MW. An absolute quantity, not a rate; use IncrementalCurve for marginal-rate data. | [required]
