# NodalHVDCTransportTechnology

A nodal representation of candidate HVDC transmission lines between two regions, added in discrete units of `unit_size` and characterized by capacity limits, a capital cost curve, and a loss model expressed as a fraction of installed nameplate capacity.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). | [required]
**`capacity_limits`** | **`Union{Absent,NodalHVDCTransportTechnologyCapacityLimits,Nothing}`** | Allowable capacity for a transmission line. Units: MW. | [optional]
**`capital_costs`** | **`Union{Absent,NodalHVDCTransportTechnologyCapitalCosts,Nothing}`** | Cost of adding new capacity to the nodal transmission line. Units: USD/MW. | [optional]
**`end_node`** | **`Int64`** | End node for transport technology. | [required]
**`financial_data`** | **`NodalHVDCTransportTechnologyFinancialData`** | Struct containing relevant financial information for a technology. | [required]
**`id`** | **`Int64`** | ID for individual component. | [required]
**`line_loss`** | **`Union{Absent,NodalHVDCTransportTechnologyLineLoss,Nothing}`** | Loss model coefficients. Accepts a linear model with a constant loss and a proportional loss rate, or a Piecewise loss with N segments for different proportional losses. All terms are defined as fraction of installed nameplate capacity. Units: 1. | [optional]
**`name`** | **`String`** | Name of the component. | [required]
**`power_systems_type`** | **`String`** | Corresponding type to be used in PCM modeling. | [required]
**`requirements`** | **`Union{Absent,Nothing,Vector{Int64}}`** | List of requirement IDs associated with the component. | [optional]
**`start_node`** | **`Int64`** | Start node for transport technology. | [required]
**`unit_size`** | **`Union{Absent,Float64,Nothing}`** | Used for integer investment decisions. Represents the rating capacity of individual new lines. Units: MW. | [optional]
