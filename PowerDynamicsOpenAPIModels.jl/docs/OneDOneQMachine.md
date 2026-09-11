# OneDOneQMachine

Parameters of 4-states synchronous machine: Simplified Marconato model The derivative of stator fluxes (ψd and ψq) is neglected and ωψd = ψd and ωψq = ψq is assumed (i.e. ω=1.0). This is standard when transmission network dynamics is neglected

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`r`** | **`Float64`** | Resistance after EMF | [required]
**`td0_p`** | **`Float64`** | Time constant of transient d-axis voltage | [required]
**`tq0_p`** | **`Float64`** | Time constant of transient q-axis voltage | [required]
**`xd`** | **`Float64`** | Reactance after EMF in d-axis | [required]
**`xd_p`** | **`Float64`** | Transient reactance after EMF in d-axis | [required]
**`xq`** | **`Float64`** | Reactance after EMF in q-axis | [required]
**`xq_p`** | **`Float64`** | Transient reactance after EMF in q-axis | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
