# ProjectedDemand

A projected demand in a region: an exogenous load profile that must be served, with optional voluntary curtailment and time shifting. A demand with existing loads in the base system takes its peak from them and grows from the base year; a new demand starts in its construction year at `peak_demand_mw`. Conforming demands grow by `growth_rate`. Curtailment up to `max_demand_curtailment` is priced by `curtailment_cost`, and the rest of the demand by `value_of_lost_load`.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | ID for individual component. | [required]
**`name`** | **`String`** | Name of the component. | [required]
**`available`** | **`Union{Absent,Bool,Nothing}`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). | [optional]
**`power_systems_type`** | **`String`** | Corresponding type to be used in PCM modeling. | [required]
**`region`** | **`Union{Absent,Nothing,Vector{Int64}}`** | Location where the component applies. Can be a zone or node. | [optional]
**`peak_demand_mw`** | **`Union{Absent,Float64,Nothing}`** | Peak demand. Demands with existing loads in the base system derive their peak demand from those loads, not from this value. Units: MW. | [optional]
**`construction_year`** | **`Union{Absent,Int64,Nothing}`** | The year in which a new demand starts. Should only be used for new demands. | [optional]
**`growth_rate`** | **`Union{Absent,Float64,Nothing}`** | The annual growth rate of the demand, used to scale present-day loads into future projections. Only used for conforming demands. Units: 1. | [optional]
**`conformity`** | **`Union{Absent,Nothing,String}`** | Whether the demand is conforming (grows by `growth_rate`) or non-conforming (does not grow). Must be set for new demands. | [optional]
**`max_demand_curtailment`** | **`Union{Absent,Float64,Nothing}`** | Maximum fraction of demand that can be curtailed voluntarily. Units: 1. | [optional]
**`curtailment_cost`** | **`Union{Absent,Nothing,ProjectedDemandCurtailmentCost}`** | Cost of voluntary curtailment. A linear curve is a single price for all curtailable demand; a piecewise incremental curve gives tiers whose x coordinates are fractions of demand, from 0 to `max_demand_curtailment`, and whose slopes are prices. Units: USD/MWh. | [optional]
**`value_of_lost_load`** | **`Union{Absent,Float64,Nothing}`** | Cost of involuntary shedding of the demand that cannot be curtailed. Units: USD/MWh. | [optional]
**`flexible_fraction`** | **`Union{Absent,Float64,Nothing}`** | Fraction of demand that can be shifted in time. Units: 1. | [optional]
**`max_demand_delay`** | **`Union{Absent,Float64,Nothing}`** | Maximum time that flexible demand can be delayed. Units: min. | [optional]
**`max_demand_advance`** | **`Union{Absent,Float64,Nothing}`** | Maximum time that flexible demand can be served in advance. Units: min. | [optional]
**`shift_efficiency`** | **`Union{Absent,Float64,Nothing}`** | Fraction of shifted energy that is kept. Represents energy losses due to time shifting. Units: 1. | [optional]
**`shift_cost`** | **`Union{Absent,Nothing,ProjectedDemandShiftCost}`** | Cost of shifting demand, per MWh shifted. Units: USD/MWh. | [optional]
