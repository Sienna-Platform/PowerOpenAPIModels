# ImportExportCost


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`cost_type`** | **`String`** |  | [optional] [default to "IMPORTEXPORT"]
**`import_offer_curves`** | [**`*CostCurve`**](CostCurve.md) |  | [optional] [default to nothing]
**`export_offer_curves`** | [**`*CostCurve`**](CostCurve.md) |  | [optional] [default to nothing]
**`energy_import_weekly_limit`** | **`Float64`** | Weekly limit on imported energy, in MWh. MWh is the only representation: neither producers nor consumers rescale it by a system base. | [default to nothing]
**`energy_export_weekly_limit`** | **`Float64`** | Weekly limit on exported energy, in MWh. MWh is the only representation: neither producers nor consumers rescale it by a system base. | [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


