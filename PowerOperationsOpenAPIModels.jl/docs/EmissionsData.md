# EmissionsData


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** |  | [default to nothing]
**`name`** | **`String`** | Identifier for this emissions attribute | [default to nothing]
**`pollutant`** | **`String`** | Pollutant identity (CO2, CO2E, CH4, N2O, NOX, SO2, PM25, PM10, HG, HAP, CUSTOM) | [default to nothing]
**`emission_rate`** | [**`*ValueCurve`**](ValueCurve.md) |  | [default to nothing]
**`basis`** | **`String`** | FUEL_INPUT (mass per unit of heat input) or POWER_OUTPUT (mass per unit of electrical output) | [default to nothing]
**`start_up_adder`** | **`Float64`** | Per-start emission pulse, in mass_unit. Must be finite and non-negative. Units: per mass_unit — KG: kg, LB: lb, SHORT_TON: ston, METRIC_TON: t . | [optional] [default to 0.0]
**`mass_unit`** | **`String`** | Mass unit of the emission rate numerator | [optional] [default to "KG"]
**`energy_unit`** | **`String`** | Energy unit for the rate denominator. Must be MMBTU or GJ when basis is FUEL_INPUT, and MWH when basis is POWER_OUTPUT. | [default to nothing]
**`gwp`** | **`Float64`** | GWP100 multiplier for CO2-equivalent reporting. Must be finite and non-negative. Units: 1. | [optional] [default to 1.0]
**`available`** | **`Bool`** | Whether this attribute is active | [optional] [default to true]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


