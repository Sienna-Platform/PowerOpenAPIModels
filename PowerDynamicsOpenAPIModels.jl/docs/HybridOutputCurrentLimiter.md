# HybridOutputCurrentLimiter

Parameters of Hybrid Current Controller Limiter. Regulates the magnitude of the inverter output current, but with a closed loop feedback regulated by a virtual impedance which provides ant-windup. Described in: Novel Hybrid Current Limiter for Grid-Forming Inverter Control During Unbalanced Faults by Baeckland and Seo, 2023

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`i_max`** | **`Float64`** | Maximum limit on current controller input current | [required]
**`rv`** | **`Float64`** | Real part of the virtual impedance | [required]
**`lv`** | **`Float64`** | Imaginary part of the virtual impedance | [required]
