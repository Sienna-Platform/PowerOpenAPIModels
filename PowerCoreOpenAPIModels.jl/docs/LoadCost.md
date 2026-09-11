# LoadCost

Cost representation for controllable load units

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`cost_type`** | **`Union{Absent,Nothing,String}`** |  | [optional]
**`fixed`** | **`Union{Absent,Float64,Nothing}`** |  | [optional]
**`variable_operation_cost`** | **`CostCurve`** | Variable operation cost of a device in currency. Wraps a ValueCurve in input-output, incremental, or average-rate form; `power_units` sets the x-axis basis and `vom_cost` adds a proportional O&M term. | [required]
