# TGSimple

Parameters of a Simple one-state Turbine Governor

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`d_t`** | **`Float64`** | Inverse droop parameter | [required]
**`tm`** | **`Float64`** | Turbine governor low-pass time constant | [required]
**`p_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference power set-point | [optional]
