# RetrofitPotential


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | ID for individual component. | [default to nothing]
**`eligible_generators`** | **`Vector{String}`** | Names of individual generation units mapped to this technology that can be retrofitted. | [default to nothing]
**`retrofit_fraction`** | **`Float64`** | Fraction of existing capacity that is eligible for retrofits. Units: 1. | [optional] [default to 1.0]
**`retrofit_cost`** | [**`*ValueCurve`**](ValueCurve.md) |  | [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


