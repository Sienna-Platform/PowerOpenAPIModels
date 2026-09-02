# AggregateTransportTechnology

An aggregated representation of a transmission interchange between two regions. Capacity is added in discrete units of `unit_size`, priced by a capital cost curve, and derated by a proportional line loss.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). | [required]
**`capacity_limits`** | **`Union{Absent,AggregateTransportTechnologyCapacityLimits,Nothing}`** | Allowable capacity for a transmission line. Units: MW. | [optional]
**`capital_costs`** | **`Union{Absent,AggregateTransportTechnologyCapitalCosts,Nothing}`** | Cost of adding new capacity to the nodal transmission line. Units: USD/MW. | [optional]
**`end_region`** | **`Int64`** | End region for transport technology. | [required]
**`financial_data`** | **`AggregateTransportTechnologyFinancialData`** | Struct containing relevant financial information for a technology. | [required]
**`id`** | **`Int64`** | ID for individual component. | [required]
**`line_loss`** | **`Union{Absent,Float64,Nothing}`** | Transmission loss for each transport technology. Units: 1. | [optional]
**`name`** | **`String`** | Name of the component. | [required]
**`power_systems_type`** | **`String`** | Corresponding type to be used in PCM modeling. | [required]
**`requirements`** | **`Union{Absent,Nothing,Vector{Int64}}`** | List of requirement IDs associated with the component. | [optional]
**`start_region`** | **`Int64`** | Start region for transport technology. | [required]
**`unit_size`** | **`Union{Absent,Float64,Nothing}`** | Used for integer investment decisions. Represents the rating capacity of individual new lines. Units: MW. | [optional]
