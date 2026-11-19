# HydroTurbineGov

Hydro turbine-governor

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`r_big`** | **`Float64`** | Permanent droop, in pu. | [required]
**`r_small`** | **`Float64`** | Temporary droop, in pu. | [required]
**`tr`** | **`Float64`** | Governor time constant. Units: s. | [required]
**`tf`** | **`Float64`** | Filter time constant. Units: s. | [required]
**`tg`** | **`Float64`** | Servo time constant. Units: s. | [required]
**`velm`** | **`Float64`** | Gate velocity limit | [required]
**`gate_position_limits`** | **`MinMax`** | Gate position limits | [required]
**`tw`** | **`Float64`** | Water time constant. Units: s. | [required]
**`at`** | **`Float64`** | Turbine gain | [required]
**`d_t`** | **`Float64`** | Turbine damping | [required]
**`q_nl`** | **`Float64`** | No power flow | [required]
**`p_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference load set-point | [optional]
