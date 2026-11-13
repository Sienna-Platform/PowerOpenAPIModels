# SaturationOutputCurrentLimiter

Parameters of Saturation Current Controller Limiter. Regulates the magnitude of the inverter output current, and applies a closed loop feedback regulated by a static gain which provides ant-windup

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`i_max`** | **`Float64`** | Maximum limit on current controller input current | [required]
**`kw`** | **`Float64`** | Defined feedback gain | [required]
