# TGTypeII

Parameters of a turbine governor type II

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`r`** | **`Float64`** | Droop parameter | [required]
**`t1`** | **`Float64`** | Transient gain time constant | [required]
**`t2`** | **`Float64`** | Power fraction time constant | [required]
**`tau_limits`** | **`MinMax`** | A pair of values bounding a quantity from below (`min`) and from above (`max`). | [required]
**`p_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference power set-point | [optional]
