# RetrofitPotential

Supplemental attribute defining which existing generators mapped to a supply technology are eligible for retrofit.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | ID for individual component. | [required]
**`eligible_generators`** | **`Vector{String}`** | Names of individual generation units mapped to this technology that can be retrofitted. | [required]
**`retrofit_fraction`** | **`Union{Absent,Float64,Nothing}`** | Fraction of existing capacity that is eligible for retrofits. Units: 1. | [optional]
**`retrofit_cost`** | **`RetrofitPotentialRetrofitCost`** | Cost associated with retrofitting the eligible generators. Units: USD/MW. | [required]
