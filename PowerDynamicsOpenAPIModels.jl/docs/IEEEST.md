# IEEEST

IEEE stabilizing model PSS

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`input_code`** | **`Int64`** | Code input for stabilizer | [required]
**`remote_bus_control`** | **`Int64`** | ACBus identification number for control. 0 identifies the bus connected to this component | [required]
**`a1`** | **`Float64`** | Filter coefficient | [required]
**`a2`** | **`Float64`** | Filter coefficient | [required]
**`a3`** | **`Float64`** | Filter coefficient | [required]
**`a4`** | **`Float64`** | Filter coefficient | [required]
**`a5`** | **`Float64`** | Filter coefficient | [required]
**`a6`** | **`Float64`** | Filter coefficient | [required]
**`t1`** | **`Float64`** | Time constant | [required]
**`t2`** | **`Float64`** | Time constant | [required]
**`t3`** | **`Float64`** | Time constant | [required]
**`t4`** | **`Float64`** | Time constant | [required]
**`t5`** | **`Float64`** | Time constant | [required]
**`t6`** | **`Float64`** | Time constant | [required]
**`ks`** | **`Float64`** | Proportional gain | [required]
**`ls_lim`** | **`Vector{Float64}`** | PSS output limits for regulator output (Ls_min, Ls_max) | [required]
**`vcu`** | **`Float64`** | Cutoff limiter upper bound | [required]
**`vcl`** | **`Float64`** | Cutoff limiter lower bound | [required]
