# SEXS

Parameters of Simplified Excitation System Model - SEXS in PSSE

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`ta_tb`** | **`Float64`** | Ratio of lead and lag time constants | [required]
**`tb`** | **`Float64`** | Lag time constant. Units: s. | [required]
**`k`** | **`Float64`** | Gain | [required]
**`te`** | **`Float64`** | Field circuit time constant. Units: s. | [required]
**`v_lim`** | **`MinMax`** | A pair of values bounding a quantity from below (`min`) and from above (`max`). | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference voltage set-point | [optional]
