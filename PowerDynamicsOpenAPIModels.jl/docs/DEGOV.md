# DEGOV

Parameters Woodward Diesel Governor Model. DEGOV in PowerWorld

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`t1`** | **`Float64`** | Governor mechanism time constant | [required]
**`t2`** | **`Float64`** | Turbine power time constant | [required]
**`t3`** | **`Float64`** | Turbine exhaust temperature time constant | [required]
**`k`** | **`Float64`** | Governor gain (reciproical of droop) | [required]
**`t4`** | **`Float64`** | Governor lead time constant | [required]
**`t5`** | **`Float64`** | Governor lag time constant | [required]
**`t6`** | **`Float64`** | Actuator time constant | [required]
**`td`** | **`Float64`** | Engine time delay | [required]
**`p_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference power set-point | [optional]
