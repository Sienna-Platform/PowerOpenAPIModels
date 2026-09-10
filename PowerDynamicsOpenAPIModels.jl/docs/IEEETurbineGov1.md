# IEEETurbineGov1


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [default to nothing]
**`K`** | **`Int64`** | Governor gain | [default to nothing]
**`T1`** | **`Int64`** | Input filter lag | [default to nothing]
**`T2`** | **`Float64`** | Input filter lead | [default to nothing]
**`T3`** | **`Float64`** | Valve position time constant | [default to nothing]
**`U0`** | **`Float64`** | Maximum valve opening rate | [default to nothing]
**`U_c`** | **`Float64`** | Maximum valve closing rate | [default to nothing]
**`valve_position_limits`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`T4`** | **`Float64`** | Time constant inlet steam | [default to nothing]
**`K1`** | **`Float64`** | Fraction of high pressure shaft power | [default to nothing]
**`K2`** | **`Float64`** | Fraction of low pressure shaft power | [default to nothing]
**`T5`** | **`Float64`** | Time constant for second boiler pass | [default to nothing]
**`K3`** | **`Float64`** | Fraction of high pressure shaft power second boiler pass | [default to nothing]
**`K4`** | **`Float64`** | Fraction of low pressure shaft power second boiler pass | [default to nothing]
**`T6`** | **`Float64`** | Time constant for third boiler pass | [default to nothing]
**`K5`** | **`Float64`** | Fraction of high pressure shaft power third boiler pass | [default to nothing]
**`K6`** | **`Float64`** | Fraction of low pressure shaft power third boiler pass | [default to nothing]
**`T7`** | **`Float64`** | Time constant for fourth boiler pass | [default to nothing]
**`K7`** | **`Float64`** | Fraction of high pressure shaft power fourth boiler pass | [default to nothing]
**`K8`** | **`Float64`** | Fraction of low pressure shaft power fourth boiler pass | [default to nothing]
**`P_ref`** | **`Float64`** | Reference power set-point | [optional] [default to 1.0]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


