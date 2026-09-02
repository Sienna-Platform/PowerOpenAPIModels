# RetrofitPotential

Supplemental attribute defining which existing generators mapped to a supply technology are eligible for retrofit.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`eligible_generators`** | **`Union{Absent,Nothing,Vector{String}}`** | Names of individual generation units mapped to this technology that can be retrofitted. | [optional]
**`id`** | **`Int64`** | ID for individual component. | [required]
