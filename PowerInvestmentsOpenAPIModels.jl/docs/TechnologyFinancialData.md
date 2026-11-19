# TechnologyFinancialData

Financial data for a candidate technology: the capital recovery period used to derive overnight capital cost from annualized investment cost, the dollar-year its cost data is reported in, the debt fraction, debt rate, return on equity, and tax rate that together set its cost of capital, and the discount, inflation, and interest rates used to convert its costs to a net present value in the model base year.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`capital_recovery_period`** | **`Int64`** | Period over which capital costs are recovered for net present value calculations. Units: yr. | [required]
**`technology_base_year`** | **`Int64`** | Year the technology's cost data is reported in. Costs are converted from this year to the model base year using the inflation rate. | [required]
**`debt_fraction`** | **`Float64`** | Fraction of capital costs financed through debt. Units: 1. | [required]
**`debt_rate`** | **`Float64`** | Interest rate on debt financing. Units: 1. | [required]
**`return_on_equity`** | **`Float64`** | Required rate of return on equity financing. Units: 1. | [required]
**`tax_rate`** | **`Float64`** | Tax rate applied to equity returns. Units: 1. | [required]
**`discount_rate`** | **`Float64`** | Discount rate used to convert this technology's future costs to a net present value in the model base year. Units: 1. | [required]
**`inflation_rate`** | **`Float64`** | Inflation rate used to convert this technology's costs from its base year to the model base year. Units: 1. | [required]
**`interest_rate`** | **`Float64`** | Interest rate for financing calculations. Units: 1. | [required]
