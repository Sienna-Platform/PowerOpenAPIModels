# STAB1

Speed-sensitive stabilizing model

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`kt`** | **`Float64`** | K/T for washout filter | [required]
**`t`** | **`Float64`** | Time constant for washout filter | [required]
**`t1t3`** | **`Float64`** | Time constant division T1/T3 | [required]
**`t3`** | **`Float64`** | Time constant | [required]
**`t2t4`** | **`Float64`** | Time constant division T2/T4 | [required]
**`t4`** | **`Float64`** | Time constant | [required]
**`h_lim`** | **`Float64`** | PSS output limit | [required]
