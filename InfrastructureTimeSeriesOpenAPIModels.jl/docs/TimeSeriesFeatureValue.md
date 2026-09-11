# TimeSeriesFeatureValue

One feature value: int, float, bool, or str. anyOf (not oneOf) because JSON Schema's integer is a subset of number. A float is compared and hashed by bit pattern, so 0.0 and -0.0 differ; NaN and negative zero are rejected on write.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`value`** | **`Union{Bool,Float64,Int64,String}`** |  | [required]
