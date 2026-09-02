# SEXS

Parameters of Simplified Excitation System Model - SEXS in PSSE.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`k`** | **`Float64`** | Gain. | [required]
**`ta_tb`** | **`Float64`** | Ratio of lead and lag time constants. | [required]
**`tb`** | **`Float64`** | Lag time constant. Units: s. | [required]
**`te`** | **`Float64`** | Field circuit time constant. Units: s. | [required]
**`v_lim`** | **`SEXSVLim`** | Field voltage limits. | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference Voltage Set-point. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
