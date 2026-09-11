# ColocatedSupplyStorageTechnology

Supply technology co-located with storage behind a shared grid connection. Generation and storage are referenced by id; the coupling inverter carries its own capacity limits, capital and operating costs, and efficiency.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`available`** | **`Union{Absent,Bool,Nothing}`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). | [optional]
**`capital_costs_inverter`** | **`CapitalCost`** | Capital and interconnection cost for investing in inverter capacity (capital cost in USD/MW). | [required]
**`financial_data`** | **`TechnologyFinancialData`** | Struct containing relevant financial information for a technology. | [required]
**`id`** | **`Int64`** | ID for individual component. | [required]
**`inverter_capacity_limits`** | **`Union{Absent,MinMax,Nothing}`** | Limits on inverter capacity. Units: MW. | [optional]
**`inverter_efficiency`** | **`Float64`** | Efficiency of AC to DC conversion of inverter. Units: 1. | [required]
**`inverter_supply_ratio`** | **`Float64`** | Ratio of generation capacity to grid connection capacity. Units: 1. | [required]
**`name`** | **`String`** | Name of the component. | [required]
**`operation_costs_inverter`** | **`ColocatedSupplyStorageTechnologyOperationCostsInverter`** | Operational costs for using inverter in co-located systems. Units: USD/MWh. | [required]
**`power_systems_type`** | **`String`** | Corresponding type to be used in PCM modeling. | [required]
**`region`** | **`Union{Absent,Nothing,Vector{Int64}}`** | Location where the component applies. Can be a zone or node. | [optional]
**`requirements`** | **`Union{Absent,Nothing,Vector{Int64}}`** | List of requirement IDs associated with the component. | [optional]
**`storage_technology`** | **`Int64`** | The ID of the underlying storage technology co-located with the supply technology. | [required]
**`supply_technology`** | **`Int64`** | The ID of the underlying supply technology (e.g., wind or solar) co-located with storage. | [required]
