# SimpleMarconatoMachine

Parameters of 4-states synchronous machine: Simplified Marconato model The derivative of stator fluxes (ψd and ψq) is neglected and ωψd = ψd and ωψq = ψq is assumed (i.e. ω=1.0). This is standard when transmission network dynamics is neglected

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`r`** | **`Float64`** | Resistance after EMF. Units: pu. | [required]
**`xd`** | **`Float64`** | Reactance after EMF in d-axis. Units: pu. | [required]
**`xq`** | **`Float64`** | Reactance after EMF in q-axis. Units: pu. | [required]
**`xd_p`** | **`Float64`** | Transient reactance after EMF in d-axis. Units: pu. | [required]
**`xq_p`** | **`Float64`** | Transient reactance after EMF in q-axis. Units: pu. | [required]
**`xd_pp`** | **`Float64`** | Sub-Transient reactance after EMF in d-axis. Units: pu. | [required]
**`xq_pp`** | **`Float64`** | Sub-Transient reactance after EMF in q-axis. Units: pu. | [required]
**`td0_p`** | **`Float64`** | Time constant of transient d-axis voltage. Units: s. | [required]
**`tq0_p`** | **`Float64`** | Time constant of transient q-axis voltage. Units: s. | [required]
**`td0_pp`** | **`Float64`** | Time constant of sub-transient d-axis voltage. Units: s. | [required]
**`tq0_pp`** | **`Float64`** | Time constant of sub-transient q-axis voltage. Units: s. | [required]
**`t_aa`** | **`Float64`** | Time constant of d-axis additional leakage. Units: s. | [required]
