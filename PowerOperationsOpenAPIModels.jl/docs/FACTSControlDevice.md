# FACTSControlDevice

Facts control devices.

Most often used in AC power flow studies as a control of voltage and, active and reactive power.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`bus`** | **`Int64`** | ID of the sending end bus. | [required]
**`control_mode`** | **`Union{Absent,FACTSControlDeviceControlMode,Nothing}`** | Control mode. Used to describe the behavior of the control device. | [optional]
**`max_shunt_current`** | **`Float64`** | Maximum shunt current at the sending end bus; entered at unity voltage. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [required]
**`reactive_power_required`** | **`Float64`** | Total reactive power required to hold voltage at sending bus, as a fraction in the range 0-1. Units: 1. | [required]
**`max_reactive_power`** | **`Union{Absent,Float64,Nothing}`** | Independent maximum reactive power ceiling; the device reactive limit is min(the current/susceptance law on max_shunt_current, this value). Non-binding at the 9999.0 default. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
**`shunt_control_type`** | **`Union{Absent,FACTSControlDeviceShuntControlType,Nothing}`** | Device class selecting the reactive-limit law (SVC vs STATCOM). | [optional]
**`remote_regulated_bus`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the bus whose voltage this device regulates, to the `voltage_setpoint` of that bus (PSS/E FCREG); null regulates the sending end bus. A value equal to `bus` is invalid. | [optional]
**`base_power`** | **`Float64`** | System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA. | [required]
**`power_units`** | **`UnitSystem`** | Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit. | [required]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection model for FACTS control device, if any. | [optional]
