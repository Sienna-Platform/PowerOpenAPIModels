# TGTypeI

Parameters of a turbine governor type I

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`r`** | **`Float64`** | Droop parameter | [required]
**`ts`** | **`Float64`** | Governor time constant | [required]
**`tc`** | **`Float64`** | Servo time constant | [required]
**`t3`** | **`Float64`** | Transient gain time constant | [required]
**`t4`** | **`Float64`** | Power fraction time constant | [required]
**`t5`** | **`Float64`** | Reheat time constant | [required]
**`valve_position_limits`** | **`MinMax`** | A pair of values bounding a quantity from below (`min`) and from above (`max`). | [required]
**`p_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference power set-point | [optional]
