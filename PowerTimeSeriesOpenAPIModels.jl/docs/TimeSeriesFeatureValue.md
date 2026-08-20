# TimeSeriesFeatureValue



## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**value** | This is a anyOf model. The value must be any of the following types: Bool, Float64, Int64, String | One feature value. Four kinds, matching the backing store&#39;s feature-value type: int, float, bool, str. &#x60;anyOf&#x60; rather than &#x60;oneOf&#x60; is required, not stylistic: JSON Schema&#39;s &#x60;integer&#x60; is a subset of &#x60;number&#x60;, so an integer instance matches both branches and &#x60;oneOf&#x60; — which demands exactly one match — would reject every integer feature. A float feature is compared and hashed by its bit pattern rather than by IEEE comparison, so 0.0 and -0.0 are two different series; NaN and negative zero are rejected on write because the catalog cannot store either faithfully. | [optional] 





[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


