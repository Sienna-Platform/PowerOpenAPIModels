# CarbonTax

Policy requirement defining an additional cost penalty per ton of CO2 produced in the eligible regions during the target year.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). | [required]
**`id`** | **`Int64`** | ID for individual component. | [required]
**`name`** | **`String`** | Name of the component. | [required]
**`target_year`** | **`Union{Absent,Int64,Nothing}`** | Year in which this requirement is applied. | [optional]
**`tax_dollars_per_ton`** | **`Union{Absent,Float64,Nothing}`** | Cost penalty per ton of CO2 emitted by technologies in the eligible regions during the target year. Units: USD/t. | [optional]
