# ReducedOrderPLL

Parameters of a Phase-Locked Loop (PLL) based on 'Reduced-order Structure-preserving Model for Parallel-connected Three-phase Grid-tied Inverters'

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`frequency_lp`** | **`Float64`** | PLL low-pass filter cutoff frequency, in natural units. Units: Hz. | [required]
**`kp_pll`** | **`Float64`** | PLL proportional gain | [required]
**`ki_pll`** | **`Float64`** | PLL integral gain | [required]
