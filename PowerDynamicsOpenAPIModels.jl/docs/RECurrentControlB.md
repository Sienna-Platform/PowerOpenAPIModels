# RECurrentControlB

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`q_flag`** | **`Bool`** |  | [required]
**`pq_flag`** | **`Bool`** |  | [required]
**`vdip_lim`** | **`MinMax`** | A pair of values bounding a quantity from below (`min`) and from above (`max`). | [required]
**`t_rv`** | **`Float64`** |  | [required]
**`dbd_pnts`** | **`DbdPnts`** | A pair of deadband thresholds `(dbd1, dbd2)` on a voltage or reactive-power error signal, inside which the controller does not act. | [required]
**`k_qv`** | **`Float64`** |  | [required]
**`iqinj_lim`** | **`MinMax`** | A pair of values bounding a quantity from below (`min`) and from above (`max`). | [required]
**`v_ref0`** | **`Float64`** |  | [required]
**`k_vp`** | **`Float64`** |  | [required]
**`k_vi`** | **`Float64`** |  | [required]
**`t_iq`** | **`Float64`** |  | [required]
**`i_max`** | **`Float64`** |  | [required]
