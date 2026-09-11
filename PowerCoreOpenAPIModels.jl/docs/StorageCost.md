# StorageCost

Cost representation for storage units

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`charge_variable_cost`** | **`Union{Absent,CostCurve,Nothing}`** | Variable operation cost of a device in currency. Wraps a ValueCurve in input-output, incremental, or average-rate form; `power_units` sets the x-axis basis and `vom_cost` adds a proportional O&M term. | [optional]
**`cost_type`** | **`Union{Absent,Nothing,String}`** |  | [optional]
**`discharge_variable_cost`** | **`Union{Absent,CostCurve,Nothing}`** | Variable operation cost of a device in currency. Wraps a ValueCurve in input-output, incremental, or average-rate form; `power_units` sets the x-axis basis and `vom_cost` adds a proportional O&M term. | [optional]
**`energy_shortage_cost`** | **`Union{Absent,Float64,Nothing}`** |  | [optional]
**`energy_surplus_cost`** | **`Union{Absent,Float64,Nothing}`** |  | [optional]
**`fixed`** | **`Float64`** |  | [required]
**`shut_down`** | **`Float64`** |  | [required]
**`start_up`** | **`StorageCostStartUp`** |  | [required]
