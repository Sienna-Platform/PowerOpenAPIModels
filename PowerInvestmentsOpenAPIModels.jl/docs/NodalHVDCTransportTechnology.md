# NodalHVDCTransportTechnology

Nodal representation of candidate HVDC transmission lines between two regions, added in discrete units of unit_size. Characterized by capacity limits, a capital cost curve, and a loss model as a fraction of installed capacity.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). | [required]
**`capacity_limits`** | **`Union{Absent,MinMax,Nothing}`** | Allowable capacity for a transmission line. Units: MW. | [optional]
**`capital_costs`** | **`Union{Absent,CapitalCost,Nothing}`** | Capital and interconnection cost of adding new capacity to the nodal transmission line (capital cost in USD/MW). | [optional]
**`end_node`** | **`Int64`** | End node for transport technology. | [required]
**`financial_data`** | **`TechnologyFinancialData`** | Struct containing relevant financial information for a technology. | [required]
**`id`** | **`Int64`** | ID for individual component. | [required]
**`line_loss`** | **`Union{Absent,NodalHVDCTransportTechnologyLineLoss,Nothing}`** | Loss model coefficients: a linear model with constant loss and proportional rate, or a piecewise loss with N segments. Fraction of installed capacity. Units: 1. | [optional]
**`name`** | **`String`** | Name of the component. | [required]
**`power_systems_type`** | **`String`** | Corresponding type to be used in PCM modeling. | [required]
**`requirements`** | **`Union{Absent,Nothing,Vector{Int64}}`** | List of requirement IDs associated with the component. | [optional]
**`start_node`** | **`Int64`** | Start node for transport technology. | [required]
**`unit_size`** | **`Union{Absent,Float64,Nothing}`** | Used for integer investment decisions. Represents the rating capacity of individual new lines. Units: MW. | [optional]
