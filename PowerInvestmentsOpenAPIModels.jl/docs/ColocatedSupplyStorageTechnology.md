# ColocatedSupplyStorageTechnology


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | ID for individual component. | [default to nothing]
**`name`** | **`String`** | Name of the component. | [default to nothing]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (&#x60;true&#x60;) or disconnected, offline, or down (&#x60;false&#x60;). | [optional] [default to nothing]
**`power_systems_type`** | **`String`** | Corresponding type to be used in PCM modeling. | [default to nothing]
**`region`** | **`Vector{Int64}`** | Location where the component applies. Can be a zone or node. | [optional] [default to nothing]
**`financial_data`** | [**`*TechnologyFinancialData`**](TechnologyFinancialData.md) |  | [default to nothing]
**`supply_technology`** | **`Int64`** | The ID of the underlying supply technology (e.g., wind or solar) co-located with storage. | [default to nothing]
**`storage_technology`** | **`Int64`** | The ID of the underlying storage technology co-located with the supply technology. | [default to nothing]
**`inverter_capacity_limits`** | [**`*MinMax`**](MinMax.md) |  | [optional] [default to nothing]
**`capital_costs_inverter`** | [**`*CapitalCost`**](CapitalCost.md) |  | [default to nothing]
**`operation_costs_inverter`** | [**`*ProductionVariableCostCurve`**](ProductionVariableCostCurve.md) |  | [default to nothing]
**`inverter_efficiency`** | **`Float64`** | Efficiency of AC to DC conversion of inverter. Units: 1. | [default to nothing]
**`inverter_supply_ratio`** | **`Float64`** | Ratio of generation capacity to grid connection capacity. Units: 1. | [default to nothing]
**`requirements`** | **`Vector{Int64}`** | List of requirement IDs associated with the component. | [optional] [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


