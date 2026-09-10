# ST8C


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [default to nothing]
**`OEL_Flag`** | **`Int64`** | OEL Flag for ST8C: &lt;2: Summation at voltage error, 2: OEL takeover at gate | [default to nothing]
**`UEL_Flag`** | **`Int64`** | UEL Flag for ST8C: &lt;2: Summation at voltage error, 2: UEL takeover at gate | [default to nothing]
**`SCL_Flag`** | **`Int64`** | SCL Flag for ST8C: &lt;2: Summation at voltage error, 2: SCL takeover at UEL and OEL gates | [default to nothing]
**`SW1_Flag`** | **`Int64`** | SW1 Flag for power source selector for ST8C: &lt;2: Source from generator terminal voltage, 2: Independent power source | [default to nothing]
**`Tr`** | **`Float64`** | Regulator input filter time constant | [default to nothing]
**`K_pr`** | **`Float64`** | Regulator proportional gain | [default to nothing]
**`K_ir`** | **`Float64`** | Regulator integral gain | [default to nothing]
**`Vpi_lim`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`K_pa`** | **`Float64`** | Field current regulator proportional gain | [default to nothing]
**`K_ia`** | **`Float64`** | Field current regulator integral gain | [default to nothing]
**`Va_lim`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`K_a`** | **`Float64`** | Field current regulator proportional gain | [default to nothing]
**`T_a`** | **`Float64`** | Controlled rectifier bridge equivalent time constant | [default to nothing]
**`Vr_lim`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`K_f`** | **`Float64`** | Exciter field current feedback gain | [default to nothing]
**`T_f`** | **`Float64`** | Field current feedback time constant | [default to nothing]
**`K_c1`** | **`Float64`** | Rectifier loading factor proportional to commutating reactance | [default to nothing]
**`K_p`** | **`Float64`** | Potential circuit (voltage) gain coefficient | [default to nothing]
**`K_i1`** | **`Float64`** | Potential circuit (current) gain coefficient | [default to nothing]
**`X_l`** | **`Float64`** | Reactance associated with potential source | [default to nothing]
**`theta_p`** | **`Float64`** | Potential circuit phase angle (degrees) | [default to nothing]
**`VB1_max`** | **`Float64`** | Maximum available exciter voltage | [default to nothing]
**`K_c2`** | **`Float64`** | Rectifier loading factor proportional to commutating reactance | [default to nothing]
**`K_i2`** | **`Float64`** | Potential circuit (current) gain coefficient | [default to nothing]
**`VB2_max`** | **`Float64`** | Maximum available exciter voltage | [default to nothing]
**`V_ref`** | **`Float64`** | Reference voltage set-point | [optional] [default to 1.0]
**`Ifd_ref`** | **`Float64`** | Reference field current set-point | [optional] [default to 1.0]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


