# TGFixed

Parameters of a fixed Turbine Governor that returns a fixed mechanical torque given by the product of P_ref*efficiency

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`p_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference power set-point | [optional]
**`efficiency`** | **`Float64`** | Efficiency factor that multiplies P_ref | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
