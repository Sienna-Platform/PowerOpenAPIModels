# TGTypeII

Parameters of a turbine governor type II

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`p_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference power set-point | [optional]
**`r`** | **`Float64`** | Droop parameter | [required]
**`t1`** | **`Float64`** | Transient gain time constant | [required]
**`t2`** | **`Float64`** | Power fraction time constant | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`tau_limits`** | **`MinMax`** | Power limits into the governor | [required]
