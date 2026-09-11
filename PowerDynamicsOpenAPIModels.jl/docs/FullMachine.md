# FullMachine

Parameter of a full order flux stator-rotor model without zero sequence flux in the stator. The derivative of stator fluxes (ψd and ψq) is NOT neglected. Only one q-axis damping circuit is considered. All parameters are in machine per unit. Refer to Chapter 3 of Power System Stability and Control by P. Kundur or Chapter 11 of Power System Dynamics: Stability and Control, by J. Machowski, J. Bialek and J. Bumby, for more details. Note that the models are somewhat different (but equivalent) due to the different Park Transformation used in both books

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`l_1d`** | **`Float64`** | Inductance of the d-axis rotor damping circuit, in per unit | [required]
**`l_1q`** | **`Float64`** | Inductance of the q-axis rotor damping circuit, in per unit | [required]
**`l_ad`** | **`Float64`** | Mutual inductance between stator winding and rotor field (and damping) winding inductance on d-axis, in per unit | [required]
**`l_aq`** | **`Float64`** | Mutual inductance between stator winding and rotor damping winding inductance on q-axis, in per unit | [required]
**`l_d`** | **`Float64`** | Inductance of fictitious damping that represent the effect of the three-phase stator winding in the d-axis of the rotor, in per unit. This value is denoted as Lad + Ll in Kundur (and Ld in Machowski) | [required]
**`l_f1d`** | **`Float64`** | Mutual inductance between rotor field winding and rotor damping winding inductance on d-axis, in per unit | [required]
**`l_ff`** | **`Float64`** | Field rotor winding inductance, in per unit | [required]
**`l_q`** | **`Float64`** | Inductance of fictitious damping that represent the effect of the three-phase stator winding in the q-axis of the rotor, in per unit. This value is denoted as Laq + Ll in Kundur (and Ld in Machowski) | [required]
**`r`** | **`Float64`** | Resistance after EMF | [required]
**`r_1d`** | **`Float64`** | Damping rotor winding resistance on d-axis in per unit. This value is denoted as RD in Machowski | [required]
**`r_1q`** | **`Float64`** | Damping rotor winding resistance on q-axis in per unit. This value is denoted as RQ in Machowski | [required]
**`r_f`** | **`Float64`** | Field rotor winding resistance | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
