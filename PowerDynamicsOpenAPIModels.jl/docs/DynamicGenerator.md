# DynamicGenerator

Dynamic response model of a synchronous generator. It names five function blocks by id: a synchronous machine model, a shaft, an excitation system, a turbine governor, and a power system stabilizer. It has no bus of its own: exactly one static injection device, with the same name, names it in its `dynamic_injector` property, and that device supplies the rest of the generator's data.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the dynamic injection. Must equal the name of the static injection device that names it in `dynamic_injector`. | [required]
**`frequency_ref`** | **`Float64`** | Frequency reference set-point, in natural units. Usually equal to the system frequency. Units: Hz. | [required]
**`synchronous_machine_dynamics`** | **`Int64`** | ID of the SynchronousMachineDynamics function block: the machine model for the electromagnetic dynamics. | [required]
**`shaft`** | **`Int64`** | ID of the Shaft function block: the shaft model for the electromechanical dynamics. | [required]
**`excitation_system_dynamics`** | **`Int64`** | ID of the ExcitationSystemDynamics function block: the excitation system model. | [required]
**`turbine_governor_dynamics`** | **`Int64`** | ID of the TurbineGovernorDynamics function block: the prime mover and turbine governor model. | [required]
**`power_system_stabilizer_dynamics`** | **`Int64`** | ID of the PowerSystemStabilizerDynamics function block: the power system stabilizer model. | [required]
**`base_power`** | **`Float64`** | Base power for the per-unit parameters of the referenced function blocks. Usually equal to the `base_power` of the static injection device that names this model. Units: MVA. | [required]
