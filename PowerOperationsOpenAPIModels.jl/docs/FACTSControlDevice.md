# FACTSControlDevice

Facts control devices.

Most often used in AC power flow studies as a control of voltage and, active and reactive power.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations. | [required]
**`base_power`** | **`Float64`** | System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA. | [required]
**`bus`** | **`Int64`** | Sending end bus number. | [required]
**`control_mode`** | **`Union{Absent,FACTSControlDeviceControlMode,Nothing}`** | Control mode. Used to describe the behavior of the control device. in psy5 a required param with an option to be nothing | [optional]
**`dynamic_injector`** | **`Union{Absent,Union{Int64,Nothing}}`** | ID of the corresponding dynamic injection model for FACTS control device, if any. | [optional]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`max_reactive_power`** | **`Union{Absent,Float64,Nothing}`** | Independent maximum reactive power ceiling; the device reactive limit is min(the current/susceptance law on max_shunt_current, this value). Non-binding at the 9999.0 default. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu . | [optional]
**`max_shunt_current`** | **`Float64`** | Maximum shunt current at the sending end bus; entered at unity voltage. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu . | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`power_units`** | **`FACTSControlDevicePowerUnits`** | Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit. | [required]
**`reactive_power_required`** | **`Float64`** | Total reactive power required to hold voltage at sending bus, as a fraction in the range 0-1. Units: 1. | [required]
**`regulated_bus_number`** | **`Union{Absent,Int64,Nothing}`** | Bus whose voltage this device regulates; 0 means local (sending) bus (PSS/E FCREG). Units: 1. | [optional]
**`shunt_control_type`** | **`Union{Absent,FACTSControlDeviceShuntControlType,Nothing}`** | Device class selecting the reactive-limit law (SVC vs STATCOM). | [optional]
**`voltage_setpoint`** | **`Float64`** | Voltage setpoint at the sending end bus in kV, it has to be a `PV` bus. Units: kV. Units: per voltage_setpoint_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu . | [required]
**`voltage_setpoint_units`** | **`Union{Absent,FACTSControlDeviceVoltageSetpointUnits,Nothing}`** | Unit basis for voltage_setpoint. COMPONENT_BASE (pu on the bus base voltage) is PSS/E RAW native (VSET). | [optional]
