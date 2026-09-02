# BilateralTransaction

A bilaterally negotiated trade reported into the settlement ledger. Settlement-only: it carries no power-balance impact and never clears against a market model. It exists for round-tripping submissions and offline settlement.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`active_power_association_id`** | **`Union{Absent,Union{Int64,Nothing}}`** | Store-minted id of the time series supplying the trade's delivered active-power schedule, or null when `max_active_power` alone describes the trade. | [optional]
**`buyer_id`** | **`String`** | External participant identifier for the buying counterparty, as reported on the transaction. Not a component reference: buyers are not represented in the entity registry. | [required]
**`confirmation`** | **`BilateralTransactionConfirmation`** | Confirmation status the transaction settled under. | [required]
**`from_id`** | **`Int64`** | ID of the source location, resolved through the entity registry: a topology record or a trading hub. | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`market`** | **`BilateralTransactionMarket`** | Market stage the transaction was reported against. | [required]
**`max_active_power`** | **`Float64`** | MW envelope of the transaction. Units: MW. | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`product`** | **`BilateralTransactionProduct`** | Traded product. | [required]
**`seller_id`** | **`String`** | External participant identifier for the selling counterparty, as reported on the transaction. Not a component reference: sellers are not represented in the entity registry. | [required]
**`to_id`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the sink location, resolved through the entity registry: a topology record or a trading hub. `null` for a single-location trade. | [optional]
