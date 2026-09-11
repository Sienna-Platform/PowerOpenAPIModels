# ImportExportCost

Cost representation for static (non-time-varying) imports and exports with neighboring areas, together with the ancillary services offered alongside them. The offer curves are piecewise incremental cost curves with an implied zero cost at zero power, and a weekly energy limit bounds each direction. The time-varying counterpart is `ImportExportTimeSeriesCost`.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`cost_type`** | **`Union{Absent,Nothing,String}`** |  | [optional]
**`energy_export_weekly_limit`** | **`Float64`** | Weekly limit on exported energy, in MWh. MWh is the only representation: neither producers nor consumers rescale it by a system base. Units: MWh. | [required]
**`energy_import_weekly_limit`** | **`Float64`** | Weekly limit on imported energy, in MWh. MWh is the only representation: neither producers nor consumers rescale it by a system base. Units: MWh. | [required]
**`export_offer_curves`** | **`Union{Absent,CostCurve,Nothing}`** | Variable operation cost of a device expressed directly in currency. Wraps a `ValueCurve` that may be in input-output, incremental, or average-rate form, with `power_units` declaring the basis of the x axis and `vom_cost` adding a proportional variable operation and maintenance term. | [optional]
**`import_offer_curves`** | **`Union{Absent,CostCurve,Nothing}`** | Variable operation cost of a device expressed directly in currency. Wraps a `ValueCurve` that may be in input-output, incremental, or average-rate form, with `power_units` declaring the basis of the x axis and `vom_cost` adding a proportional variable operation and maintenance term. | [optional]
