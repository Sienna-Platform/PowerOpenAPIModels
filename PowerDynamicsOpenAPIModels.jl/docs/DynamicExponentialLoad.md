# DynamicExponentialLoad

Parameters of 2-states of a generic dynamic load model based on "Voltage stability analysis using generic dynamic load models." It has no bus of its own: exactly one static injection device, with the same name, names it in its `dynamic_injector` property, and that device supplies the rest of its data.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the dynamic injection. Must equal the name of the static injection device that names it in `dynamic_injector`. | [required]
**`a`** | **`Float64`** | Active power static exponential coefficient | [required]
**`b`** | **`Float64`** | Reactive power static exponential coefficient | [required]
**`alpha`** | **`Float64`** | Active power transient exponential coefficient | [required]
**`beta`** | **`Float64`** | Reactive power transient exponential coefficient | [required]
**`t_p`** | **`Float64`** | Active Power Time Constant. Units: s. | [required]
**`t_q`** | **`Float64`** | Reactive Power Time Constant. Units: s. | [required]
**`base_power`** | **`Float64`** | Base power for the per-unit parameters of this model. Usually equal to the `base_power` of the static injection device that names this model. Units: MVA. | [required]
