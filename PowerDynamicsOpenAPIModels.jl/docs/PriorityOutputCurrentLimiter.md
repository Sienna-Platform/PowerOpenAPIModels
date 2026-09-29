# PriorityOutputCurrentLimiter

Parameters of Priority-Based Current Controller Limiter. Regulates the magnitude of the inverter output current and prioritizes a specific angle for the resultant current signal

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`i_max`** | **`Float64`** | Maximum limit on current controller input current | [required]
**`phi_i`** | **`Float64`** | Pre-defined angle (measured against the d-axis) for Iref once limit Imax is hit | [required]
