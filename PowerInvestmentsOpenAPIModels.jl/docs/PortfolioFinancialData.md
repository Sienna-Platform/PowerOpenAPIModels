# PortfolioFinancialData

Financial data for the portfolio as a whole: the base economic year that all costs are converted to a net present value in, and the discount, inflation, and interest rates used in that conversion.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`base_year`** | **`Int64`** | Base economic year. All costs will be converted to a net present value in this year. | [required]
**`discount_rate`** | **`Float64`** | Discount rate for financial calculations. Units: 1. | [required]
**`id`** | **`Int64`** | ID for individual component. | [required]
**`inflation_rate`** | **`Float64`** | Inflation rate for cost adjustments. Units: 1. | [required]
**`interest_rate`** | **`Float64`** | Interest rate for financing calculations. Units: 1. | [required]
