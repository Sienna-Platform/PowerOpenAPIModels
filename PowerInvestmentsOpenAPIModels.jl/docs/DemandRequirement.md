# DemandRequirement

Demand requirements for a region. New demand enters at a stated peak in its construction year and scales forward by a growth rate; `value_of_lost_load` and `unserved_demand_curve` price whatever portion goes unserved.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`available`** | **`Union{Absent,Bool,Nothing}`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). | [optional]
**`conformity`** | **`Union{Absent,Nothing,String}`** | Indicator of how the demand requirement should conform to the load profile of existing technologies in the system. Should only be used for new demand requirements. | [optional]
**`growth_rate`** | **`Union{Absent,Float64,Nothing}`** | The annual growth rate of the demand requirement, used to scale present-day loads into future projections. Should only be used for conforming loads. Units: 1. | [optional]
**`id`** | **`Int64`** | ID for individual component. | [required]
**`name`** | **`String`** | Name of the component. | [required]
**`new_construction_year`** | **`Union{Absent,Int64,Nothing}`** | The year in which the new demand requirement will be installed. Should only be used for new demand requirements. | [optional]
**`new_demand_mw`** | **`Union{Absent,Float64,Nothing}`** | The value of the peak demand to be used for new DemandRequirements. Units: MW. | [optional]
**`power_systems_type`** | **`String`** | Corresponding type to be used in PCM modeling. | [required]
**`region`** | **`Union{Absent,Nothing,Vector{Int64}}`** | Location where the component applies. Can be a zone or node. | [optional]
**`requirements`** | **`Union{Absent,Nothing,Vector{Int64}}`** | List of requirement IDs associated with the component. | [optional]
**`unserved_demand_curve`** | **`Union{Absent,DemandRequirementUnservedDemandCurve,Nothing}`** | Piecewise curve to scale the cost of unserved load based on the value of lost load. Units: USD/MWh. | [optional]
**`value_of_lost_load`** | **`Float64`** | Value of unserved load. Units: USD/MWh. | [required]
