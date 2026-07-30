# RECurrentControlB


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`Q_Flag`** | **`Bool`** | Q Flag used for I_qinj. | [default to nothing]
**`PQ_Flag`** | **`Bool`** | PQ Flag used for the Current Limit Logic. | [default to nothing]
**`Vdip_lim`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`T_rv`** | **`Float64`** | Voltage Filter Time Constant. Units: s. | [default to nothing]
**`dbd_pnts`** | [**`*DbdPnts`**](DbdPnts.md) |  | [default to nothing]
**`K_qv`** | **`Float64`** | Reactive current injection gain during over and undervoltage conditions. | [default to nothing]
**`Iqinj_lim`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`V_ref0`** | **`Float64`** | User defined reference. If 0, &#x60;PowerSimulationsDynamics.jl&#x60; initializes to initial terminal voltage. | [default to nothing]
**`K_vp`** | **`Float64`** | Voltage regulator proportional gain (used when QFlag &#x3D; 1). | [default to nothing]
**`K_vi`** | **`Float64`** | Voltage regulator integral gain (used when QFlag &#x3D; 1). | [default to nothing]
**`T_iq`** | **`Float64`** | Time constant for low-pass filter for state q_V when QFlag &#x3D; 0. Units: s. | [default to nothing]
**`I_max`** | **`Float64`** | Maximum limit on total converter current. | [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


