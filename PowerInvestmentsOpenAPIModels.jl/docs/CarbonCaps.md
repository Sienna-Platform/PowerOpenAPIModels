# CarbonCaps

Policy requirement limiting the amount of carbon produced in the target year. The limit can be given either as a total mass of CO2 or as the carbon intensity of the portfolio, in mass of CO2 per MWh of electricity.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). | [required]
**`id`** | **`Int64`** | ID for individual component. | [required]
**`max_mtons`** | **`Union{Absent,Float64,Nothing}`** | Emission limit in absolute values (million tonnes). Units: Mt. | [optional]
**`max_tons_mwh`** | **`Union{Absent,Float64,Nothing}`** | Emission limit in terms of rate. Units: Mt/MWh. | [optional]
**`name`** | **`String`** | Name of the component. | [required]
**`target_year`** | **`Union{Absent,Int64,Nothing}`** | Year in which this requirement is applied. | [optional]
