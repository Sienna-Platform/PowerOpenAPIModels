# AggregateRetrofitPotential

Supplemental attribute defining a total amount of a supply technology's capacity that can be retrofit, given either as an absolute quantity or as a fraction of existing capacity. `retrofit_id` groups retrofittable source technologies with the retrofit options available to them inside the same zone.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | ID for individual component. | [required]
**`retrofit_fraction`** | **`Union{Absent,Float64,Nothing}`** | Fraction of existing capacity that is eligible for retrofits. Alternative to retrofit_potential. Units: 1. | [optional]
**`retrofit_id`** | **`Union{Absent,Int64,Nothing}`** | Unique identifier to group retrofittable source technologies with retrofit options inside the same zone. | [optional]
**`retrofit_potential`** | **`Union{Absent,Float64,Nothing}`** | Amount of existing capacity for technology that can be retrofitted. Units: MW. | [optional]
