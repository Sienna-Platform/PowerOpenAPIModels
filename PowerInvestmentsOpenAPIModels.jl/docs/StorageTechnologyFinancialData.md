# StorageTechnologyFinancialData

Struct containing relevant financial information for a technology.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`capital_recovery_period`** | **`Int64`** | Period over which capital costs are recovered for net present value calculations. Units: yr. | [required]
**`debt_fraction`** | **`Float64`** | Fraction of capital costs financed through debt. Units: 1. | [required]
**`debt_rate`** | **`Float64`** | Interest rate on debt financing. Units: 1. | [required]
**`return_on_equity`** | **`Float64`** | Required rate of return on equity financing. Units: 1. | [required]
**`tax_rate`** | **`Float64`** | Tax rate applied to equity returns. Units: 1. | [required]
**`technology_base_year`** | **`Int64`** | Base year for technology cost data used in NPV calculations. | [required]
