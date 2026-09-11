# IEEETurbineGov1

IEEE Type 1 Speed-Governing Model

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`k`** | **`Int64`** | Governor gain | [required]
**`k1`** | **`Float64`** | Fraction of high pressure shaft power | [required]
**`k2`** | **`Float64`** | Fraction of low pressure shaft power | [required]
**`k3`** | **`Float64`** | Fraction of high pressure shaft power second boiler pass | [required]
**`k4`** | **`Float64`** | Fraction of low pressure shaft power second boiler pass | [required]
**`k5`** | **`Float64`** | Fraction of high pressure shaft power third boiler pass | [required]
**`k6`** | **`Float64`** | Fraction of low pressure shaft power third boiler pass | [required]
**`k7`** | **`Float64`** | Fraction of high pressure shaft power fourth boiler pass | [required]
**`k8`** | **`Float64`** | Fraction of low pressure shaft power fourth boiler pass | [required]
**`p_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference power set-point | [optional]
**`t1`** | **`Int64`** | Input filter lag | [required]
**`t2`** | **`Float64`** | Input filter lead | [required]
**`t3`** | **`Float64`** | Valve position time constant | [required]
**`t4`** | **`Float64`** | Time constant inlet steam | [required]
**`t5`** | **`Float64`** | Time constant for second boiler pass | [required]
**`t6`** | **`Float64`** | Time constant for third boiler pass | [required]
**`t7`** | **`Float64`** | Time constant for fourth boiler pass | [required]
**`u0`** | **`Float64`** | Maximum valve opening rate | [required]
**`u_c`** | **`Float64`** | Maximum valve closing rate | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`valve_position_limits`** | **`MinMax`** | Valve position limits | [required]
