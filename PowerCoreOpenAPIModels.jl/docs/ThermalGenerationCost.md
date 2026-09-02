# ThermalGenerationCost

Cost representation for thermal generation units

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`cost_type`** | **`Union{Absent,Nothing,String}`** |  | [optional]
**`fixed`** | **`Float64`** | Fixed cost of keeping the unit online. For some cost represenations this field can be duplicative | [required]
**`shut_down`** | **`Float64`** | Cost to turn the unit off | [required]
**`start_up`** | **`ThermalGenerationCostStartUp`** | Start-up cost can take linear or multi-stage cost | [required]
**`variable_operation_cost`** | **`ProductionVariableCostCurve`** | Variable production cost of a device, selected by `variable_cost_type` between a curve denominated directly in currency (`COST`) and one denominated in fuel with a separate fuel price (`FUEL`). | [required]
