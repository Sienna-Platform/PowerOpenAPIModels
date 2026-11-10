# RetrofitPotential

Supplemental attribute linking a retrofit: existing generators of a source supply technology that can be converted into a retrofit option supply technology. The same attribute is attached to both the source and the option, one attribute per source and option pair.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | ID for individual component. | [required]
**`eligible_generators`** | **`Vector{String}`** | Names of the existing generation units of the source technology that can be retrofitted into the option technology. | [required]
**`retrofit_efficiency`** | **`Union{Absent,Float64,Nothing}`** | Capacity of the option technology obtained per unit of source capacity retrofitted, e.g. below 1 when a retrofit derates the plant. Units: 1. | [optional]
**`retrofit_cost`** | **`Union{Absent,Nothing,RetrofitPotentialRetrofitCost}`** | Cost associated with retrofitting the eligible generators. Units: USD/MW. | [optional]
