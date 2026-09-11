# TGTypeI

Parameters of a turbine governor type I

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`p_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference power set-point | [optional]
**`r`** | **`Float64`** | Droop parameter | [required]
**`t3`** | **`Float64`** | Transient gain time constant | [required]
**`t4`** | **`Float64`** | Power fraction time constant | [required]
**`t5`** | **`Float64`** | Reheat time constant | [required]
**`tc`** | **`Float64`** | Servo time constant | [required]
**`ts`** | **`Float64`** | Governor time constant | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`valve_position_limits`** | **`MinMax`** | Valve position limits | [required]
