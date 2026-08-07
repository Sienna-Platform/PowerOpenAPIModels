# FuelCurve


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`fuel_cost`** | [**`*FuelCurveFuelCost`**](FuelCurveFuelCost.md) |  | [default to nothing]
**`power_units`** | **`String`** | Unit basis curve power values are stored in. DEVICE_BASE: per-unit on the component&#39;s own base_power. NATURAL_UNITS: MW/MVA. There is no system-base option: per-unit data historically on the system base records that base in the component&#39;s base_power and rides as DEVICE_BASE. | [default to nothing]
**`startup_fuel_offtake`** | [**`*InputOutputCurve`**](InputOutputCurve.md) |  | [optional] [default to nothing]
**`value_curve`** | [**`*ValueCurve`**](ValueCurve.md) |  | [default to nothing]
**`variable_cost_type`** | **`String`** |  | [default to "FUEL"]
**`vom_cost`** | [**`*InputOutputCurve`**](InputOutputCurve.md) |  | [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


