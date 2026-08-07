# ReactiveRenewableControllerAB


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`bus_control`** | **`Int64`** | ACBus identification number for voltage control. &#x60;0&#x60; identifies the local bus connected to this component. | [default to nothing]
**`from_branch_control`** | **`Int64`** | Monitored branch FROM bus identification number for line drop compensation (if 0 generator power will be used). | [default to nothing]
**`to_branch_control`** | **`Int64`** | Monitored branch TO bus identification number for line drop compensation (if 0 generator power will be used). | [default to nothing]
**`branch_id_control`** | **`String`** | Branch circuit id for line drop compensation (as a string). If 0 generator power will be used. | [default to nothing]
**`VC_Flag`** | **`Bool`** | Voltage Compensator Flag for REPCA1. | [default to nothing]
**`Ref_Flag`** | **`Bool`** | Flag for Reactive Power Control for REPCA1. &#x60;false&#x60;: Q-control, &#x60;true&#x60;: V-control. | [default to nothing]
**`PF_Flag`** | **`Bool`** | Flag for Power Factor Control for Outer Control of REECB1. &#x60;false&#x60;: Q-control, &#x60;true&#x60;: Power Factor Control. | [default to nothing]
**`V_Flag`** | **`Bool`** | Flag for Voltage Control for Outer Control of REECB1. &#x60;false&#x60;: Voltage Control, &#x60;true&#x60;: Q-Control. | [default to nothing]
**`T_fltr`** | **`Float64`** | Voltage or Q-power of REPCA Filter Time Constant. Units: s. | [default to nothing]
**`K_p`** | **`Float64`** | Reactive power PI control proportional gain. | [default to nothing]
**`K_i`** | **`Float64`** | Reactive power PI control integral gain. | [default to nothing]
**`T_ft`** | **`Float64`** | Reactive power lead time constant. Units: s. | [default to nothing]
**`T_fv`** | **`Float64`** | Reactive power lag time constant. Units: s. | [default to nothing]
**`V_frz`** | **`Float64`** | Voltage below which state xiq_oc (integrator state) is freeze. | [default to nothing]
**`R_c`** | **`Float64`** | Line drop compensation resistance (used when VC_Flag &#x3D; 1). | [default to nothing]
**`X_c`** | **`Float64`** | Line drop compensation reactance (used when VC_Flag &#x3D; 1). | [default to nothing]
**`K_c`** | **`Float64`** | Reactive current compensation gain (used when VC_Flag &#x3D; 0). | [default to nothing]
**`e_lim`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`dbd_pnts`** | [**`*DbdPnts`**](DbdPnts.md) |  | [default to nothing]
**`Q_lim`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`T_p`** | **`Float64`** | Active power lag time constant in REECB. Used only when PF_Flag &#x3D; 1. Units: s. | [default to nothing]
**`Q_lim_inner`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`V_lim`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`K_qp`** | **`Float64`** | Reactive power regulator proportional gain (used when V_Flag &#x3D; 1). | [default to nothing]
**`K_qi`** | **`Float64`** | Reactive power regulator integral gain (used when V_Flag &#x3D; 1). | [default to nothing]
**`Q_ref`** | **`Float64`** | Reference Reactive Power Set-point. | [optional] [default to 1.0]
**`V_ref`** | **`Float64`** | Reference Voltage Set-point. | [optional] [default to 1.0]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


