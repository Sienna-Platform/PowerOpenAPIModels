# DEGOV1

Parameters Woodward Diesel Governor Model. DEGOV1 in PSSE

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`k`** | **`Float64`** | Governor gain for actuator | [required]
**`p_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference power set-point | [optional]
**`r`** | **`Float64`** | Steady state droop parameter | [required]
**`t1`** | **`Float64`** | Governor mechanism time constant | [required]
**`t2`** | **`Float64`** | Turbine power time constant | [required]
**`t3`** | **`Float64`** | Turbine exhaust temperature time constant | [required]
**`t4`** | **`Float64`** | Governor lead time constant | [required]
**`t5`** | **`Float64`** | Governor lag time constant | [required]
**`t6`** | **`Float64`** | Actuator time constant | [required]
**`t_lim`** | **`Vector{Float64}`** | Operational control limits on actuator (Tmin, Tmax) | [required]
**`td`** | **`Float64`** | Engine time delay | [required]
**`te`** | **`Float64`** | Power transducer time constant | [required]
**`droop_flag`** | **`Union{Absent,Int64,Nothing}`** | Droop control Flag. 0 for throttle feedback and 1 for electric power feedback | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
