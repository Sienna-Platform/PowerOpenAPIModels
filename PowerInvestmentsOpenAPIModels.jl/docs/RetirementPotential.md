# RetirementPotential

Supplemental attribute defining which existing generators mapped to a supply technology are eligible for retirement, optionally with the year each was built and the year each is already scheduled to retire.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`build_year`** | **`Union{Absent,Nothing,RetirementPotentialBuildYear}`** | Optional dictionary to indicate the year in which existing generators in the base system were built. | [optional]
**`eligible_generators`** | **`Union{Absent,Nothing,Vector{String}}`** | Names of individual generation units mapped to a technology that are eligible for retirement. | [optional]
**`id`** | **`Int64`** | ID for individual component. | [required]
**`planned_retirement_year`** | **`Union{Absent,Nothing,RetirementPotentialPlannedRetirementYear}`** | Optional dictionary to indicate the year in which the forced/planned retirement will occur. | [optional]
