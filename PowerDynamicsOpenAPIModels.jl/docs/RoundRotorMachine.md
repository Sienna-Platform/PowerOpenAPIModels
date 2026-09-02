# RoundRotorMachine

Parameters of 4-states round-rotor synchronous machine with quadratic/exponential saturation: IEEE Std 1110 5.3.2 (Model 2.2). GENROU or GENROE model in PSSE and PSLF.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`r`** | **`Float64`** | Armature resistance. | [required]
**`se`** | **`Vector{Float64}`** | Saturation factor at 1 and 1.2 pu flux: S(1.0) = B(|psi_pp|-A)^2. | [required]
**`td0_p`** | **`Float64`** | Time constant of transient d-axis voltage. Units: s. | [required]
**`td0_pp`** | **`Float64`** | Time constant of sub-transient d-axis voltage. Units: s. | [required]
**`tq0_p`** | **`Float64`** | Time constant of transient q-axis voltage. Units: s. | [required]
**`tq0_pp`** | **`Float64`** | Time constant of sub-transient q-axis voltage. Units: s. | [required]
**`xd`** | **`Float64`** | Reactance after EMF in d-axis. | [required]
**`xd_p`** | **`Float64`** | Transient reactance after EMF in d-axis. | [required]
**`xd_pp`** | **`Float64`** | Sub-Transient reactance after EMF in d-axis. Note: Xd_pp = Xq_pp. | [required]
**`xl`** | **`Float64`** | Stator leakage reactance. | [required]
**`xq`** | **`Float64`** | Reactance after EMF in q-axis. | [required]
**`xq_p`** | **`Float64`** | Transient reactance after EMF in q-axis. | [required]
**`gamma_d1`** | **`Float64`** | Do not modify | [required]
**`gamma_d2`** | **`Float64`** | Do not modify | [required]
**`gamma_q1`** | **`Float64`** | Do not modify | [required]
**`gamma_q2`** | **`Float64`** | Do not modify | [required]
**`gamma_qd`** | **`Float64`** | Do not modify | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
