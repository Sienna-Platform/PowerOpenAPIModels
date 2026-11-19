# ACBus

An AC bus.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`number`** | **`Int64`** | A unique bus identification number (positive integer). | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. This field should not be confused with the ISOLATED enum value. | [required]
**`bustype`** | **`Union{ACBusType,Absent,Nothing}`** | Power flow classification of this bus. It does not by itself say which bus voltage is held; the regulating devices and the bus `voltage_setpoint` say that. | [optional]
**`angle`** | **`Union{Absent,Float64,Nothing}`** | Solved voltage angle from the last power flow, or the start value for the next solve. Units: rad. | [optional]
**`magnitude`** | **`Union{Absent,Float64,Nothing}`** | Solved voltage magnitude from the last power flow, or the start value for the next solve, as a multiple of `base_voltage`. This is a result, not a control target; the target is `voltage_setpoint`. Units: pu. | [optional]
**`voltage_setpoint`** | **`Union{Absent,Union{Float64,Nothing}}`** | Scheduled voltage magnitude for this bus, as a multiple of `base_voltage`. It is the target of every device that regulates this bus, at the bus or from a remote terminal. The devices that regulate this bus hold it at this value unless a droop or a reactive power limit prevents it. `null` when no device regulates this bus. Units: pu. | [optional]
**`voltage_limits`** | **`Union{MinMax,Absent,Nothing}`** | Limits on the voltage variation as multiples of `base_voltage`. Units: pu. | [optional]
**`base_voltage`** | **`Union{Absent,Float64,Nothing}`** | The base voltage. Units: kV. | [optional]
**`area`** | **`Union{Absent,Int64,Nothing}`** | ID of the area containing the bus. | [optional]
**`load_zone`** | **`Union{Absent,Int64,Nothing}`** | ID of the load zone containing the bus. | [optional]
