# BilateralTransaction


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., &#x60;PowerLoad&#x60;) must have unique names, but components of different types (e.g., &#x60;PowerLoad&#x60; and &#x60;ACBus&#x60;) can have the same name. | [default to nothing]
**`seller_id`** | **`String`** | External participant identifier for the selling counterparty, as reported on the transaction. Not a component reference: sellers are not represented in the entity registry. | [default to nothing]
**`buyer_id`** | **`String`** | External participant identifier for the buying counterparty, as reported on the transaction. Not a component reference: buyers are not represented in the entity registry. | [default to nothing]
**`from_id`** | **`Int64`** | ID of the source location, resolved through the entity registry: a topology record or a trading hub. | [default to nothing]
**`to_id`** | **`Int64`** | ID of the sink location, resolved through the entity registry: a topology record or a trading hub. &#x60;null&#x60; for a single-location trade. | [optional] [default to nothing]
**`product`** | **`String`** | Traded product. | [default to nothing]
**`market`** | **`String`** | Market stage the transaction was reported against. | [default to nothing]
**`confirmation`** | **`String`** | Confirmation status the transaction settled under. | [default to nothing]
**`max_active_power`** | **`Float64`** | MW envelope of the transaction. Units: MW. | [default to nothing]
**`active_power_association_id`** | **`Int64`** | Store-minted id of the time series supplying the trade&#39;s delivered active-power schedule, or null when &#x60;max_active_power&#x60; alone describes the trade. | [optional] [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


