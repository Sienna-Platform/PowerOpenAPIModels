# RoundRotorMachine


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`R`** | **`Float64`** | Armature resistance. | [default to nothing]
**`Td0_p`** | **`Float64`** | Time constant of transient d-axis voltage. Units: s. | [default to nothing]
**`Td0_pp`** | **`Float64`** | Time constant of sub-transient d-axis voltage. Units: s. | [default to nothing]
**`Tq0_p`** | **`Float64`** | Time constant of transient q-axis voltage. Units: s. | [default to nothing]
**`Tq0_pp`** | **`Float64`** | Time constant of sub-transient q-axis voltage. Units: s. | [default to nothing]
**`Xd`** | **`Float64`** | Reactance after EMF in d-axis. | [default to nothing]
**`Xq`** | **`Float64`** | Reactance after EMF in q-axis. | [default to nothing]
**`Xd_p`** | **`Float64`** | Transient reactance after EMF in d-axis. | [default to nothing]
**`Xq_p`** | **`Float64`** | Transient reactance after EMF in q-axis. | [default to nothing]
**`Xd_pp`** | **`Float64`** | Sub-Transient reactance after EMF in d-axis. Note: Xd_pp &#x3D; Xq_pp. | [default to nothing]
**`Xl`** | **`Float64`** | Stator leakage reactance. | [default to nothing]
**`Se`** | **`Vector{Float64}`** | Saturation factor at 1 and 1.2 pu flux: S(1.0) &#x3D; B(|psi_pp|-A)^2. | [default to nothing]
**`gamma_d1`** | **`Float64`** | Do not modify | [default to nothing]
**`gamma_q1`** | **`Float64`** | Do not modify | [default to nothing]
**`gamma_d2`** | **`Float64`** | Do not modify | [default to nothing]
**`gamma_q2`** | **`Float64`** | Do not modify | [default to nothing]
**`gamma_qd`** | **`Float64`** | Do not modify | [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


