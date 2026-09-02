# AggregateRetirementPotential

Supplemental attribute defining a total amount of a technology's existing capacity that can be retired, as a quantity rather than a list of named units.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | ID for individual component. | [required]
**`retirement_potential`** | **`Union{Absent,Float64,Nothing}`** | Amount of pre-existing capacity for a technology that is eligible for retirement. Units: MW. | [optional]
