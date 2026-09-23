# AVRTypeII

Parameters of an Automatic Voltage Regulator Type II - Typical static exciter model

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`k0`** | **`Float64`** | Regulator gain | [required]
**`t1`** | **`Float64`** | First pole in s | [required]
**`t2`** | **`Float64`** | First zero in s | [required]
**`t3`** | **`Float64`** | First pole in s | [required]
**`t4`** | **`Union{Absent,Float64,Nothing}`** | First zero in s | [optional]
**`te`** | **`Float64`** | Field circuit time constant | [required]
**`tr`** | **`Float64`** | Voltage measurement time constant | [required]
**`va_lim`** | **`MinMax`** | A pair of values bounding a quantity from below (`min`) and from above (`max`). | [required]
**`ae`** | **`Float64`** | 1st ceiling coefficient | [required]
**`be`** | **`Float64`** | 2nd ceiling coefficient | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference voltage set-point | [optional]
