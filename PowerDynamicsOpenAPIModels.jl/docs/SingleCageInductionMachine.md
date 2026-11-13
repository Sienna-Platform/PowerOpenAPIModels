# SingleCageInductionMachine

Parameters of 5-states three-phase single cage induction machine with quadratic torque-speed relationship It has no bus of its own: exactly one static injection device, with the same name, names it in its `dynamic_injector` property, and that device supplies the rest of its data.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the dynamic injection. Must equal the name of the static injection device that names it in `dynamic_injector`. | [required]
**`r_s`** | **`Float64`** | Armature stator resistance. Units: pu. | [required]
**`r_r`** | **`Float64`** | Rotor resistance. Units: pu. | [required]
**`x_ls`** | **`Float64`** | Stator Leakage Reactance. Units: pu. | [required]
**`x_lr`** | **`Float64`** | Rotor Leakage Reactance. Units: pu. | [required]
**`x_m`** | **`Float64`** | Stator-Rotor Mutual Reactance. Units: pu. | [required]
**`h`** | **`Float64`** | Motor Inertia Constant [s]. Units: s. | [required]
**`a`** | **`Float64`** | Torque-Speed Quadratic Term | [required]
**`b`** | **`Float64`** | Torque-Speed Linear Term | [required]
**`torque_ref`** | **`Float64`** | Reference torque parameter | [required]
**`b_shunt`** | **`Float64`** | Susceptance Initialization Corrector Term | [required]
**`base_power`** | **`Float64`** | Base power for the per-unit parameters of this model. Usually equal to the `base_power` of the static injection device that names this model. Units: MVA. | [required]
