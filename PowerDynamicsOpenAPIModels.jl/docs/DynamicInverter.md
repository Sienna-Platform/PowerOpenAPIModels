# DynamicInverter

Dynamic response model of a grid-connected inverter. It names its function blocks by id: a converter, an active and a reactive power control, an inner control, a DC source, a reference frame rotation (the frequency estimator), a filter, and an optional current limitation. It has no bus of its own: exactly one static injection device, with the same name, names it in its `dynamic_injector` property, and that device supplies the rest of the inverter's data.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the dynamic injection. Must equal the name of the static injection device that names it in `dynamic_injector`. | [required]
**`frequency_ref`** | **`Float64`** | Frequency reference set-point, in natural units. Usually equal to the system frequency. Units: Hz. | [required]
**`converter`** | **`Int64`** | ID of the Converter function block: the converter model. | [required]
**`active_power_control`** | **`Int64`** | ID of the ActivePowerControl function block: the outer active power control. | [required]
**`reactive_power_control`** | **`Int64`** | ID of the ReactivePowerControl function block: the outer reactive power control. | [required]
**`inner_control`** | **`Int64`** | ID of the InnerControl function block: the inner control model. | [required]
**`dc_source`** | **`Int64`** | ID of the DCSource function block: the DC source model. | [required]
**`reference_frame_rotation`** | **`Int64`** | ID of the ReferenceFrameRotation function block: the frequency estimator (PLL) model. | [required]
**`filter`** | **`Int64`** | ID of the Filter function block: the output filter model. | [required]
**`current_limitation`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the CurrentLimitation function block: the output current limiter model, or null when the inverter has no limiter. | [optional]
**`base_power`** | **`Float64`** | Base power for the per-unit parameters of the referenced function blocks. Usually equal to the `base_power` of the static injection device that names this model. Units: MVA. | [required]
