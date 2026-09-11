# GasTG

Parameters of Gas Turbine-Governor. GAST in PSSE and GAST_PTI in PowerWorld

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`at`** | **`Float64`** | Ambient temperature load limit | [required]
**`d_turb`** | **`Float64`** | Speed damping coefficient of gas turbine rotor | [required]
**`kt`** | **`Float64`** | Load limit feedback gain | [required]
**`p_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference load set-point | [optional]
**`r`** | **`Float64`** | Speed droop parameter | [required]
**`t1`** | **`Float64`** | Governor time constant | [required]
**`t2`** | **`Float64`** | Combustion chamber time constant | [required]
**`t3`** | **`Float64`** | Load limit time constant (exhaust gas measurement time) | [required]
**`v_lim`** | **`Vector{Float64}`** | Operational control limits on fuel valve opening (Vmin, Vmax) | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
