# ImportExportTimeSeriesCost


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`cost_type`** | **`String`** |  | [default to "IMPORT_EXPORT_TIME_SERIES"]
**`import_offer_curves`** | [**`*CostCurve`**](CostCurve.md) |  | [default to nothing]
**`export_offer_curves`** | [**`*CostCurve`**](CostCurve.md) |  | [default to nothing]
**`energy_import_weekly_limit`** | **`Float64`** | Weekly limit on imported energy. Producers converting from a per-unit representation rescale by their system base before writing. Units: MWh. | [default to nothing]
**`energy_export_weekly_limit`** | **`Float64`** | Weekly limit on exported energy. Producers converting from a per-unit representation rescale by their system base before writing. Units: MWh. | [default to nothing]
**`ancillary_service_offers`** | **`Vector{Int64}`** |  | [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


