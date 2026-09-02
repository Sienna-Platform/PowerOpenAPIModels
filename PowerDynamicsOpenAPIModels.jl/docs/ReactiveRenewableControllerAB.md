# ReactiveRenewableControllerAB

Parameters of Reactive Power Controller including REPCA1 and REECB1.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`k_c`** | **`Float64`** | Reactive current compensation gain (used when VC_Flag = 0). | [required]
**`k_i`** | **`Float64`** | Reactive power PI control integral gain. | [required]
**`k_p`** | **`Float64`** | Reactive power PI control proportional gain. | [required]
**`k_qi`** | **`Float64`** | Reactive power regulator integral gain (used when V_Flag = 1). | [required]
**`k_qp`** | **`Float64`** | Reactive power regulator proportional gain (used when V_Flag = 1). | [required]
**`pf_flag`** | **`Bool`** | Flag for Power Factor Control for Outer Control of REECB1. `false`: Q-control, `true`: Power Factor Control. | [required]
**`q_lim`** | **`ReactiveRenewableControllerABQLim`** | Upper/Lower limit on reactive power V/Q control in REPCA `(Q_min, Q_max)`. | [required]
**`q_lim_inner`** | **`ReactiveRenewableControllerABQLimInner`** | Upper/Lower limit on reactive power input in REECB `(Q_min_inner, Q_max_inner)`. Only used when V_Flag = 1. | [required]
**`q_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference Reactive Power Set-point. | [optional]
**`r_c`** | **`Float64`** | Line drop compensation resistance (used when VC_Flag = 1). | [required]
**`ref_flag`** | **`Bool`** | Flag for Reactive Power Control for REPCA1. `false`: Q-control, `true`: V-control. | [required]
**`t_fltr`** | **`Float64`** | Voltage or Q-power of REPCA Filter Time Constant. Units: s. | [required]
**`t_ft`** | **`Float64`** | Reactive power lead time constant. Units: s. | [required]
**`t_fv`** | **`Float64`** | Reactive power lag time constant. Units: s. | [required]
**`t_p`** | **`Float64`** | Active power lag time constant in REECB. Used only when PF_Flag = 1. Units: s. | [required]
**`vc_flag`** | **`Bool`** | Voltage Compensator Flag for REPCA1. | [required]
**`v_flag`** | **`Bool`** | Flag for Voltage Control for Outer Control of REECB1. `false`: Voltage Control, `true`: Q-Control. | [required]
**`v_frz`** | **`Float64`** | Voltage below which state xiq_oc (integrator state) is freeze. | [required]
**`v_lim`** | **`ReactiveRenewableControllerABVLim`** | Upper/Lower limit on reactive power PI controller in REECB `(V_min, V_max)`. Only used when V_Flag = 1. | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference Voltage Set-point. | [optional]
**`x_c`** | **`Float64`** | Line drop compensation reactance (used when VC_Flag = 1). | [required]
**`branch_id_control`** | **`String`** | Branch circuit id for line drop compensation (as a string). If 0 generator power will be used. | [required]
**`bus_control`** | **`Int64`** | ACBus identification number for voltage control. `0` identifies the local bus connected to this component. | [required]
**`dbd_pnts`** | **`ReactiveRenewableControllerABDbdPnts`** | Voltage or Q-power error dead band thresholds `(dbd1, dbd2)`. | [required]
**`e_lim`** | **`ReactiveRenewableControllerABELim`** | Upper/Lower limit on Voltage or Q-power deadband output `(e_min, e_max)`. | [required]
**`from_branch_control`** | **`Int64`** | Monitored branch FROM bus identification number for line drop compensation (if 0 generator power will be used). | [required]
**`to_branch_control`** | **`Int64`** | Monitored branch TO bus identification number for line drop compensation (if 0 generator power will be used). | [required]
