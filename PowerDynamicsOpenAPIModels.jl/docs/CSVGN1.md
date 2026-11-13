# CSVGN1

Parameters of static shunt compensator: CSVGN1 in PSSE It has no bus of its own: exactly one static injection device, with the same name, names it in its `dynamic_injector` property, and that device supplies the rest of its data.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the dynamic injection. Must equal the name of the static injection device that names it in `dynamic_injector`. | [required]
**`k`** | **`Float64`** | Gain in pu (`DEVICE_BASE`) | [required]
**`t1`** | **`Float64`** | Time constant in s. Units: s. | [required]
**`t2`** | **`Float64`** | Time constant in s. Units: s. | [required]
**`t3`** | **`Float64`** | Time constant in s. Units: s. | [required]
**`t4`** | **`Float64`** | Time constant in s. Units: s. | [required]
**`t5`** | **`Float64`** | Time constant in s. Units: s. | [required]
**`rmin`** | **`Float64`** | Reactor minimum MVAr | [required]
**`vmax`** | **`Float64`** | Maximum voltage in pu. Units: pu. | [required]
**`vmin`** | **`Float64`** | Minimum voltage in pu. Units: pu. | [required]
**`cbase`** | **`Float64`** | Capacitor (MVAR) | [required]
**`r_th`** | **`Float64`** | Source Thevenin resistance | [required]
**`x_th`** | **`Float64`** | Source Thevenin reactance | [required]
**`base_power`** | **`Float64`** | Base power for the per-unit parameters of this model. Usually equal to the `base_power` of the static injection device that names this model. Units: MVA. | [required]
