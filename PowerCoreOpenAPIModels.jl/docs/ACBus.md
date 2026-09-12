# ACBus

An AC bus.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`number`** | **`Int64`** | A unique bus identification number (positive integer). | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. This field should not be confused with the ISOLATED enum value. | [required]
**`bustype`** | **`Union{ACBusType,Absent,Nothing}`** | Used to describe the connectivity and behavior of this bus. in psy5 a required param with an option to be nothing | [optional]
**`angle`** | **`Union{Absent,Float64,Nothing}`** | Angle of the bus. Units: rad. | [optional]
**`magnitude`** | **`Union{Absent,Float64,Nothing}`** | Voltage as a multiple of `base_voltage`. Units: pu. | [optional]
**`voltage_limits`** | **`Union{MinMax,Absent,Nothing}`** | Limits on the voltage variation as multiples of `base_voltage`. Units: pu. | [optional]
**`base_voltage`** | **`Union{Absent,Float64,Nothing}`** | The base voltage. Units: kV. | [optional]
**`area`** | **`Union{Absent,Int64,Nothing}`** | ID of the area containing the bus. | [optional]
**`load_zone`** | **`Union{Absent,Int64,Nothing}`** | ID of the load zone containing the bus. | [optional]
