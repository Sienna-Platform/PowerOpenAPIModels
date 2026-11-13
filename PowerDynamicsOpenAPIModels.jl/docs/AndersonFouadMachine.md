# AndersonFouadMachine

Parameters of 6-states synchronous machine: Anderson-Fouad model

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
