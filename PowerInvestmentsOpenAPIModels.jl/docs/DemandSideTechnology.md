# DemandSideTechnology

An end-use technology that consumes electricity and can be built, such as a hydrogen electrolyzer, direct air capture, or an industrial heat pump. Its consumption is a decision, valued by what it produces: `technology_efficiency` converts electricity into product and `price_per_unit` prices the product. It carries the capital and operating cost of new capacity together with its capacity limits, minimum consumption, and ramp limits.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | ID for individual component. | [required]
**`name`** | **`String`** | Name of the component. | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). | [required]
**`power_systems_type`** | **`String`** | Corresponding type to be used in PCM modeling. | [required]
**`region`** | **`Union{Absent,Nothing,Vector{Int64}}`** | Location where the component applies. Can be a zone or node. | [optional]
**`capacity_limits`** | **`Union{Absent,MinMax,Nothing}`** | Minimum and maximum allowable installed capacity for a technology. Units: MW. | [optional]
**`unit_size`** | **`Union{Absent,Float64,Nothing}`** | Used for discrete investment decisions. Size of each unit being built. Units: MW. | [optional]
**`capital_costs`** | **`Union{Absent,CapitalCost,Nothing}`** | Capital and interconnection cost for investing in a technology (capital cost in USD/MW). | [optional]
**`operation_costs`** | **`Union{Absent,LoadCost,Nothing}`** | Fixed and variable O&M costs, the variable cost per MWh consumed. Units: USD/MWh. | [optional]
**`min_power`** | **`Union{Absent,Float64,Nothing}`** | Minimum consumption as a fraction of installed capacity. Units: 1. | [optional]
**`ramp_limits`** | **`Union{Absent,UpDown,Nothing}`** | Maximum decrease and increase in consumption between operation periods. Units: MW/min. | [optional]
**`technology_efficiency`** | **`Union{Absent,Float64,Nothing}`** | Electricity consumed per unit of product. Ex: MWh per tonne of hydrogen for electrolyzers. Units: 1. | [optional]
**`price_per_unit`** | **`Union{Absent,DemandSideTechnologyPricePerUnit,Nothing}`** | Price or value per unit of product. Ex: USD per tonne of hydrogen for electrolyzers. Units: USD/t. | [optional]
**`lifetime`** | **`Union{Absent,Int64,Nothing}`** | Maximum number of years a technology can be active once installed. Units: yr. | [optional]
**`financial_data`** | **`TechnologyFinancialData`** | Struct containing relevant financial information for a technology. | [required]
