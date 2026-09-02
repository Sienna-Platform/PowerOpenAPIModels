# DCBus

A DC bus.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`area`** | **`Union{Absent,Int64,Nothing}`** | ID of the area containing the DC bus. | [optional]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`base_voltage`** | **`Union{Absent,Float64,Nothing}`** | The base voltage. in psy5 a required param with an option to be nothing Units: kV. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`load_zone`** | **`Union{Absent,Int64,Nothing}`** | ID of the load zone containing the DC bus. | [optional]
**`magnitude`** | **`Union{Absent,Float64,Nothing}`** | Voltage as a multiple of `base_voltage`. in psy5 a required param with an option to be nothing Units: pu. | [optional]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`number`** | **`Float64`** | A unique bus identification number (positive integer). | [required]
**`voltage_limits`** | **`Union{Absent,DCBusVoltageLimits,Nothing}`** | Limits on the voltage variation as multiples of `base_voltage`. in psy5 a required param with an option to be nothing Units: pu. | [optional]
