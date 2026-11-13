# DEGOV

Parameters Woodward Diesel Governor Model. DEGOV in PowerWorld

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`t1`** | **`Float64`** | Governor mechanism time constant. Units: s. | [required]
**`t2`** | **`Float64`** | Turbine power time constant. Units: s. | [required]
**`t3`** | **`Float64`** | Turbine exhaust temperature time constant. Units: s. | [required]
**`k`** | **`Float64`** | Governor gain (reciproical of droop) | [required]
**`t4`** | **`Float64`** | Governor lead time constant. Units: s. | [required]
**`t5`** | **`Float64`** | Governor lag time constant. Units: s. | [required]
**`t6`** | **`Float64`** | Actuator time constant. Units: s. | [required]
**`td`** | **`Float64`** | Engine time delay. Units: s. | [required]
**`p_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference power set-point | [optional]
