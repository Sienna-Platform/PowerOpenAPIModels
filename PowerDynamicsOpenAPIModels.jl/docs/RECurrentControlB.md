# RECurrentControlB

Parameters of the Inner Control part of the REECB model in PSS/E.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`q_flag`** | **`Bool`** | Q Flag used for I_qinj. | [required]
**`pq_flag`** | **`Bool`** | PQ Flag used for the Current Limit Logic. | [required]
**`vdip_lim`** | **`MinMax`** | Limits for Voltage Dip Logic `(Vdip, Vup)`. | [required]
**`t_rv`** | **`Float64`** | Voltage Filter Time Constant. Units: s. | [required]
**`dbd_pnts`** | **`DbdPnts`** | Voltage error deadband thresholds `(dbd1, dbd2)`. | [required]
**`k_qv`** | **`Float64`** | Reactive current injection gain during over and undervoltage conditions. | [required]
**`iqinj_lim`** | **`MinMax`** | Limits for Iqinj `(I_qh1, I_ql1)`. | [required]
**`v_ref0`** | **`Float64`** | User defined reference. If 0, `PowerSimulationsDynamics.jl` initializes to initial terminal voltage. | [required]
**`k_vp`** | **`Float64`** | Voltage regulator proportional gain (used when QFlag = 1). | [required]
**`k_vi`** | **`Float64`** | Voltage regulator integral gain (used when QFlag = 1). | [required]
**`t_iq`** | **`Float64`** | Time constant for low-pass filter for state q_V when QFlag = 0. Units: s. | [required]
**`i_max`** | **`Float64`** | Maximum limit on total converter current. | [required]
