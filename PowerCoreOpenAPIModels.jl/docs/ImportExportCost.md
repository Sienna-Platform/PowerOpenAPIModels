# ImportExportCost

Cost for static imports/exports with neighboring areas, plus any ancillary services offered alongside them. Offer curves are piecewise incremental with an implied zero cost at zero power; a weekly energy limit bounds each direction.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`cost_type`** | **`Union{Absent,Nothing,String}`** |  | [optional]
**`energy_export_weekly_limit`** | **`Float64`** | Weekly limit on exported energy, in MWh. MWh is the only representation: neither producers nor consumers rescale it by a system base. Units: MWh. | [required]
**`energy_import_weekly_limit`** | **`Float64`** | Weekly limit on imported energy, in MWh. MWh is the only representation: neither producers nor consumers rescale it by a system base. Units: MWh. | [required]
**`export_offer_curves`** | **`Union{Absent,CostCurve,Nothing}`** | Variable operation cost of a device in currency. Wraps a ValueCurve in input-output, incremental, or average-rate form; `power_units` sets the x-axis basis and `vom_cost` adds a proportional O&M term. | [optional]
**`import_offer_curves`** | **`Union{Absent,CostCurve,Nothing}`** | Variable operation cost of a device in currency. Wraps a ValueCurve in input-output, incremental, or average-rate form; `power_units` sets the x-axis basis and `vom_cost` adds a proportional O&M term. | [optional]
