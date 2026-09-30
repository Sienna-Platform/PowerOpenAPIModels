# HydroTurbineGov

Hydro turbine-governor

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`r`** | **`Float64`** | Permanent droop parameter | [required]
**`r_2`** | **`Float64`** | Temporary droop | [required]
**`tr`** | **`Float64`** | Governor time constant | [required]
**`tf`** | **`Float64`** | Filter time constant | [required]
**`tg`** | **`Float64`** | Servo time constant | [required]
**`velm`** | **`Float64`** | Gate velocity limit | [required]
**`gate_position_limits`** | **`MinMax`** | A pair of values bounding a quantity from below (`min`) and from above (`max`). | [required]
**`tw`** | **`Float64`** | Water time constant | [required]
**`at`** | **`Float64`** | Turbine gain | [required]
**`d_t`** | **`Float64`** | Turbine damping | [required]
**`q_nl`** | **`Float64`** | No power flow | [required]
**`p_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference load set-point | [optional]
