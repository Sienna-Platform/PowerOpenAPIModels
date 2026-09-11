# HydroGenerationCost

Cost representation for hydro gen units

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`cost_type`** | **`Union{Absent,Nothing,String}`** |  | [optional]
**`fixed`** | **`Union{Absent,Float64,Nothing}`** |  | [optional]
**`variable_operation_cost`** | **`ProductionVariableCostCurve`** | Variable production cost of a device, selected by `variable_cost_type` between a curve denominated directly in currency (`COST`) and one denominated in fuel with a separate fuel price (`FUEL`). | [required]
