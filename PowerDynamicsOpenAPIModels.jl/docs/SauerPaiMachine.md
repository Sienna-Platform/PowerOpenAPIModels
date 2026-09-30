# SauerPaiMachine

Parameters of synchronous machine: Sauer Pai model

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`r`** | **`Float64`** | Resistance after EMF | [required]
**`xd`** | **`Float64`** | Reactance after EMF in d-axis | [required]
**`xq`** | **`Float64`** | Reactance after EMF in q-axis | [required]
**`xd_p`** | **`Float64`** | Transient reactance after EMF in d-axis | [required]
**`xq_p`** | **`Float64`** | Transient reactance after EMF in q-axis | [required]
**`xd_pp`** | **`Float64`** | Sub-Transient reactance after EMF in d-axis | [required]
**`xq_pp`** | **`Float64`** | Sub-Transient reactance after EMF in q-axis | [required]
**`xl`** | **`Float64`** | Stator leakage reactance | [required]
**`td0_p`** | **`Float64`** | Time constant of transient d-axis voltage | [required]
**`tq0_p`** | **`Float64`** | Time constant of transient q-axis voltage | [required]
**`td0_pp`** | **`Float64`** | Time constant of sub-transient d-axis voltage | [required]
**`tq0_pp`** | **`Float64`** | Time constant of sub-transient q-axis voltage | [required]
