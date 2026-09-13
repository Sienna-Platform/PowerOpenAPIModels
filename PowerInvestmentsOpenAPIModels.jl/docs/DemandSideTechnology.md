# DemandSideTechnology

Demand-side technology such as an electric vehicle fleet or a hydrogen electrolyzer. Its flexibility is described by how far demand may be delayed or advanced, how much of it may be curtailed, and the cost and energy losses of doing either.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | ID for individual component. | [required]
**`name`** | **`String`** | Name of the component. | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). | [required]
**`region`** | **`Union{Absent,Nothing,Vector{Int64}}`** | Location where the component applies. Can be a zone or node. | [optional]
**`power_systems_type`** | **`String`** | Corresponding type to be used in PCM modeling. | [required]
**`technology_efficiency`** | **`Union{Absent,Float64,Nothing}`** | MWh of electricity per unit of output. Ex: MWh per ton of hydrogen for electrolyzers. Units: 1. | [optional]
**`price_per_unit`** | **`Union{Absent,DemandSideTechnologyPricePerUnit,Nothing}`** | Price or value per unit of output. Ex: USD per ton of hydrogen for electrolyzers. Units: USD/t. | [optional]
**`min_power`** | **`Union{Absent,Float64,Nothing}`** | Minimum operation of demandside unit as a fraction of peak demand. Units: 1. | [optional]
**`peak_demand_mw`** | **`Union{Absent,Float64,Nothing}`** | Peak demand value in MW. Units: MW. | [optional]
**`max_demand_delay`** | **`Union{Absent,Float64,Nothing}`** | Maximum number of minutes that demand can be deferred or delayed (minutes). Units: min. | [optional]
**`max_demand_advance`** | **`Union{Absent,Float64,Nothing}`** | Maximum number of minutes that demand can be scheduled in advance of the original schedule (minutes). Units: min. | [optional]
**`demand_energy_efficiency`** | **`Union{Absent,Float64,Nothing}`** | Energy efficiency associated with time shifting demand. Represents energy losses due to time shifting. Units: 1. | [optional]
**`shift_variable_cost`** | **`Union{Absent,DemandSideTechnologyShiftVariableCost,Nothing}`** | Variable operation and maintenance costs associated with flexible demand deferral/advancement. Units: USD/MWh. | [optional]
**`curtailment_cost`** | **`Union{Absent,DemandSideTechnologyCurtailmentCost,Nothing}`** | Energy cost of curtailed demand, USD per MWh. Units: USD/MWh. | [optional]
**`max_demand_curtailment`** | **`Union{Absent,Float64,Nothing}`** | Maximum fraction of demand that can be curtailed. Units: 1. | [optional]
