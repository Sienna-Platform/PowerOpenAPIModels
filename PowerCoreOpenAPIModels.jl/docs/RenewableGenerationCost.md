# RenewableGenerationCost

Cost representation for renewable generation units

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`cost_type`** | **`Union{Absent,Nothing,String}`** |  | [optional]
**`curtailment_cost`** | **`Union{Absent,CostCurve,Nothing}`** | Variable operation cost of a device in currency. Wraps a ValueCurve in input-output, incremental, or average-rate form; `power_units` sets the x-axis basis and `vom_cost` adds a proportional O&M term. | [optional]
**`fixed`** | **`Union{Absent,Float64,Nothing}`** |  | [optional]
**`variable_operation_cost`** | **`CostCurve`** | Variable operation cost of a device in currency. Wraps a ValueCurve in input-output, incremental, or average-rate form; `power_units` sets the x-axis basis and `vom_cost` adds a proportional O&M term. | [required]
