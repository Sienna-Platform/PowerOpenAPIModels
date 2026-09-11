# FuelCurve

Variable operation cost of a device in fuel consumed (MBTU, liters, m^3) plus the price converting fuel to currency. Wraps a ValueCurve; exactly one of fuel_cost and fuel_cost_time_series supplies the price.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`fuel_cost`** | **`Union{Absent,Union{Float64,Nothing}}`** | Fixed fuel cost per unit of fuel, or null when fuel_cost_time_series supplies a time-varying one. Exactly one of the two is set. | [optional]
**`fuel_cost_time_series`** | **`Union{Absent,Union{Int64,Nothing}}`** | Store-minted id of the fuel-cost time series association, or null when fuel_cost carries a fixed value. Exactly one of the two is set. | [optional]
**`power_units`** | **`UnitSystem`** | Unit basis a stored value is expressed in. COMPONENT_BASE: per-unit against a base the component records itself. NATURAL_UNITS: the quantity's own physical unit. No system-wide option exists. | [required]
**`startup_fuel_offtake`** | **`Union{Absent,InputOutputCurve,Nothing}`** | Fuel consumed during startup, as a curve in the unit's fuel units. | [optional]
**`value_curve`** | **`ValueCurve`** | A cost or fuel curve: function data plus how to read its y axis. INPUT_OUTPUT reads the total f(x), INCREMENTAL the marginal rate f'(x), AVERAGE_RATE the average f(x)/x. The TIME_SERIES_* variants are their time-varying equivalents. | [required]
**`variable_cost_type`** | **`String`** |  | [required]
**`vom_cost`** | **`InputOutputCurve`** | A curve whose y values are the total input f(x) at production level x: currency per hour against MW, or fuel per hour against MW. An absolute quantity, not a rate; use IncrementalCurve for marginal-rate data. | [required]
