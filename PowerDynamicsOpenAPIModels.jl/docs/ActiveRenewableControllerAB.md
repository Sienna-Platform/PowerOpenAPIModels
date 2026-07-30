# ActiveRenewableControllerAB


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`bus_control`** | **`Int64`** | ACBus identification number for voltage control. &#x60;0&#x60; identifies the local bus connected to this component. | [default to nothing]
**`from_branch_control`** | **`Int64`** | Monitored branch FROM bus number for line drop compensation (if 0 generator power will be used). | [default to nothing]
**`to_branch_control`** | **`Int64`** | Monitored branch TO bus number for line drop compensation (if 0 generator power will be used). | [default to nothing]
**`branch_id_control`** | **`Int64`** | Branch circuit id for line drop compensation. If 0 generator power will be used. in psy this is a string representing the branch name | [default to nothing]
**`Freq_Flag`** | **`Bool`** | Frequency Flag for REPCA1: &#x60;false&#x60;: disable, &#x60;true&#x60;: enable. | [default to nothing]
**`K_pg`** | **`Float64`** | Active power PI control proportional gain. | [default to nothing]
**`K_ig`** | **`Float64`** | Active power PI control integral gain. | [default to nothing]
**`T_p`** | **`Float64`** | Real power measurement filter time constant. Units: s. | [default to nothing]
**`fdbd_pnts`** | [**`*FdbdPnts`**](FdbdPnts.md) |  | [default to nothing]
**`fe_lim`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`P_lim`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`T_g`** | **`Float64`** | Power Controller lag time constant. Units: s. | [default to nothing]
**`D_dn`** | **`Float64`** | Droop for over-frequency conditions. | [default to nothing]
**`D_up`** | **`Float64`** | Droop for under-frequency conditions. | [default to nothing]
**`dP_lim`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`P_lim_inner`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`T_pord`** | **`Float64`** | Power filter time constant REECB time constant. Units: s. | [optional] [default to nothing]
**`P_ref`** | **`Float64`** | Reference Power Set-point. | [optional] [default to 1.0]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


