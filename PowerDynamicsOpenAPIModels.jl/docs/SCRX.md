# SCRX

This exciter is based on an IEEE type SCRX solid state exciter. The output field voltage is varied by a control system to maintain the system voltage at Vref. Please note that this exciter model has no initialization capabilities - this means that it will respond to whatever inputs it receives regardless of the state of the machine model

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`ta_tb`** | **`Float64`** | Lead input constant ratio | [required]
**`tb`** | **`Float64`** | Lag input constant | [required]
**`k`** | **`Float64`** | Regulator gain | [required]
**`te`** | **`Float64`** | Regulator time constant | [required]
**`efd_lim`** | **`MinMax`** | A pair of values bounding a quantity from below (`min`) and from above (`max`). | [required]
**`switch`** | **`Int64`** | Switch | [required]
**`rc_rfd`** | **`Float64`** | Field current capability. Set = 0 for negative current capability. Typical value 10 | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference voltage set-point | [optional]
