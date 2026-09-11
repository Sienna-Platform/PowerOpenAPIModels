# AVRTypeI

Parameters of an Automatic Voltage Regulator Type I - Resembles IEEE Type DC1

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`ae`** | **`Float64`** | 1st ceiling coefficient | [required]
**`be`** | **`Float64`** | 2nd ceiling coefficient | [required]
**`ka`** | **`Float64`** | Amplifier gain | [required]
**`ke`** | **`Float64`** | Field circuit integral deviation | [required]
**`kf`** | **`Float64`** | Stabilizer gain | [required]
**`ta`** | **`Float64`** | Amplifier time constant | [required]
**`te`** | **`Float64`** | Field circuit time constant | [required]
**`tf`** | **`Float64`** | Stabilizer time constant | [required]
**`tr`** | **`Float64`** | Voltage measurement time constant | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference voltage set-point | [optional]
**`va_lim`** | **`MinMax`** | Limits for pi controller | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
