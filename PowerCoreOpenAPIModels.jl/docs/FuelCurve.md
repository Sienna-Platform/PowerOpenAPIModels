# FuelCurve


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`fuel_cost`** | **`Float64`** | Fixed fuel cost per unit of fuel, or null when fuel_cost_time_series names a time-varying one. Exactly one of the two is set; producers and consumers enforce it. | [optional] [default to nothing]
**`fuel_cost_time_series`** | **`Int64`** | Store-minted id of the fuel-cost time series association, or null when fuel_cost carries a fixed value. Exactly one of the two is set. | [optional] [default to nothing]
**`power_units`** | **`String`** | Unit basis a stored value is expressed in. COMPONENT_BASE: per-unit against a base the component records itself. NATURAL_UNITS: the quantity&#39;s own physical unit. No system-wide option: a value per-unitized against a shared base records that base on the component and rides as COMPONENT_BASE. Used in three scopes, each read against its own record rather than a document-wide table: a component&#39;s own &#x60;power_units&#x60; (against that component&#39;s &#x60;base_power&#x60;), a cost payload&#39;s own &#x60;power_units&#x60; (e.g. &#x60;CostCurve&#x60;, against the owning component&#39;s &#x60;base_power&#x60;), and a time series association&#39;s own &#x60;unit_system&#x60; (governing only that one series). | [default to nothing]
**`startup_fuel_offtake`** | [**`*InputOutputCurve`**](InputOutputCurve.md) |  | [optional] [default to nothing]
**`value_curve`** | [**`*ValueCurve`**](ValueCurve.md) |  | [default to nothing]
**`variable_cost_type`** | **`String`** |  | [default to "FUEL"]
**`vom_cost`** | [**`*InputOutputCurve`**](InputOutputCurve.md) |  | [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


