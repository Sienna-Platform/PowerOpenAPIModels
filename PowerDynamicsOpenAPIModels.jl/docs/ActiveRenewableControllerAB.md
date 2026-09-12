# ActiveRenewableControllerAB

Parameters of Active Power Controller including REPCA1 and REECB1.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`bus_control`** | **`Int64`** | ACBus identification number for voltage control. `0` identifies the local bus connected to this component. | [required]
**`from_branch_control`** | **`Int64`** | Monitored branch FROM bus number for line drop compensation (if 0 generator power will be used). | [required]
**`to_branch_control`** | **`Int64`** | Monitored branch TO bus number for line drop compensation (if 0 generator power will be used). | [required]
**`branch_id_control`** | **`Int64`** | Branch circuit id for line drop compensation. If 0 generator power will be used. in psy this is a string representing the branch name | [required]
**`freq_flag`** | **`Bool`** | Frequency Flag for REPCA1: `false`: disable, `true`: enable. | [required]
**`k_pg`** | **`Float64`** | Active power PI control proportional gain. | [required]
**`k_ig`** | **`Float64`** | Active power PI control integral gain. | [required]
**`t_p`** | **`Float64`** | Real power measurement filter time constant. Units: s. | [required]
**`fdbd_pnts`** | **`FdbdPnts`** | Frequency error dead band thresholds `(fdbd1, fdbd2)`. | [required]
**`fe_lim`** | **`MinMax`** | Upper/Lower limit on frequency error `(fe_min, fe_max)`. | [required]
**`p_lim`** | **`MinMax`** | Upper/Lower limit on power reference `(P_min, P_max)`. | [required]
**`t_g`** | **`Float64`** | Power Controller lag time constant. Units: s. | [required]
**`d_dn`** | **`Float64`** | Droop for over-frequency conditions. | [required]
**`d_up`** | **`Float64`** | Droop for under-frequency conditions. | [required]
**`dp_lim`** | **`MinMax`** | Upper/Lower limit on power reference ramp rates `(dP_min, dP_max)`. | [required]
**`p_lim_inner`** | **`MinMax`** | Upper/Lower limit on power reference for REECB `(P_min_inner, P_max_inner)`. | [required]
**`t_pord`** | **`Union{Absent,Float64,Nothing}`** | Power filter time constant REECB time constant. Units: s. | [optional]
**`p_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference Power Set-point. | [optional]
