# StorageCost

Cost representation for storage units

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`charge_variable_cost`** | **`Union{Absent,CostCurve,Nothing}`** | Variable operation cost of a device expressed directly in currency. Wraps a `ValueCurve` that may be in input-output, incremental, or average-rate form, with `power_units` declaring the basis of the x axis and `vom_cost` adding a proportional variable operation and maintenance term. | [optional]
**`cost_type`** | **`Union{Absent,Nothing,String}`** |  | [optional]
**`discharge_variable_cost`** | **`Union{Absent,CostCurve,Nothing}`** | Variable operation cost of a device expressed directly in currency. Wraps a `ValueCurve` that may be in input-output, incremental, or average-rate form, with `power_units` declaring the basis of the x axis and `vom_cost` adding a proportional variable operation and maintenance term. | [optional]
**`energy_shortage_cost`** | **`Union{Absent,Float64,Nothing}`** |  | [optional]
**`energy_surplus_cost`** | **`Union{Absent,Float64,Nothing}`** |  | [optional]
**`fixed`** | **`Float64`** |  | [required]
**`shut_down`** | **`Float64`** |  | [required]
**`start_up`** | **`StorageCostStartUp`** |  | [required]
