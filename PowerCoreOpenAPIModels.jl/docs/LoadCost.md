# LoadCost

Cost representation for controllable load units

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`cost_type`** | **`Union{Absent,Nothing,String}`** |  | [optional]
**`fixed`** | **`Union{Absent,Float64,Nothing}`** |  | [optional]
**`variable_operation_cost`** | **`CostCurve`** | Variable operation cost of a device expressed directly in currency. Wraps a `ValueCurve` that may be in input-output, incremental, or average-rate form, with `power_units` declaring the basis of the x axis and `vom_cost` adding a proportional variable operation and maintenance term. | [required]
