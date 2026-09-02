# NodalACTransportTechnology

Nodal representation of candidate AC transmission lines between two regions. Alongside capacity limits and a capital cost curve it carries the electrical characteristics of the line — resistance, series reactance, and voltage rating — and is added in discrete units of `unit_size`.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). | [required]
**`capacity_limits`** | **`Union{Absent,NodalACTransportTechnologyCapacityLimits,Nothing}`** | Allowable capacity for a transmission line. Units: MW. | [optional]
**`capital_costs`** | **`Union{Absent,NodalACTransportTechnologyCapitalCosts,Nothing}`** | Cost of adding new capacity to the nodal transmission line. Units: USD/MW. | [optional]
**`end_node`** | **`Int64`** | End node for transport technology. | [required]
**`financial_data`** | **`NodalACTransportTechnologyFinancialData`** | Struct containing relevant financial information for a technology. | [required]
**`id`** | **`Int64`** | ID for individual component. | [required]
**`name`** | **`String`** | Name of the component. | [required]
**`power_systems_type`** | **`String`** | Corresponding type to be used in PCM modeling. | [required]
**`reactance`** | **`Union{Absent,Float64,Nothing}`** | Series reactance for a line. Units: ohm. | [optional]
**`requirements`** | **`Union{Absent,Nothing,Vector{Int64}}`** | List of requirement IDs associated with the component. | [optional]
**`resistance`** | **`Union{Absent,Float64,Nothing}`** | Technology resistance in Ohms. Units: ohm. | [optional]
**`start_node`** | **`Int64`** | Start node for transport technology. | [required]
**`unit_size`** | **`Union{Absent,Float64,Nothing}`** | Used for integer investment decisions. Represents the rating capacity of individual new lines. Units: MW. | [optional]
**`voltage`** | **`Union{Absent,Float64,Nothing}`** | Voltage rating of transmission line. Units: kV. | [optional]
