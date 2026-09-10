# ImportExportTimeSeriesCost

Cost representation for time-varying imports and exports with neighboring areas. The static counterpart is ImportExportCost.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`ancillary_service_offers`** | **`Vector{Int64}`** |  | [required]
**`cost_type`** | **`String`** |  | [required]
**`energy_export_weekly_limit`** | **`Float64`** | Weekly limit on exported energy, in MWh. MWh is the only representation: neither producers nor consumers rescale it by a system base. Units: MWh. | [required]
**`energy_import_weekly_limit`** | **`Float64`** | Weekly limit on imported energy, in MWh. MWh is the only representation: neither producers nor consumers rescale it by a system base. Units: MWh. | [required]
**`export_offer_curves`** | **`CostCurve`** | Export price curves whose value curve admits only the TIME_SERIES_INCREMENTAL variant; any other variant is rejected by the consuming constructor. | [required]
**`import_offer_curves`** | **`CostCurve`** | Import price curves whose value curve admits only the TIME_SERIES_INCREMENTAL variant; any other variant is rejected by the consuming constructor. | [required]
