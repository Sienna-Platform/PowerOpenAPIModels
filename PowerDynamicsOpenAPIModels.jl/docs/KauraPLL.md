# KauraPLL

Parameters of a Phase-Locked Loop (PLL) based on 'Operation of a phase locked loop system under distorted utility conditions' by Vikram Kaura, and Vladimir Blasko

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`frequency_lp`** | **`Float64`** | PLL low-pass filter cutoff frequency, in natural units. Units: Hz. | [required]
**`kp_pll`** | **`Float64`** | PLL proportional gain | [required]
**`ki_pll`** | **`Float64`** | PLL integral gain | [required]
