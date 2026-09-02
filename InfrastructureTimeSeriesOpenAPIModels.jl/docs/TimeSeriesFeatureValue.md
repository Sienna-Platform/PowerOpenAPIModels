# TimeSeriesFeatureValue

One feature value. Four kinds, matching the backing store's feature-value type: int, float, bool, str. `anyOf` rather than `oneOf` is required, not stylistic: JSON Schema's `integer` is a subset of `number`, so an integer instance matches both branches and `oneOf` — which demands exactly one match — would reject every integer feature. A float feature is compared and hashed by its bit pattern rather than by IEEE comparison, so 0.0 and -0.0 are two different series; NaN and negative zero are rejected on write because the catalog cannot store either faithfully.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`value`** | **`Union{Bool,Float64,Int64,String}`** |  | [required]
