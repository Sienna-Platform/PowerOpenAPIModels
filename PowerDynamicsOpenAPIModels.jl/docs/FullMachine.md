# FullMachine


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [default to nothing]
**`R`** | **`Float64`** | Resistance after EMF | [default to nothing]
**`R_f`** | **`Float64`** | Field rotor winding resistance | [default to nothing]
**`R_1d`** | **`Float64`** | Damping rotor winding resistance on d-axis in per unit. This value is denoted as RD in Machowski | [default to nothing]
**`R_1q`** | **`Float64`** | Damping rotor winding resistance on q-axis in per unit. This value is denoted as RQ in Machowski | [default to nothing]
**`L_d`** | **`Float64`** | Inductance of fictitious damping that represent the effect of the three-phase stator winding in the d-axis of the rotor, in per unit. This value is denoted as Lad + Ll in Kundur (and Ld in Machowski) | [default to nothing]
**`L_q`** | **`Float64`** | Inductance of fictitious damping that represent the effect of the three-phase stator winding in the q-axis of the rotor, in per unit. This value is denoted as Laq + Ll in Kundur (and Ld in Machowski) | [default to nothing]
**`L_ad`** | **`Float64`** | Mutual inductance between stator winding and rotor field (and damping) winding inductance on d-axis, in per unit | [default to nothing]
**`L_aq`** | **`Float64`** | Mutual inductance between stator winding and rotor damping winding inductance on q-axis, in per unit | [default to nothing]
**`L_f1d`** | **`Float64`** | Mutual inductance between rotor field winding and rotor damping winding inductance on d-axis, in per unit | [default to nothing]
**`L_ff`** | **`Float64`** | Field rotor winding inductance, in per unit | [default to nothing]
**`L_1d`** | **`Float64`** | Inductance of the d-axis rotor damping circuit, in per unit | [default to nothing]
**`L_1q`** | **`Float64`** | Inductance of the q-axis rotor damping circuit, in per unit | [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


