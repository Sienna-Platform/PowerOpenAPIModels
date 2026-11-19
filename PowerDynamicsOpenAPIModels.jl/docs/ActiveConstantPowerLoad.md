# ActiveConstantPowerLoad

Parameters of 12-states active power load based on the paper, "Dynamic Stability of a Microgrid With an Active Load." It has no bus of its own: exactly one static injection device, with the same name, names it in its `dynamic_injector` property, and that device supplies the rest of its data.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the dynamic injection. Must equal the name of the static injection device that names it in `dynamic_injector`. | [required]
**`r_load`** | **`Float64`** | DC-side resistor | [required]
**`c_dc`** | **`Float64`** | DC-side capacitor | [required]
**`rf`** | **`Float64`** | Converter side filter resistance | [required]
**`lf`** | **`Float64`** | Converter side filter inductance | [required]
**`cf`** | **`Float64`** | AC Converter filter capacitance | [required]
**`rg`** | **`Float64`** | Network side filter resistance | [required]
**`lg`** | **`Float64`** | Network side filter inductance | [required]
**`kp_pll`** | **`Float64`** | Proportional constant for PI-PLL block | [required]
**`ki_pll`** | **`Float64`** | Integral constant for PI-PLL block | [required]
**`kpv`** | **`Float64`** | Proportional constant for Voltage Control block | [required]
**`kiv`** | **`Float64`** | Integral constant for Voltage Control block | [required]
**`kpc`** | **`Float64`** | Proportional constant for Current Control block | [required]
**`kic`** | **`Float64`** | Integral constant for Current Control block | [required]
**`p_ref`** | **`Float64`** | Reference active power (pu). Units: pu. | [required]
**`q_ref`** | **`Float64`** | Reference reactive power (pu). Units: pu. | [required]
**`v_ref`** | **`Float64`** | Reference voltage (pu). Units: pu. | [required]
**`frequency_ref`** | **`Float64`** | Reference frequency, in natural units. Usually equal to the system frequency. Units: Hz. | [required]
**`is_filter_differential`** | **`Bool`** | Boolean to decide if filter states are differential or algebraic | [required]
**`base_power`** | **`Float64`** | Base power for the per-unit parameters of this model. Usually equal to the `base_power` of the static injection device that names this model. Units: MVA. | [required]
