# PeriodicVariableSource

This struct acts as an infinity bus with time varying phasor values magnitude and angle V(t) heta(t). Time varying functions are represented using fourier series It has no bus of its own: exactly one static injection device, with the same name, names it in its `dynamic_injector` property, and that device supplies the rest of its data.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the dynamic injection. Must equal the name of the static injection device that names it in `dynamic_injector`. | [required]
**`r_th`** | **`Float64`** | Source Thevenin resistance | [required]
**`x_th`** | **`Float64`** | Source Thevenin reactance | [required]
**`internal_voltage_bias`** | **`Union{Absent,Float64,Nothing}`** | a0 term of the Fourier Series for the voltage | [optional]
**`internal_voltage_frequencies`** | **`Union{Absent,Nothing,Vector{Float64}}`** | Frequencies in radians/s | [optional]
**`internal_voltage_coefficients`** | **`Union{Absent,Nothing,Vector{Vector{Float64}}}`** | Coefficients for terms n > 1. First component corresponds to sin and second component to cos | [optional]
**`internal_angle_bias`** | **`Union{Absent,Float64,Nothing}`** | a0 term of the Fourier Series for the angle | [optional]
**`internal_angle_frequencies`** | **`Union{Absent,Nothing,Vector{Float64}}`** | Frequencies in radians/s | [optional]
**`internal_angle_coefficients`** | **`Union{Absent,Nothing,Vector{Vector{Float64}}}`** | Coefficients for terms n > 1. First component corresponds to sin and second component to cos | [optional]
**`base_power`** | **`Float64`** | Base power for the per-unit parameters of this model. Usually equal to the `base_power` of the static injection device that names this model. Units: MVA. | [required]
