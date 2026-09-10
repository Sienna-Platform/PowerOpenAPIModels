# SCRX


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [default to nothing]
**`Ta_Tb`** | **`Float64`** | Lead input constant ratio | [default to nothing]
**`Tb`** | **`Float64`** | Lag input constant | [default to nothing]
**`K`** | **`Float64`** | Regulator gain | [default to nothing]
**`Te`** | **`Float64`** | Regulator time constant | [default to nothing]
**`Efd_lim`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`switch`** | **`Int64`** | Switch | [default to nothing]
**`rc_rfd`** | **`Float64`** | Field current capability. Set &#x3D; 0 for negative current capability. Typical value 10 | [default to nothing]
**`V_ref`** | **`Float64`** | Reference voltage set-point | [optional] [default to 1.0]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


