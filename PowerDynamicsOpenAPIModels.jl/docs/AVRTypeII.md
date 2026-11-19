# AVRTypeII

Parameters of an Automatic Voltage Regulator Type II - Typical static exciter model

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`k0`** | **`Float64`** | Regulator gain | [required]
**`t1`** | **`Float64`** | First pole in s. Units: s. | [required]
**`t2`** | **`Float64`** | First zero in s. Units: s. | [required]
**`t3`** | **`Float64`** | First pole in s. Units: s. | [required]
**`t4`** | **`Float64`** | First zero in s. Units: s. | [required]
**`te`** | **`Float64`** | Field circuit time constant. Units: s. | [required]
**`tr`** | **`Float64`** | Voltage measurement time constant. Units: s. | [required]
**`va_lim`** | **`MinMax`** | Limits for pi controller | [required]
**`ae`** | **`Float64`** | 1st ceiling coefficient | [required]
**`be`** | **`Float64`** | 2nd ceiling coefficient | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference voltage set-point | [optional]
