# EmissionsData

Supplemental attribute describing the emission of a single pollutant from a host component. Combines pollutant identity (CO2, NOx, etc.) with an emission rate expressed as a ValueCurve (supporting constant, linear, or piecewise relationships between fuel consumption / power output and emissions). One EmissionsData instance can be attached to one or many components.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`available`** | **`Union{Absent,Bool,Nothing}`** | Whether this attribute is active | [optional]
**`basis`** | **`EmissionsDataBasis`** | FUEL_INPUT (mass per unit of heat input) or POWER_OUTPUT (mass per unit of electrical output) | [required]
**`emission_rate`** | **`EmissionsDataEmissionRate`** | Emission rate as a ValueCurve, typically an IncrementalCurve with LinearFunctionData (constant or linearly varying rate) or PiecewiseStepData (piecewise step rates). Rates must be non-negative and finite. | [required]
**`energy_unit`** | **`EmissionsDataEnergyUnit`** | Energy unit for the rate denominator. Must be MMBTU or GJ when basis is FUEL_INPUT, and MWH when basis is POWER_OUTPUT. | [required]
**`gwp`** | **`Union{Absent,Float64,Nothing}`** | GWP100 multiplier for CO2-equivalent reporting. Must be finite and non-negative. Units: 1. | [optional]
**`id`** | **`Int64`** |  | [required]
**`mass_unit`** | **`Union{Absent,EmissionsDataMassUnit,Nothing}`** | Mass unit of the emission rate numerator | [optional]
**`name`** | **`String`** | Identifier for this emissions attribute | [required]
**`pollutant`** | **`EmissionsDataPollutant`** | Pollutant identity (CO2, CO2E, CH4, N2O, NOX, SO2, PM25, PM10, HG, HAP, CUSTOM) | [required]
**`start_up_adder`** | **`Union{Absent,Float64,Nothing}`** | Per-start emission pulse, in mass_unit. Must be finite and non-negative. Units: per mass_unit — KG: kg, LB: lb, SHORT_TON: ston, METRIC_TON: t . | [optional]
