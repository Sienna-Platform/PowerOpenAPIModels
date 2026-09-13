# SteamTurbineGov1

Steam Turbine-Governor. This model considers both TGOV1 or TGOV1DU in PSS/E.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`r`** | **`Float64`** | Droop parameter. | [required]
**`t1`** | **`Float64`** | Governor time constant. Units: s. | [required]
**`valve_position_limits`** | **`MinMax`** | Valve position limits. | [required]
**`t2`** | **`Float64`** | Lead Lag Lead Time constant. Units: s. | [required]
**`t3`** | **`Float64`** | Lead Lag Lag Time constant. Units: s. | [required]
**`d_t`** | **`Float64`** | Turbine Damping. | [required]
**`db_h`** | **`Float64`** | Deadband for overspeed. | [required]
**`db_l`** | **`Float64`** | Deadband for underspeed. | [required]
**`t_rate`** | **`Float64`** | Turbine Rate. If zero, generator base is used. Units: MW. | [required]
**`p_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference Power Set-point. | [optional]
