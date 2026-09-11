# CapitalCost

Investment cost for candidate generation and transmission technologies which includes overnight capital costs and last-mile interconnection costs.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`capital_cost`** | **`ValueCurve`** | A cost or fuel curve: function data plus how to read its y axis. INPUT_OUTPUT reads the total f(x), INCREMENTAL the marginal rate f'(x), AVERAGE_RATE the average f(x)/x. The TIME_SERIES_* variants are their time-varying equivalents. | [required]
**`interconnection_cost`** | **`Union{Absent,Float64,Nothing}`** |  | [optional]
