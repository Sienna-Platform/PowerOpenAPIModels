# FiveMassShaft

Parameters of 5 mass-spring shaft model. It contains a High-Pressure (HP) steam turbine, Intermediate-Pressure (IP) steam turbine, Low-Pressure (LP) steam turbine, the Rotor and an Exciter (EX) mover

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`d`** | **`Float64`** | Rotor natural damping | [required]
**`d_12`** | **`Float64`** | High-intermediate pressure turbine damping | [required]
**`d_23`** | **`Float64`** | Intermediate-low pressure turbine damping | [required]
**`d_34`** | **`Float64`** | Low pressure turbine-rotor damping | [required]
**`d_45`** | **`Float64`** | Rotor-exciter damping | [required]
**`d_ex`** | **`Float64`** | Exciter natural damping | [required]
**`d_hp`** | **`Float64`** | High pressure turbine natural damping | [required]
**`d_ip`** | **`Float64`** | Intermediate pressure turbine natural damping | [required]
**`d_lp`** | **`Float64`** | Low pressure turbine natural damping | [required]
**`h`** | **`Float64`** | Rotor inertia constant in MWs/MVA | [required]
**`h_ex`** | **`Float64`** | Exciter inertia constant in MWs/MVA | [required]
**`h_hp`** | **`Float64`** | High pressure turbine inertia constant in MWs/MVA | [required]
**`h_ip`** | **`Float64`** | Intermediate pressure turbine inertia constant in MWs/MVA | [required]
**`h_lp`** | **`Float64`** | Low pressure turbine inertia constant in MWs/MVA | [required]
**`k_ex`** | **`Float64`** | Exciter angle coefficient | [required]
**`k_hp`** | **`Float64`** | High pressure turbine angle coefficient | [required]
**`k_ip`** | **`Float64`** | Intermediate pressure turbine angle coefficient | [required]
**`k_lp`** | **`Float64`** | Low pressure turbine angle coefficient | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
