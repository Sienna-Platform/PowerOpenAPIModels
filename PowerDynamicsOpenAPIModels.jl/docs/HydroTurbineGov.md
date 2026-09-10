# HydroTurbineGov


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [default to nothing]
**`R`** | **`Float64`** | Permanent droop parameter | [default to nothing]
**`r`** | **`Float64`** | Temporary droop | [default to nothing]
**`Tr`** | **`Float64`** | Governor time constant | [default to nothing]
**`Tf`** | **`Float64`** | Filter time constant | [default to nothing]
**`Tg`** | **`Float64`** | Servo time constant | [default to nothing]
**`VELM`** | **`Float64`** | Gate velocity limit | [default to nothing]
**`gate_position_limits`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`Tw`** | **`Float64`** | Water time constant | [default to nothing]
**`At`** | **`Float64`** | Turbine gain | [default to nothing]
**`D_T`** | **`Float64`** | Turbine damping | [default to nothing]
**`q_nl`** | **`Float64`** | No power flow | [default to nothing]
**`P_ref`** | **`Float64`** | Reference load set-point | [optional] [default to 1.0]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


