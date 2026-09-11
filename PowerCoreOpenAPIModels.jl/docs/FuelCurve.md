# FuelCurve

Variable operation cost of a device expressed in fuel consumed — MBTU, liters, m^3 — together with the price that converts fuel to currency. Wraps a `ValueCurve` in input-output, incremental, or average-rate form; exactly one of `fuel_cost` and `fuel_cost_time_series` supplies the price.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`fuel_cost`** | **`Union{Absent,Union{Float64,Nothing}}`** | Fixed fuel cost per unit of fuel, or null when fuel_cost_time_series names a time-varying one. Exactly one of the two is set; producers and consumers enforce it. | [optional]
**`fuel_cost_time_series`** | **`Union{Absent,Union{Int64,Nothing}}`** | Store-minted id of the fuel-cost time series association, or null when fuel_cost carries a fixed value. Exactly one of the two is set. | [optional]
**`power_units`** | **`UnitSystem`** | Unit basis a stored value is expressed in. COMPONENT_BASE: per-unit against a base the component records itself. NATURAL_UNITS: the quantity's own physical unit. No system-wide option: a value per-unitized against a shared base records that base on the component and rides as COMPONENT_BASE. Used in three scopes, each read against its own record rather than a document-wide table: a component's own `power_units` (against that component's `base_power`), a cost payload's own `power_units` (e.g. `CostCurve`, against the owning component's `base_power`), and a time series association's own `unit_system` (governing only that one series). | [required]
**`startup_fuel_offtake`** | **`Union{Absent,InputOutputCurve,Nothing}`** | Fuel consumed during startup, as a curve in the unit's fuel units. | [optional]
**`value_curve`** | **`ValueCurve`** | A cost or fuel curve: function data plus a declaration of how to read its y axis. `INPUT_OUTPUT` reads y as the total `f(x)`, `INCREMENTAL` as the marginal rate `f'(x)`, and `AVERAGE_RATE` as the average `f(x)/x`; the three can express the same underlying function and are inter-convertible given `initial_input`. The `TIME_SERIES_*` variants are the time-varying equivalents. Which form to use follows the data source: bid stacks are incremental, total cost tables input-output, efficiency tables average rate. | [required]
**`variable_cost_type`** | **`String`** |  | [required]
**`vom_cost`** | **`InputOutputCurve`** | A curve whose y values are the total input `f(x)` at production level `x` — currency per hour against MW in a cost curve, fuel per hour against MW in a fuel curve. The y axis is an absolute quantity, not a rate; use `IncrementalCurve` for marginal-rate data. | [required]
